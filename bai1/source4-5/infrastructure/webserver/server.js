'use strict';

var express = require("express");
const cors = require("cors");
const { createServer } = require("http")

const studentRouter = require("../../interfaces/routes/student.route")

var app = express();


app.use(cors());
app.use(express.json());

app.use("/students", studentRouter);
app.get('*', function (req, res) {
  res.status(404).json({
    message: "Page not found"
  });
});

const httpServer = createServer(app);

module.exports = httpServer;