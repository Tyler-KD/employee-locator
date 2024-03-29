-- Drops the employeeLocator_db if it exists currently
DROP DATABASE IF EXISTS employeeLocator_db;
-- Creates the employeeLocator_db database
CREATE DATABASE employeeLocator_db;

-- Use employeeLocator_db database
USE employeeLocator_db;

-- Creates the table "department" within employeeLocator_db
CREATE TABLE departments (
    -- Creates a numeric column called "id"
    -- INT NOT NULL means data is required
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -- Makes a string column called "name" which cannot contain null
    -- Limit string to 30 characters
    department VARCHAR(30) NOT NULL
);

-- Creates the table "role" within employeeLocator_db
CREATE TABLE role (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    salary DECIMAL,
    department_id INT,
    -- CONSTRAINTS are used to limit the type of data that can go into a table
    -- Lifts FOREIGN KEY prevention of actions that would destroy links between tables
    -- FOREIGN KEY (department_id) is lifted
    CONSTRAINT fk_departments
    FOREIGN KEY (department_id)
    REFERENCES departments(id)
    -- ON DELETE CASCADE constraint is used in MySQL to delete rows from the child table automatically, 
    -- when the rows from the parent table are deleted
    ON DELETE CASCADE
);

-- Creates the table "employee" within employeeLocator_db
CREATE TABLE employee (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role_id INT,
    -- FOREIGN KEY (role_id) is lifted
    CONSTRAINT fk_role
    FOREIGN KEY (role_id)
    REFERENCES role(id)
    ON DELETE CASCADE,
    manager_id INT,
    -- FOREIGN KEY (manager_id) is lifted
    CONSTRAINT fk_manager
    FOREIGN KEY (manager_id)
    REFERENCES employee(id)
    -- If employee gets deleted, then that id will be set to null
    ON DELETE SET NULL
);

