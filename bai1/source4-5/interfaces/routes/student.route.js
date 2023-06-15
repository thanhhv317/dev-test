const express = require("express");
const router = express.Router();
const studentController = require("../controllers/student.controller");

router.get("/scores/:id", studentController.getScore);
router.put("/scores/:id", studentController.updatePost);

module.exports = router;
