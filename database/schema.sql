-- Create Database
CREATE DATABASE EmpTrackPro;

-- Use Database
USE EmpTrackPro;

-- =========================
-- Employee Table
-- =========================
CREATE TABLE Employee (
    employee_id VARCHAR(10) PRIMARY KEY,
    prefix VARCHAR(10),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    full_name VARCHAR(100) NOT NULL
);

-- =========================
-- Department Table
-- =========================
CREATE TABLE Department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- =========================
-- Team Table
-- =========================
CREATE TABLE Team (
    team_id INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,

    FOREIGN KEY (department_id)
    REFERENCES Department(department_id)
);

-- =========================
-- Job Role Table
-- =========================
CREATE TABLE JobRole (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(100) NOT NULL UNIQUE
);

-- =========================
-- System Table
-- =========================
CREATE TABLE SystemTable (
    system_id INT AUTO_INCREMENT PRIMARY KEY,
    system_name VARCHAR(100) NOT NULL UNIQUE
);

-- =========================
-- Employment Table
-- =========================
CREATE TABLE Employment (
    employment_id INT AUTO_INCREMENT PRIMARY KEY,

    employee_id VARCHAR(10) NOT NULL,
    role_id INT NOT NULL,
    department_id INT NOT NULL,
    team_id INT NOT NULL,
    system_id INT NOT NULL,

    salary DECIMAL(10,2) NOT NULL CHECK (salary >= 0),

    job_start_date DATE NOT NULL,
    exit_date DATE,

    job_status VARCHAR(50) NOT NULL
    CHECK (job_status IN ('Active', 'Inactive', 'Resigned', 'Terminated')),

    employment_type VARCHAR(50) NOT NULL
    CHECK (employment_type IN ('Full-Time', 'Part-Time', 'Contract', 'Intern')),

    FOREIGN KEY (employee_id)
    REFERENCES Employee(employee_id),

    FOREIGN KEY (role_id)
    REFERENCES JobRole(role_id),

    FOREIGN KEY (department_id)
    REFERENCES Department(department_id),

    FOREIGN KEY (team_id)
    REFERENCES Team(team_id),

    FOREIGN KEY (system_id)
    REFERENCES SystemTable(system_id)
);

-- =========================
-- Probation Record Table
-- =========================
CREATE TABLE ProbationRecord (
    probation_id INT AUTO_INCREMENT PRIMARY KEY,

    employee_id VARCHAR(10) NOT NULL UNIQUE,

    probation_start DATE NOT NULL,
    probation_end DATE NOT NULL,

    status VARCHAR(50) NOT NULL
    CHECK (status IN ('Ongoing', 'Completed', 'Extended')),

    FOREIGN KEY (employee_id)
    REFERENCES Employee(employee_id)
);

-- =========================
-- Activity Log Table
-- =========================
CREATE TABLE Activity_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,

    employee_id VARCHAR(10) NOT NULL,

    action VARCHAR(255) NOT NULL,

    action_time DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (employee_id)
    REFERENCES Employee(employee_id)
);

-- =========================
-- User Table
-- =========================
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,

    username VARCHAR(50) NOT NULL UNIQUE,

    password VARCHAR(100) NOT NULL,

    role VARCHAR(50) NOT NULL
    CHECK (role IN ('Admin', 'Manager', 'Employee'))
);

-- =========================
-- Salary History Table
-- =========================
CREATE TABLE Salary_History (
    history_id INT AUTO_INCREMENT PRIMARY KEY,

    employee_id VARCHAR(10) NOT NULL,

    salary DECIMAL(10,2) NOT NULL
    CHECK (salary >= 0),

    effective_date DATE NOT NULL,

    FOREIGN KEY (employee_id)
    REFERENCES Employee(employee_id)
) ENGINE=InnoDB;

-- =========================
-- Show Tables
-- =========================
SHOW TABLES;

-- =========================
-- Describe Tables
-- =========================
DESCRIBE Employee;
DESCRIBE Department;
DESCRIBE Team;
DESCRIBE JobRole;
DESCRIBE SystemTable;
DESCRIBE Employment;
DESCRIBE ProbationRecord;
DESCRIBE User;

-- =========================
-- Insert Department Data
-- =========================
INSERT INTO Department (department_name) VALUES
('Operations'),
('Corporate Services'),
('Audit Department'),
('IT'),
('Training'),
('Legal');

-- =========================
-- Insert Job Roles
-- =========================
INSERT INTO JobRole (role_name) VALUES
('Coder'),
('Junior Coder'),
('Senior Coder'),
('Senior Coder / ATL'),
('Team Lead'),
('Operations Supervisor'),
('Client Relationship Supervisor'),
('Assistant Clinical Coding Auditor'),
('Clinical Coding Auditor'),
('Lead Trainer'),
('Trainee'),
('Project Manager'),
('IT Technician'),
('Senior Executive Legal HR & Compliance');

-- =========================
-- Insert Systems
-- =========================
INSERT IGNORE INTO SystemTable (system_name) VALUES
('Emis'),
('Emis/Docman'),
('SystemONE'),
('EMIS');

-- =========================
-- Insert Teams
-- =========================
INSERT INTO Team (team_name, department_id) VALUES
('Hereford', 1),
('Bredburry', 1),
('School Lane', 1),
('The Hill', 1),
('Acle', 1),
('Hazeldene', 1),
('Murdishaw', 1),
('DonneyBrook', 1),
('St Georges', 1),
('Newton Heath', 1),
('Market Rasen', 1),
('Uplands', 1),
('Training', 5);