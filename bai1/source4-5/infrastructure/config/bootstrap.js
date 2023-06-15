"use strict";

require("dotenv").config();

module.exports = {
  async init() {
    const { initConnection } = require("../orm/mysql/mysql");
    initConnection({
      host: process.env.DATABASE_HOST,
      user: process.env.DATABASE_USERNAME,
      databse: process.env.DATABASE_NAME,
      password: process.env.DATABASE_PASSWORD,
    });
  },
};
