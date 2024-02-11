// Import Express.js
const express = require('express');
// imports inquirer
// inquirer provides the user interface and the inquiry session flow
const inquirer = require('inquirer');
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

// Connect to database
const db = mysql.createConnection(
    {
        host: 'localhost',
        // MySQL username
        user: 'root',
        password: 'Y<k45OiRE6qm',
        database: 'employeeLocator_db'
    }
)

// Function for the main menu
function init() {
    inquirer.prompt([
        {
            type: "list",
            message: "What would you like to do?",
            name: "action",
            choices: [
                "View All Employees",
                "Add Employee",
                "Update Employee Role",
                "View All Roles",
                "Add a Role",
                "View All Departments",
                "Add Department",
                "Quit",
            ]
        }
    ])
    .then(answer => {
        switch (answer.action) {
            case "View All Employees":
                view_Employees();
            case "Add Employee":
                add_Employee();
            case "View All Roles":
                view_AllRoles();
            case "Add a Role":
                add_Role();
            case "View All Departments":
                view_allDepartments();
            case "Add Department":
                add_Department();
            case "Quit":
                db.end();
                console.log("Goodbye!");
        }
    })
};


// Call to initialize the app
init();

// listen() method is responsible for listening for incoming connections on the specified port
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});