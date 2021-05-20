var express = require("express");
var router = express.Router();
const DButils = require("./utils/DButils");
const players_utils = require("./utils/players_utils");
const teams_utils = require("./utils/teams_utils");

router.get("/teamFullDetails/:teamId", async (req, res, next) => {
  let team_details = [];
  try {
    const team_details = await players_utils.getPlayersByTeam(
      req.params.teamId
    );
    //we should keep implementing team page.....
    res.send(team_details);
  } catch (error) {
    next(error);
  }
});

router.get("/searchTeamByName/:teamName", async (req, res, next) => {
  try{
      let players = {};
      players = await teams_utils.getTeamByName(req.params.teamName);
      res.send(players);

  } catch(error){
      next(error);
  }
})

module.exports = router;
