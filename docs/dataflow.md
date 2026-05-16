# EmpTrackPro - Dataflow Description (Milestone 3)

## 1. Data Source

The EmpTrackPro system uses a real-world employee management dataset provided in Excel format. The dataset contains employee details such as personal information, job roles, department, team assignment, salary, employment dates, and job status.

The raw dataset was imported into Python for preprocessing and cleaning.

---

## 2. Data Cleaning Process

The dataset was cleaned using a Python script (`clean_data.py`) to ensure data quality and consistency. The following operations were performed:

- Removal of duplicate records  
- Handling of missing or null values  
- Standardization of text formatting (names, departments, roles)  
- Validation of date fields (job start and exit dates)  
- Ensuring correct data types for all fields  

After cleaning, the dataset was stored in a structured Excel file (`employees_clean.xlsx`).

---

## 3. Data Flow into Database System

The cleaned dataset was divided into structured CSV files to match the normalized database schema:

- **Employee.csv** → Stores personal and identity-related information of employees  
- **Employment.csv** → Stores job-related information including department, role, salary, and employment status  

These CSV files represent the main data input sources for the relational database.

---

## 4. Database Table Mapping

The system processes data into the following relational tables:

- Employee Table → Stores employee identity data  
- Employment Table → Stores job and employment details  
- Department Table → Stores department information (reference data)  
- JobRole Table → Stores job role definitions (reference data)  
- Team Table → Stores team allocation data  
- SystemTable → Stores system allocation data  
- ProbationRecord Table → Stores probation tracking data  
- Activity_Log Table → Stores system activity logs  
- User Table → Stores system users and roles  
- Salary_History Table → Stores historical salary changes  

Relationships between tables are maintained using primary and foreign keys.

---

## 5. Data Output

The database system generates structured outputs such as:

- Employee records and profiles  
- Department-wise and team-wise reports  
- Salary and employment history reports  
- Administrative summaries and analytics  

These outputs support reporting, decision-making, and future system integration.

---

## 6. Summary

The dataflow process ensures that raw employee data is transformed into a structured, normalized relational database. This improves data consistency, reduces redundancy, and supports efficient querying and reporting within the EmpTrackPro system.