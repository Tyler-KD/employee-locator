-- Use employeeLocator_db database
USE employeeLocator_db;

-- Insert multiple department names
-- Insert rows into department table
INSERT INTO departments(department)
Values  ("Engineering"),
        ("Finance"),        
        ("Education"),
        ("Entertainment"),
        ("Music");

-- Insert rows into role table
INSERT INTO role(title, salary, department_id)
VALUES  ("Owner", 1000000000, 2),
        ("Nuclear Power Plant Operator", 80000, 1),
        ("Principal", 130000, 3),
        ("Superintendent", 200000, 3),
        ("Teacher", 60000, 3),
        ("TV Show Host", 140000, 4),
        ("Personal Assistant", 100000, 2),
        ("Jazz Player", 90000, 5),
        ("Sidekick", 70000, 4);

-- Insert rows into employee table
INSERT INTO employee(first_name, last_name, role_id, manager_id)
Values  ("Montgomery", "Burns", 1, NULL),
        ("Homer", "Simpson", 2, 1),
        ("Lisa", "Simpson", 8, NULL),        
        ("Gary", "Chalmers", 4, NULL),
        ("Seymour", "Skinner", 3, 4),
        ("Edna", "Krabappel", 5, 5),
        ("Krusty", "the Clown", 6, NULL),
        ("Waylon", "Smithers", 7, 1);
