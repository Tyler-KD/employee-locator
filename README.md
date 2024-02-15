# employee locator

![GitHub License](https://img.shields.io/badge/license-MIT-default.svg)

## Description

Employee Locator is an application to manage a company's employee database, using Node.js, Inquirer, and MySQL.  It was built to practice SQL skills by creating an interface that allows non-developers to easily view and interact with information stored in databases.  This project solves the problem of wanting to be able to view and manage the departments, roles, and employees in a company so that a business can be organized and planned.  Some things which were learned throughout Employee Locator are that designing a database schema helps visualize Primary and Foreign Key relationships between tables, pre-populating table data helps make the development of individual features much easier, SQL syntax is unforgiving and must be accurate for desired results, and the data relationships between inquirer prompt input and SQL statements can be achieved in a variety of methods.

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
* [Video](#video)
* [Deployed Site](#deployed-site)
* [Credits](#credits)
* [Contributing](#contributing)
* [License](#license)
* [Tests](#tests)
* [Features](#features)
* [Questions](#questions)

## Installation

Within the main directory, install express.js by running "npm i express" within the terminal.  Then, install inquirer by running "npm i inquirer" in the terminal.  Inquirer provides the user interface and inquiry session flow.  Next, install MySQL by running "npm i mysql" within the terminal.  MySQL is a robust database management system designed for managing relational databases.  After, install dependencies by running "npm i" inside the terminal.  Source all of the database sql files.  First, log into MySQL by running "mysql -u root -p" inside the terminal.  For password, use MySQL root password.  Finally, run "source db/schema.sql;", "source db/seeds.sql;" and "source db/queries.sql;" inside of MySQL to source all files.  Enter "Quit;" to exit MySQL.

## Usage

To run Employee Locator, open up the terminal and start the application with command "node server.js."  A prompt will appear with several choices.  "View All Departments" will display a formatted table showing department ids and department names.  "View All Roles" will display role id, role title, the department that role belongs to, and the salary for that role.  "View All Employees" will display employee ids, first names, last names, roles, departments, salaries, and managers that the employees report to.  When choosing "Add Department," a prompt will ask for a department name and that department will be added to the database.  When choosing "Add a Role," enter the prompt asking for the name, salary, and department for that role.  This role will then be added to the database.  When choosing "Add Employee," enter the prompt asking for the employee's first name, last name, role, and manager.  This employee will then be added to the database.  When choosing "Update Employee Role," enter the prompt asking for which employee's role to update and which role to assign the selected employee.  This employee's role will then be updated within the database.  When choosing "Update Employee Manager," enter the prompt asking for which employee to update and which manager to assign the selected employee.  "Delete Department," "Delete a Role," and "Delete Employee" will remove the respective selections from drop down lists.  "View All Employees by Manager" and "View All Employees by Department" will display all employees sorted by manager or department.  "View All Department Budgets" displays the combined salaries of all employees in that department.  "Quit" will exit the application.

**Attached is a screenshot of View All Departments, View All Roles, and View All Employees within the inquirer prompt:**

![Inquirer Prompt Screenshot](./assets/images/Employee%20Locator%20screenshot.png)

## Video

[Employee Locator Walkthrough](https://drive.google.com/file/d/1STt6HhPyonwzMbFAUm-v0LzSc_9EEXBq/view?usp=drive_link)

## Deployed Site

N/A

## Credits

[inquirer - npm](https://www.npmjs.com/package/inquirer)

[Java Switch](https://www.w3schools.com/java/java_switch.asp)

[console.table - npm](https://www.npmjs.com/package/console.table)

[Node.js MySQL Select From](https://www.w3schools.com/nodejs/nodejs_mysql_select.asp)

[How To Use _dirname](https://www.digitalocean.com/community/tutorials/nodejs-how-to-use__dirname)

[path.join() method](https://www.geeksforgeeks.org/node-js-path-join-method/)

[fs.readFileSynce() Method](https://www.geeksforgeeks.org/node-js-fs-readfilesync-method/)

[SQL LEFT JOIN](https://www.w3schools.com/sql/sql_join_left.asp)

[MySQL CONCAT() Function](https://www.w3schools.com/sql/func_mysql_concat.asp)

[SQL WHERE CLAUSE](https://www.w3schools.com/SQl/sql_where.asp)

[SQL Constraints](https://www.w3schools.com/sql/sql_constraints.asp)

[MySQL ON DELETE CASCADE](https://www.geeksforgeeks.org/mysql-on-delete-cascade-constraint/)

[SQL ORDER BY](https://www.w3schools.com/sql/sql_ref_order_by.asp)

[SQL SUM() Function](https://www.w3schools.com/SQl/sql_sum.asp)

[SQL GROUP BY Statement](https://www.w3schools.com/sql/sql_groupby.asp)

[cfonts - npm](https://www.npmjs.com/package/cfonts)

## Contributing

N/A

## License

MIT License

Copyright (c) 2024 Tyler-KD

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

* (https://choosealicense.com/licenses/mit/)

## Tests

N/A

## Features

Node.js, npm (node package manager), express.js 4.18.2, inquirer 8.2.4, MySQL2 3.9.1, fs (File System), path module, console.table 0,10,0, cfonts 3.2.0

## Questions

If you have any questions, please visit [GitHub/Tyler-KD](https://github.com/Tyler-KD) or submit questions to tyler.kd.knapp@gmail.com.