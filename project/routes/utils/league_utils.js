const axios = require("axios");
const DButils = require("./DButils");
const api_domain = "https://soccer.sportmonks.com/api/v2.0";
// const TEAM_ID = "85";
const LEAGUE_ID = 271;

async function getLeagueDetails() {
  const league = await axios.get(
    `${api_domain}/leagues/${LEAGUE_ID}`,
    {
      params: {
        include: "season",
        api_token: process.env.api_token,
      },
    }
  );
  
  if(league.data.data.current_stage_id === null){
    return {
      league_name: league.data.data.name,
      current_season_name: league.data.data.season.data.name,
      current_stage_name: null,
      nextGame: null,
      // next game details should come from DB
    };
  }

  const stage = await axios.get(
    `${api_domain}/stages/${league.data.data.current_stage_id}`,
    {
      params: {
        api_token: process.env.api_token,
      },
    }
  );
  const nextGame = await DButils.execQuery(
    `select TOP 1 * from matches where matches.score is NULL`
  );
  
  return {
    league_name: league.data.data.name,
    current_season_name: league.data.data.season.data.name,
    current_stage_name: stage.data.data.name,
    nextGame: nextGame,
    // next game details should come from DB
  };
}


exports.getLeagueDetails = getLeagueDetails;
