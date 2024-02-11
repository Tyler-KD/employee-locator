// Import Express.js
const express = require('express');
// imports inquirer
// inquirer provides the user interface and the inquiry session flow
const inquirer = require('inquirer');
// Import mysql
const mysql = require('mysql2');
// Imports console.table
const cTable = require('console.table');

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

// Function for initializing the main menu inquirer prompts
function init() {
    inquirer.prompt([
        {
            type: "list",
            message: "What would you like to do?",
            name: "action",
            choices: [
                "View All Departments",
                "Add Department",
                "View All Roles",
                "Add a Role",
                "View All Employees",
                "Add Employee",
                "Update Employee Role",
                "Quit",
            ]
        }
    ])
        .then(answer => {
            // Instead of writing many if...else statements, the switch statement selects one of many code blocks to be executed.
            // If there is a match between the value of the expression with the values of each case, then the associated block of code is executed.
            switch (answer.action) {
                case "View All Departments":
                    view_allDepartments();
                    // The break stops the execution of more code and case testing inside the block.
                    break;
                case "View All Roles":
                    view_AllRoles();
                    break;
                case "View All Employees":
                    view_Employees();
                    break;
                case "Add Department":
                    add_Department();
                    break;
                case "Add Employee":
                    add_Employee();
                    break;
                case "Add a Role":
                    add_Role();
                    break;
                case "Update Employee Role":
                    update_employeeRole();
                case "Quit":
                    // Ends connection to database
                    db.end();
                    console.log("Goodbye!");
                    break;
            }
        })
};

// View all departments
function view_allDepartments() {
    db.query("SELECT * from department", function (err, results) {
        // The console.table() static method displays tabular data as a table
        console.table(results);
        // Return to main menu
        init();
    })
};

// Call to initialize the app
init();

// listen() method is responsible for listening for incoming connections on the specified port
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});