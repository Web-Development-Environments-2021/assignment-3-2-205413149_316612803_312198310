var express = require("express");
var router = express.Router();
const matches_utils = require("./utils/matches_utils");

//route for search of a past games by stage
router.get("/searchMatches", async (req, res, next) => {
    try{
        let pastMatches = {};
        pastMatches = await matches_utils.getMatchesByStage();
        res.send(pastMatches);

    } catch(error){
        next(error);
    }
})

module.exports = router;