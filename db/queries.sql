-- Returns all columns from table: department
SELECT * from departments;

-- Returns all columns from table: role and joins department.id
SELECT role.id, role.title, departments.department, role.salary
FROM role
JOIN departments ON role.department_id = departments.id;

-- Returns all columns from table: employee and joins role.id, departments.id, and employee.id
SELECT employee.id, employee.first_name, employee.last_name, role.title, departments.department, role.salary, employee.manager_id
FROM employee
JOIN role ON employee.role_id = role.id
JOIN departments on role.department_id = departments.id
JOIN employee on employee.manager_id = employee.id;
