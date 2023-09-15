const express = require("express");
const router = express.Router();

const userController = require("../controllers/user-controller");


router
  .route("/signup")
  //Add new user.
  .post(userController.signUpUser);

router
  .route("/signin")
  // User login.
  .post(userController.signInUser);

router
  .route("/info")
  //Get information of specific user.
  .get(userController.getSingleUser);

router
  .route("/requestwater")
  //Request water.
  .post(userController.requestWater);

module.exports = router;
