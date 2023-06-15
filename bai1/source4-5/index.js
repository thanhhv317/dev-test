'use strict';

const httpServer = require('./infrastructure/webserver/server');
const bootstrap = require('./infrastructure/config/bootstrap');

// Start the server
const start = async () => {

  try {
    await bootstrap.init();
    const port = process.env.HTTP_PORT || '3000';

    httpServer.listen(port, () => {
      console.log("WS running on port " + port);
    })

  } catch (err) {
    console.log(err);
    process.exit(1);
  }
};

start();