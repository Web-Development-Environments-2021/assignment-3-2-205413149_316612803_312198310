var express = require("express");
var router = express.Router();
const DButils = require("./utils/DButils");
const users_utils = require("./utils/users_utils");
const matches_utils = require("./utils/matches_utils");

/**
 * Authenticate all incoming requests by middleware
 */
 router.use(async function (req, res, next) {
  if (req.session && req.session.userId) {
    DButils.execQuery("SELECT userId FROM users")
      .then((users) => {
        if (users.find((x) => x.userId === req.session.userId)) {
          req.userId = req.session.userId;
          next();
        }
      })
      .catch((err) => next(err));
  } else {
    res.sendStatus(403);
  }
});

router.post("/favoriteMatches", async (req, res, next) => {
  try {
    const userId = req.session.userId;
    const matchId = req.body.matchId;
    let numOfTeams = await matches_utils.getMatchById(matchId)

    if(numOfTeams == 0){      
      throw{status: 404, message: "matchId does not exist"}
    }    

    numOfTeams = await users_utils.getFavoriteMatchByMatchId(matchId);
    if(numOfTeams > 0){
        throw{status: 401, message: "match already added to user's favorites."}
      }

    await users_utils.markMatchAsFavorite(userId, matchId);
    res.status(201).send("The match successfully saved as favorite");

  } catch (error) {
    next(error);
  }
});


/**
 * This path returns the favorites matches that were saved by the logged-in user
 */
router.get("/favoriteMatches", async (req, res, next) => {
  try {
    const userId = req.session.userId;
    const matchIds = await users_utils.getFavoriteMatches(userId);
    if(matchIds.length == 0){
      // throw{status: 404, message: "no matches to the specified user"}
      res.status(200).send("NO")
    }
    else{
      const matches_info = await matches_utils.getAllMatchesByIds(matchIds);   
      res.status(200).send(matches_info);
    }
    next()
  } catch (error) {
    next(error);
  }
});

/**delete user's favorite match */
router.delete("/favoriteMatches/:matchId", async (req, res, next) => {
  try {
    const userId = req.session.userId;
    const matchIds = await users_utils.getFavoriteMatches(userId);
    if(matchIds.length == 0){
      throw{status: 404, message: "no matches to the specified user"}
    }

    let isValid = false;
    matchIds.forEach(match => {
      if (match.matchId.toString() == req.params.matchId){
        isValid = true;
      }
    })

    if(!isValid){
      throw{status: 409, message: "match does not exist in user's favorites"}
    }

    await matches_utils.deleteFromFavoriteMatches(req.params.matchId);   
    res.status(200).send("favorite match deleted successfuly");
  } catch (error) {
    next(error);
  }
});

module.exports = router;
