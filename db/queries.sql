-- Returns all columns from table: department
SELECT * from departments;

-- Returns all columns from table: role and joins department.id
SELECT role.id, role.title, departments.department, role.salary
FROM role
JOIN departments ON role.department_id = departments.id;

-- Returns all columns from table: employee, joins role.id, joins departments.id, and LEFT JOINS employee.id
SELECT emp_1.id, emp_1.first_name, emp_1.last_name, role.title, departments.department, role.salary, CONCAT(emp_2.first_name, " ", emp_2.last_name) AS manager
FROM employee emp_1
JOIN role ON emp_1.role_id = role.id
JOIN departments on role.department_id = departments.id
-- LEFT JOIN returns all records from the left table (employee emp_1), and the matching records from the right table (employee emp_2).  
-- The result is 0 records from the right side, if there is no match.
LEFT JOIN employee emp_2
-- Selects all managers that the employees report to
ON emp_1.manager_id = emp_2.id;

-- Returns columns id and manager_id from table: employee and LEFT JOINS employee.manager_id
SELECT CONCAT(emp_1.first_name, " ", emp_1.last_name) AS employee, CONCAT(emp_2.first_name, " ", emp_2.last_name) AS manager
FROM employee emp_1
LEFT JOIN employee emp_2
-- Selects all employees that report to managers
ON emp_2.id = emp_1.manager_id
-- The ORDER BY command is used to sort the result set in ascending or descending order.
-- Selects all the columns from employee emp_1 table, sorted by the "manager" column
ORDER BY manager;

-- Returns column id from table: employee, LEFT JOINS role.id, and LEFT JOINS departments.id
SELECT CONCAT(employee.first_name, " ", employee.last_name) AS employee, departments.department
FROM employee
LEFT JOIN role
ON employee.role_id = role.id
LEFT JOIN departments
ON role.department_id = departments.id
-- Selects all the columns from employee table, sorted by the "departments.department" column
ORDER BY departments.department;

-- Returns column department from table: departments, LEFT JOINS role.department_id, and LEFT JOINS employee.role_id
-- The SUM() function returns the total sum of a numeric column
-- Returns the sum of all role.salary fields in the departments table
SELECT departments.department, SUM(role.salary) AS budget
FROM departments
LEFT JOIN role
ON departments.id = role.department_id
LEFT JOIN employee
ON role.id = employee.role_id
-- The GROUP BY statement groups rows that have the same values into summary rows
GROUP BY departments.department;