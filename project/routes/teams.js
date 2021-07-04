var express = require("express");
var router = express.Router();
const players_utils = require("./utils/players_utils");
const teams_utils = require("./utils/teams_utils");
const LEAGUE_ID = 271;
//route after user selects a specific team. show full details by teamId.
router.get("/teamFullDetails/:teamId", async (req, res, next) => {
  //  let players_details = [{
  //   player_id: 14685598,
  //   name: "Daniel Andersen",
  //   image: "https://cdn.sportmonks.com/images/soccer/players/4/191012.png",
  //   position: 1,
  //   team_name: "AGF"
  // }];
  
  try {
    const players_details = await players_utils.getPlayersByTeam(
      req.params.teamId
    );

    const teamName = await teams_utils.getTeamNameById(
      req.params.teamId
    );

    const matches = await teams_utils.getTeamMatchesByName(
      teamName
    );
    
    // const coach_details = await teams_utils.getCoachByTeam(
    //   req.params.teamId
    // );
    // TODO - add games history

    res.send({ id: req.params.teamId,
              teamName: teamName,
              players: players_details,
              teamMatches: matches
               });
  } catch (error) {
    next(error);
  }
});

//route for search a team by name. returns partial data.
router.get("/searchTeamByName/:teamName", async (req, res, next) => {
  try{     

      const teams = await teams_utils.getTeamByName(req.params.teamName);
      if(teams === undefined || teams.length == 0){
        res.status(404).send("Bad Request. no such team.") 
        // throw{status: 404, message: "Bad Request. no such team."}
      }
      
      //await teams_utils.getAllTeamsByCountryId(320);
      if(teams.length > 20){
        res.send(teams.slice(0, 20));
      }
      else{
        res.send(teams);
      }
      

  } catch(error){
      next(error);
  }
})

module.exports = router;
