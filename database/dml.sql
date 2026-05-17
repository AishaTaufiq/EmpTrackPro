-- Use Database
USE EmpTrackPro;
DESCRIBE Employee;

LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 9.6/Uploads/employees.csv'
INTO TABLE Employee
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
IGNORE 1 ROWS
(employee_id, prefix, first_name, last_name, full_name);

SELECT COUNT(*) FROM Employee;

SELECT * FROM Employee LIMIT 5;

-- ======================================================
-- STAGING TABLE FOR EMPLOYMENT DATA (MILESTONE 5)
-- ======================================================
-- This table is created to temporarily hold raw CSV data.
-- It is required because the CSV contains descriptive text
-- (e.g., Department names, Job Titles, System names)
-- while the final Employment table uses foreign keys (IDs).
-- This allows us to later transform and map data correctly
-- into normalized tables using JOIN operations.
-- ======================================================

CREATE TABLE Employment_Staging (
    employee_no VARCHAR(20),
    job_title VARCHAR(100),
    department VARCHAR(100),
    team VARCHAR(100),
    system_name VARCHAR(100),
    salary DECIMAL(10,2),
    job_start_date DATE,
    exit_date DATE,
    job_status VARCHAR(50),
    employment_type VARCHAR(50)
);

LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 9.6/Uploads/employment.csv'
INTO TABLE Employment_Staging
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
IGNORE 1 ROWS
(employee_no, job_title, department, team, system_name, salary, job_start_date, exit_date, job_status, employment_type);
SELECT COUNT(*) FROM Employment_Staging;

SELECT * FROM Department;
SELECT * FROM JobRole;
SELECT * FROM Team;
SELECT * FROM SystemTable;

ALTER TABLE Employment_Staging
MODIFY job_start_date VARCHAR(20),
MODIFY exit_date VARCHAR(20);

SELECT DISTINCT job_status
FROM Employment_Staging;
SELECT DISTINCT employment_type
FROM Employment_Staging;
-- ======================================================
-- INSERT DATA INTO EMPLOYMENT TABLE USING JOINS
-- Handles invalid dates using NULLIF()
-- ======================================================

INSERT INTO Employment (
    employee_id,
    role_id,
    department_id,
    team_id,
    system_id,
    salary,
    job_start_date,
    exit_date,
    job_status,
    employment_type
)

SELECT
    e.employee_id,
    jr.role_id,
    d.department_id,
    t.team_id,
    s.system_id,
    es.salary,

    CASE
        WHEN es.job_start_date = '0000-00-00'
             OR es.job_start_date IS NULL
        THEN '2000-01-01'
        ELSE es.job_start_date
    END,

    CASE
        WHEN es.exit_date = '0000-00-00'
             OR es.exit_date = ''
        THEN NULL
        ELSE es.exit_date
    END,

    -- JOB STATUS MAPPING
    CASE
        WHEN es.job_status = 'Confirmed' THEN 'Active'
        WHEN es.job_status = 'On Probation' THEN 'Inactive'
        WHEN es.job_status = 'Training' THEN 'Inactive'
        ELSE 'Inactive'
    END,

    -- EMPLOYMENT TYPE MAPPING
    CASE
        WHEN es.employment_type = 'Full Time' THEN 'Full-Time'
        WHEN es.employment_type = 'Part Time' THEN 'Part-Time'
        WHEN es.employment_type = 'Left' THEN 'Contract'
        ELSE 'Contract'
    END

FROM Employment_Staging es

JOIN Employee e
    ON es.employee_no = e.employee_id

JOIN JobRole jr
    ON es.job_title = jr.role_name

JOIN Department d
    ON es.department = d.department_name

JOIN Team t
    ON es.team = t.team_name

JOIN SystemTable s
    ON es.system_name = s.system_name;
    
    SELECT COUNT(*) FROM Employment;