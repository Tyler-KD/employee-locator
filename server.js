// Import Express.js
const express = require('express');
// imports inquirer
// inquirer provides the user interface and the inquiry session flow
const inquirer = require('inquirer');
// Import mysql
const mysql = require('mysql2');
// Imports file system
const fs = require('fs');
// Imports the path module
const path = require('path');
// _dirname is an environment variable that tells the absolute path of the directory containing the currently executing file
// Joins 2 path-segments
const queriesPath = path.join(__dirname,'db', 'queries.sql');
// Calls the readFileSync () method to read queriesPath
const queriesContent = fs.readFileSync(queriesPath, 'utf-8');
// Reads the file content as a string and split it into separate queries based on the delimiter (;)
// Creates array for each query
const queries = queriesContent.split(';').map(query => query.trim());

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
    db.query(queries[0], function (err, queries) {
        // The console.table() static method displays tabular data as a table
        // Outputs the content of the queries file
        console.table(queries);
        // Return to main menu
        init();
    })
};

// View all roles
function view_AllRoles() {
    db.query(queries[1], function (err, queries) {
        console.table(queries);
        init();
    })
};

// View all employees
function view_Employees() {
    // console.log(queries[2])
    db.query(queries[2], function (err, queries) {
        // if (err) console.log(err)
        // console.log(queries)
        console.table(queries);
        init();
    })
};

// Add Department
function add_Department() {
    inquirer.prompt ([
        {
            type: "input",
            message: "What is the name of the department?",
            name: "department"
        }
    ])
    .then(async (answer) => {
        var DepartmentAdd = await db.promise().query("INSERT INTO departments SET ?", answer); 
        console.log("Department added to database");
        // console.log(DepartmentAdd);
        init();
    })
};

// Add a Role
function add_Role() {
    const query = "SELECT * FROM departments";
    db.query(query, (err, res) => {
        if (err) throw err;
        // Choices for department are mapped with the id and department name into an array for user
        const Array_Department = res.map((departments) => ({
            value: departments.id,
            name: `${departments.department}`
        }));
        // inquirer prompt for taking in title, salary, and department for role
        inquirer.prompt ([
            {
                type: "input",
                message: "What is the name of the role?",
                name: "role_title"
    
            },
            {
                type: "input",
                message: "What is the salary of the role?",
                name: "role_salary",
    
            },
            {
                type: "list",
                message: "Which department does the role belong to?",
                name: "department",
                choices: Array_Department,
            },
        ])
        .then(async (answer) => {
            // query for adding a role with title, salary, and department name into table role
            var RoleDepartmentAdd = await db.promise().query("INSERT INTO role SET ?", {
                title: answer.role_title,
                salary: answer.role_salary,
                department_id: answer.department,
            }); 
            console.log(`Role added to database`);
            // console.log(RoleDepartmentAdd);
            init();
        })
    })

};

// Add an Employee
function add_Employee() {
    const query = "SELECT * FROM role";
    db.query(query, (err, res) => {
        if (err) throw err;
        // Choices for role are mapped with the id and role name into an array for user
        const Array_Role = res.map((role) => ({
            value: role.id,
            name: `${role.title}`
        }));
        const query = "SELECT * FROM employee";
        // const query = "SELECT id AS value, CONCAT(first_name, '', last_name) AS name FROM employee";
        db.query(query, (err, res) => {
            if (err) throw err;
            const Array_Manager = res.map((employee) => ({
                value: employee.id,
                name: `${employee.manager_id}`
            }))
        
        inquirer.prompt ([
            {
                type: "input",
                message: "What is the employee's first name?",
                name: "role_firstName"
            },
            {
                type: "input",
                message: "What is the employee's last name?",
                name: "role_lastName"
            },
            {
                type: "list",
                message: "What is the employee's role?",
                name: "employee_role",
                choices: Array_Role,
            },
            {
                type: "list",
                message: "Who is the employee's manager?",
                name: "employee_manager",
                choices: Array_Manager,
            },
        ])
        .then (async (answer) => {
            var EmployeeAdd = await db.promise().query("INSERT INTO employee SET ?", {
               first_name: answer.role_firstName,
               last_name: answer.role_lastName,
               role_id: answer.employee_role,
               manager_id: answer.employee_manager,
            });
            console.log('Employee added to database');
            init();
        })
    })});
}

// Call to initialize the app
init();

// listen() method is responsible for listening for incoming connections on the specified port
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});