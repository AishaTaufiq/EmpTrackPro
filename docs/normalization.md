# EmpTrackPro Database Normalization

## Overview
The EmpTrackPro database schema was normalized to ensure data consistency, reduce redundancy, and improve maintainability. The schema was analyzed and verified up to Third Normal Form (3NF).

---

# First Normal Form (1NF)

The database satisfies 1NF because:

- Each table has a primary key.
- All attributes contain atomic values.
- No repeating groups or multivalued attributes exist.

Example:
- Employee names are separated into first_name and last_name.
- Department and role information are stored in separate tables.

---

# Second Normal Form (2NF)

The database satisfies 2NF because:

- All non-key attributes fully depend on the primary key.
- Tables use single-column primary keys.
- No partial dependencies exist.

Example:
- Employment details depend entirely on employment_id.
- Department details depend entirely on department_id.

---

# Third Normal Form (3NF)

The database satisfies 3NF because:

- No transitive dependencies exist.
- Non-key attributes depend only on the primary key.
- Related data is separated into independent tables.

Example:
- Department information is separated from Employee records.
- Job roles are maintained in the JobRole table.
- Team information is separated from Employment data.

---

# Schema Improvements

The following improvements were applied:

- Added NOT NULL constraints for mandatory fields.
- Added CHECK constraints for salary, status, and role validation.
- Added UNIQUE constraints where required.
- Maintained referential integrity using foreign keys.

---

# ERD Update

The Entity Relationship Diagram (ERD) was reviewed and updated according to the normalized schema structure.

---

# Conclusion

The EmpTrackPro database schema is normalized up to Third Normal Form (3NF), reducing redundancy and improving database consistency, integrity, and scalability.