var express = require("express");
var router = express.Router();
const matches_utils = require("./utils/matches_utils");

//route for search of a past games by stage
router.get("/searchMatches", async (req, res, next) => {
    try{
        let Matches = {};
        Matches = await matches_utils.getMatchesByStage();
        if(Matches == 0)
        {
            res.status(500).send("Match events not found in the server");
            
        }
        else
        {
            res.status(200).send(Matches);
        }

    } catch(error){
        res.status(500).send("Match events not found in the server");
        next(error);
    }
})

//route for search of a past games by stage
router.get("/searchMatchEventLog/:matchId", async (req, res, next) => {
    try{
        let events = {};
        events = await matches_utils.getMatchEventByMatch(req.params.matchId);
        let eventsLength = Object.size(events);
        if(eventsLength == 0)
        {
            res.status(404).send("Match Id not in the EventLog");
            
        }
        else
        {
            res.status(200).send(events);
        }
        
        
    } catch(error){
        res.status(500).send("Match Id not Found Because Of A Server Error");
        next(error);
    }
})
module.exports = router;