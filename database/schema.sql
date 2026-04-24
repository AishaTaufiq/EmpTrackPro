-- Create Database
CREATE DATABASE EmpTrackPro;
-- Use Database
USE EmpTrackPro;
CREATE TABLE Employee (
    employee_id VARCHAR(10) PRIMARY KEY,
    prefix VARCHAR(10),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    full_name VARCHAR(100)
);
CREATE TABLE Department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE
);
CREATE TABLE Team (
    team_id INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);
CREATE TABLE JobRole (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(100) UNIQUE
);
CREATE TABLE SystemTable (
    system_id INT AUTO_INCREMENT PRIMARY KEY,
    system_name VARCHAR(100) UNIQUE
);
CREATE TABLE Employment (
    employment_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id VARCHAR(10),
    role_id INT,
    department_id INT,
    team_id INT,
    system_id INT,
    salary DECIMAL(10,2),
    job_start_date DATE,
    exit_date DATE,
    job_status VARCHAR(50),
    employment_type VARCHAR(50),

    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (role_id) REFERENCES JobRole(role_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (team_id) REFERENCES Team(team_id),
    FOREIGN KEY (system_id) REFERENCES SystemTable(system_id)
);
CREATE TABLE ProbationRecord (
    probation_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id VARCHAR(10) UNIQUE,
    probation_start DATE,
    probation_end DATE,
    status VARCHAR(50),

    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

CREATE TABLE Activity_Log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(10),
    action VARCHAR(255) NOT NULL,
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(100),
    role VARCHAR(50)
);

CREATE TABLE Salary_History (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(10),
    salary DECIMAL(10,2) NOT NULL,
    effective_date DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
) ENGINE=InnoDB;

SHOW TABLES;

DESCRIBE Employee;
DESCRIBE Department;
DESCRIBE Team;
DESCRIBE JobRole;
DESCRIBE SystemTable;
DESCRIBE Employment;
DESCRIBE ProbationRecord;
DESCRIBE User;