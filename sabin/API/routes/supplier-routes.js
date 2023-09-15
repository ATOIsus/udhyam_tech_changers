const express = require("express");
const router = express.Router();

const supplierController = require("../controllers/supplier-controller");

router
  .route("/dashboard")
  .get(supplierController.createUser)


module.exports = router;
