var express = require("express");
var router = express.Router();
const far_utils = require("../routes/utils/far_utils");

router.use("/addMatch", async (req, res, next) => {
    try{
        //check if user has FAR access
        const isValid = await far_utils.checkIfFarIsValid(req.session.userId); 
        isValid ? next() :  () => {throw { status: 500, message: "user is not in FAR table" }};
        

    } catch(error){
        next(error);
    }
})

router.post("/addMatch", async (req, res, next) => {
    try{
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
        res.send("Match added successfully");

    } catch(error){
        next(error);
    }
})

module.exports = router;