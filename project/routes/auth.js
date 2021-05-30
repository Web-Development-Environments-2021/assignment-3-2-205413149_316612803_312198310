var express = require("express");
var router = express.Router();
const DButils = require("../routes/utils/DButils");
const bcrypt = require("bcryptjs");

router.post("/Register", async (req, res, next) => {
  try {
    // parameters exists
    // valid parameters
    // username exists
    const users = await DButils.execQuery(
      "SELECT username FROM dbo.users"
    );

    if (users.find((x) => x.username === req.body.username))
      throw { status: 409, message: "Username taken" };

    //hash the password
    let hash_password = bcrypt.hashSync(
      req.body.password,
      parseInt(process.env.bcrypt_saltRounds)
    );
    req.body.password = hash_password;

    // add the new username
    await DButils.execQuery(
      `INSERT INTO dbo.users (username, firstname, lastname, country, password, email, image) 
       VALUES 
      ('${req.body.username}', '${req.body.firstname}', '${req.body.lastname}', '${req.body.country}', '${hash_password}', '${req.body.email}', '${req.body.image}')`
    );
  
    res.status(201).send("user created");
  } catch (error) {
    next(error);
  }
});

function checkIfLoginParamsExist(loginObj){
  if (!('username' in loginObj) || !('password' in loginObj) ){
    return false;
  }
  return true;
}

router.post("/Login", async (req, res, next) => {
  try {
    //check Parameters recieved from client
    if(!checkIfLoginParamsExist(req.body)){
      throw {status: 400, message: "Bad Request. Wrong Input Parameters"};
    }

    const user = await auth_domain.loginUser(req.body.username, req.body.password)
    if (user === null){
      throw { status: 401, message: "Username or Password incorrect" };
    }

    // Set cookie
    req.session.userId = user.userId;

    // return cookie
    res.status(200).send("login succeeded");
  } catch (error) {
    next(error);
  }
});

router.post("/Logout", function (req, res) {
  req.session.reset(); // reset the session info --> send cookie when  req.session == undefined!!
  res.send({ success: true, message: "logout succeeded" });
});

module.exports = router;
