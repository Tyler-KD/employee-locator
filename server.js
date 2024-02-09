// Import Express.js
const express = require('express');
// Import mysql
const mysql = require('mysql2');

// Specify which port the Express.js server will run.
// process.env.PORT stores the port number on which a web server should listen for incoming connections.
const PORT = process.env.PORT || 3001;

// Initialize an instance of Express.js
const app = express();

// Middleware for parsing JSON and urlencoded form data
app.use(express.urlencoded({ extended: false }));
app.use(express.json());




// listen() method is responsible for listening for incoming connections on the specified port
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});