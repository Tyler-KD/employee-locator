-- Use employeeLocator_db database
USE employeeLocator_db;

-- Insert multiple department names
-- Insert rows into department table
INSERT INTO departments(department)
Values ("Sales"),
    ("Engineering"),
    ("Finance"),
    ("Legal"),
    ("System Testing"),
    ("Assembly"),
    ("Education"),
    ("Entertainment");

-- Insert rows into role table
INSERT INTO role(title, salary, department_id)
VALUES ("Sales Lead", 100000, 1),
        ("Salesperson", 80000, 1),
        ("Lead Engineer", 150000, 2),
        ("Software Engineer", 120000, 2),
        ("Account Manager", 160000, 3),
        ("Accountant", 125000, 3),
        ("Legal Team Lead", 250000, 4),
        ("Lawyer", 190000, 4),
        ("Owner", 1000000000, 2),
        ("Nuclear Power Plant Operator", 80000, 1),
        ("Principal", 130000, 6),
        ("Superintendent", 200000, 6),
        ("Teacher", 60000, 6),
        ("TV Show Host", 140000, 7),
        ("Personal Assistant", 100000, 2);

-- Insert rows into employee table
INSERT INTO employee(first_name, last_name, role_id, manager_id)
Values ("Montgomery", "Burns", 8, NULL),
        ("Homer", "Simpson", 2, 1),
        ("Lisa", "Simpson", 6, NULL),
        ("Seymour", "Skinner", 10, 5),
        ("Gary", "Chalmers", 11, NULL),
        ("Edna", "Krabappel", 12, 4),
        ("Krusty", "theClown", 13, NULL),
        ("Waylon", "Smithers", 14, 1);

-- Updates rows where only manager_id is available
-- UPDATE employee SET manager_id = 1 where id = 2;
-- UPDATE employee SET manager_id = 3 where id = 4;
-- UPDATE employee SET manager_id = 5 where id = 6;
-- UPDATE employee SET manager_id = 7 where id = 8;
