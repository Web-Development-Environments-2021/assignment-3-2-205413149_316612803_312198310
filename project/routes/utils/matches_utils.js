const { forEach } = require("async");
const DButils = require("./DButils");

async function getMatchesByStage() {
    const matches = await DButils.execQuery(
      `select * from matches`
    );

    console.log(matches)
    return matches;
  }


  exports.getMatchesByStage = getMatchesByStage;

  // `select matches.matchId ,matches.matchDate ,matches.matchHour ,matches.hostTeam , matches.guestTeam, matches.staduim ,matches.coachID ,matches.score ,eventLog.eventHour as Time,eventLog.eventDescription as Description from matches left join eventLog on matches.matchId = eventLog.matchId`