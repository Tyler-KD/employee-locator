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