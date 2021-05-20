var express = require("express");
var router = express.Router();
const DButils = require("./utils/DButils");
const players_utils = require("./utils/players_utils");
const teams_utils = require("./utils/teams_utils");

router.get("/teamFullDetails/:teamId", async (req, res, next) => {
   let players_details = [];
  try {
    const players_details = await players_utils.getPlayersByTeam(
      req.params.teamId
    );
    const coach_details = await teams_utils.getCoachByTeam(
      req.params.teamId
    );
    // TODO - add games history

    res.send({ players: players_details,
               coach: coach_details });
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
