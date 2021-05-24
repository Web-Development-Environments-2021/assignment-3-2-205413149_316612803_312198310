const { forEach } = require("async");
const DButils = require("./DButils");

async function getMatchesByStage() {
    const matches = await DButils.execQuery(
      `select * from matches`
    );

    console.log(matches)
    return matches;
  }

async function getMatchById(matchId) {
  const matches = await DButils.execQuery(
    `select * from matches where matches.matchId=${matchId}`
  );

  console.log(matches)
  return matches;
}


  exports.getMatchesByStage = getMatchesByStage;
  exports.getMatchById = getMatchById;

  // `select matches.matchId ,matches.matchDate ,matches.matchHour ,matches.hostTeam , matches.guestTeam, matches.staduim ,matches.coachID ,matches.score ,eventLog.eventHour as Time,eventLog.eventDescription as Description from matches left join eventLog on matches.matchId = eventLog.matchId`