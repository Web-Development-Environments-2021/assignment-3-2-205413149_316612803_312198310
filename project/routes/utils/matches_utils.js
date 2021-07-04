const { forEach } = require("async");
const DButils = require("./DButils");

// all matches are stage 10 for now.
async function getMatchesByStage() {
    const matches = await DButils.execQuery(
      `select * from matches where matches.stage=10`
    );
    console.log("gal")
    return matches;
  }

async function getMatchEventByMatch(matchId) {
  const events = await DButils.execQuery(
    `select * from eventLog where eventLog.matchId = ${matchId}`
  );
  return events;
}


async function getAllMatchesByIds(matchIds){
  let match_ids_array = [];
  matchIds.map((element) => match_ids_array.push(element.matchId)); //extracting the matches ids into array
  let results = [];
  match_ids_array.map((id) =>{
    results.push(getMatchByIdFullDetails(id));      
    });
  let matches_info = await Promise.all(results);
  return matches_info
}

//chack amount of matches only
async function getMatchById(matchId) {
  const matches = await DButils.execQuery(
    `select * from matches where matches.matchId=${matchId}`
  );

  return matches.length;
}

//get full details of match.
async function getMatchByIdFullDetails(matchId) {
  const matches = await DButils.execQuery(
    `select * from matches where matches.matchId=${matchId}`
  );

  return matches;
}

async function deleteFromFavoriteMatches(matchId){
  await DButils.execQuery(
    `delete from favoriteMatches where favoriteMatches.matchId=${matchId}`
  );
}


  exports.getMatchesByStage = getMatchesByStage;
  exports.getMatchById = getMatchById;
  exports.getMatchEventByMatch = getMatchEventByMatch;
  exports.getAllMatchesByIds = getAllMatchesByIds;
  exports.deleteFromFavoriteMatches = deleteFromFavoriteMatches;

  // `select matches.matchId ,matches.matchDate ,matches.matchHour ,matches.hostTeam , matches.guestTeam, matches.staduim ,matches.coachID ,matches.score ,eventLog.eventHour as Time,eventLog.eventDescription as Description from matches left join eventLog on matches.matchId = eventLog.matchId`