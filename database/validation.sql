-- Use Database
USE EmpTrackPro;
-- =========================================
-- M5: DATA VALIDATION QUERIES
-- =========================================

-- 1. ROW COUNT CHECK FOR ALL TABLES
SELECT 'Employee' AS table_name, COUNT(*) FROM Employee
UNION
SELECT 'Department', COUNT(*) FROM Department
UNION
SELECT 'Team', COUNT(*) FROM Team
UNION
SELECT 'JobRole', COUNT(*) FROM JobRole
UNION
SELECT 'SystemTable', COUNT(*) FROM SystemTable
UNION
SELECT 'Employment', COUNT(*) FROM Employment
UNION
SELECT 'ProbationRecord', COUNT(*) FROM ProbationRecord
UNION
SELECT 'Activity_Log', COUNT(*) FROM Activity_Log;


-- 2. NULL VALUE CHECK (DATA QUALITY CHECK)
SELECT *
FROM Employment
WHERE employee_id IS NULL
   OR role_id IS NULL
   OR department_id IS NULL
   OR team_id IS NULL
   OR system_id IS NULL
   OR salary IS NULL
   OR job_start_date IS NULL
   OR job_status IS NULL
   OR employment_type IS NULL;


-- 3. JOIN INTEGRITY CHECK (FOREIGN KEYS WORKING)
SELECT e.employee_id, emp.employment_id, d.department_name, jr.role_name
FROM Employment emp
JOIN Employee e ON emp.employee_id = e.employee_id
JOIN Department d ON emp.department_id = d.department_id
JOIN JobRole jr ON emp.role_id = jr.role_id
LIMIT 10;

-- Increase salary for a specific employee
-- =========================================
UPDATE Employment
SET salary = salary + 5000
WHERE employee_id = 'EMP-00011';

-- FAKE DELETE (SAFE REAL-WORLD APPROACH)
-- =========================================

UPDATE Employment
SET job_status = 'Terminated'
WHERE employee_id = 'EMP-00061';