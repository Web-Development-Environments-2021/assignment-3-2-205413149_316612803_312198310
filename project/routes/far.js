var express = require("express");
var router = express.Router();
const far_utils = require("../routes/utils/far_utils");

router.use("/addMatch", async (req, res, next) => {
    try{
        //check if user has FAR access
        const isValid = await far_utils.checkIfFarIsValid(req.session.userId); 
        if(isValid){next()}
        else{throw { status: 500, message: "user is not in FAR table OR try to log in first" }};
        

    } catch(error){
        next(error);
    }
})

router.post("/addMatch", async (req, res, next) => {
    try{

        if(!('league' in req.body) ||
        !('season' in req.body) ||
        !('stage' in req.body) ||
        !('matchDate' in req.body) ||
        !('matchHour' in req.body) ||
        !('hostTeam' in req.body) ||
        !('guestTeam' in req.body) ||
        !('stadium' in req.body) ||
        !('refereeId' in req.body)){
            throw{status: 400, message: "Bad Request. Wrong Input Parameters"}
        }

        if(!(/^(\d{4})\-(\d{1,2})\-(\d{1,2})$/.test(req.body.matchDate))){
            throw{status: 400, message: "Bad Request. Wrong Input Parameters"}
        }
        
        let score = null;
        if (req.body.score !== undefined){
            score = req.body.score
        }

        const{league, season, stage, matchDate, matchHour, hostTeam, guestTeam, stadium, refereeId} = req.body
        await far_utils.addMatchToDB({
            league: league,
            season: season,
            stage: stage,
             matchDate: matchDate, 
             matchHour: matchHour, 
             hostTeam: hostTeam,
             guestTeam: guestTeam, 
             stadium: stadium,
             refereeId: refereeId, 
             score: score
        })
        res.status(200).send("Match added successfully");

    } catch(error){
        next(error);
    }
})

module.exports = router;