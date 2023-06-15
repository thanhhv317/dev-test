// get the client
const mysql = require("mysql2");

// create the connection to database

let connection;

const initConnection = (config) => {
  if (!connection) {
    connection = mysql.createConnection({
      host: config.host,
      user: config.user,
      database: config.databse,
      password: config.password,
    });
  }

  return connection;
};

module.exports.initConnection = initConnection;
module.exports.connection = connection;
