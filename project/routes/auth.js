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

    const user = await loginUser(req.body.username, req.body.password)
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

router.get("/profile/:userName", async function (req, res) {
  try
  {
    let userName = req.params.userName;
    userName = userName.replace(":","");
    const userProfile = await getUser(userName); 
    let data = []; 
    data.push(userProfile);
    res.status(200).send(data);
  }
  catch (error)
  {
    console.log(error);
    res.status(500).send("problem with server");
  }
  
});



async function loginUser(username, password){
  //Sending request to the Data Layer
  const user = await getUser(username);
  // check that username exists & the password is correct
  if (!user || !bcrypt.compareSync(password, user.password)) {
    return null;
  }
  return user;
}

async function getUser(username){
  //get user from DB
  const user = (
      await DButils.execQuery(
        `SELECT * FROM dbo.users WHERE username = '${username}'`
      )
    )[0];
  return user;
}

router.get("/allUsers", async (req, res, next) => {
  try {
    const fars = await DButils.execQuery(
      "SELECT * FROM dbo.FARs"
    );

    if (fars.find((x) => x.FARId !== req.session.userId))
      res.send([]);

      res.send([req.session.userId])
  } catch (error) {
    next(error);
  }
});

module.exports = router;
