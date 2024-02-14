-- Use employeeLocator_db database
USE employeeLocator_db;

-- Insert multiple department names
-- Insert rows into department table
INSERT INTO departments(department)
Values  ("Sales"),
        ("Engineering"),
        ("Finance"),
        ("Legal"),
        ("System Testing"),
        ("Assembly"),
        ("Education"),
        ("Entertainment"),
        ("Music");

-- Insert rows into role table
INSERT INTO role(title, salary, department_id)
VALUES  ("Sales Lead", 100000, 1),
        ("Salesperson", 80000, 1),
        ("Lead Engineer", 150000, 2),
        ("Software Engineer", 120000, 2),
        ("Account Manager", 160000, 3),
        ("Accountant", 125000, 3),
        ("Legal Team Lead", 250000, 4),
        ("Lawyer", 190000, 4),
        ("Owner", 1000000000, 3),
        ("Nuclear Power Plant Operator", 80000, 2),
        ("Principal", 130000, 7),
        ("Superintendent", 200000, 7),
        ("Teacher", 60000, 7),
        ("TV Show Host", 140000, 8),
        ("Personal Assistant", 100000, 3),
        ("Jazz Player", 90000, 9);

-- Insert rows into employee table
INSERT INTO employee(first_name, last_name, role_id, manager_id)
Values  ("Montgomery", "Burns", 9, NULL),
        ("Homer", "Simpson", 10, 1),
        ("Lisa", "Simpson", 16, NULL),        
        ("Gary", "Chalmers", 12, NULL),
        ("Seymour", "Skinner", 11, 4),
        ("Edna", "Krabappel", 13, 5),
        ("Krusty", "the Clown", 14, NULL),
        ("Waylon", "Smithers", 15, 1);

-- Updates rows where only manager_id is available
-- UPDATE employee SET manager_id = 1 where id = 2;
-- UPDATE employee SET manager_id = 3 where id = 4;
-- UPDATE employee SET manager_id = 5 where id = 6;
-- UPDATE employee SET manager_id = 7 where id = 8;
