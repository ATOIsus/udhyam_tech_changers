const express = require("express");
const router = express.Router();

const supplierController = require("../controllers/supplier-controllers");

router
  .route("/")
  .get(supplierController.createUser)

  .post((req, res, next) => {
    res.status(405).json({ error: "POST request is not allowed!" });
  })

  .put((req, res, next) => {
    res.status(405).json({ error: "PUT request is not allowed!" });
  })

  .delete((req, res, next) => {
    res.status(405).json({ error: "DELETE request is not allowed!" });
  });

module.exports = router;
