-- Use employeeLocator_db database
USE employeeLocator_db;

-- Insert multiple department names
-- Insert rows into department table
INSERT INTO departments(department)
Values ("Sales"),
    ("Engineering"),
    ("Finance"),
    ("Legal");

-- Insert rows into role table
INSERT INTO role(title, salary, department_id)
VALUES ("Sales Lead", 100000, 1),
        ("Salesperson", 80000, 1),
        ("Lead Engineer", 150000, 2),
        ("Software Engineer", 120000, 2),
        ("Account Manager", 160000, 3),
        ("Accountant", 125000, 3),
        ("Legal Team Lead", 250000, 4),
        ("Lawyer", 190000, 4);

-- Insert rows into employee table
INSERT INTO employee(first_name, last_name, role_id, manager_id)
Values ("John", "Doe", 1, NULL),
        ("Mike", "Chan", 2, 1),
        ("Ashley", "Rodriguez", 3, NULL),
        ("Kevin", "Tupik", 4, 3),
        ("Kunal", "Singh", 5, NULL),
        ("Malia", "Brown", 6, 5),
        ("Sarah", "Lourd", 7, NULL),
        ("Tom", "Allen", 8, 7);

-- Updates rows where only manager_id is available
-- UPDATE employee SET manager_id = 1 where id = 2;
-- UPDATE employee SET manager_id = 3 where id = 4;
-- UPDATE employee SET manager_id = 5 where id = 6;
-- UPDATE employee SET manager_id = 7 where id = 8;
