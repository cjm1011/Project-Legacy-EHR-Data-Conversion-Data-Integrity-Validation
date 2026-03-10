# Project-Legacy-EHR-Data-Conversion-Data-Integrity-Validation
Healthcare Data Migration & Data Quality Validation Project
Overview

This project simulates a real-world healthcare data migration scenario, where patient data from a legacy Electronic Health Record (EHR) system is converted and validated before being loaded into a new platform.

The objective of the project is to demonstrate core skills required for Data Conversion Engineers and Data Quality Analysts, including:

Data extraction and transformation

Data integrity validation

SQL-based data investigation

Identification of migration risks

Documentation of data conversion logic

The dataset simulates legacy healthcare data including patient demographics, appointments, and diagnosis records.

Project Objectives

This project was designed to replicate key responsibilities commonly required during healthcare system implementations and EHR migrations.

Key objectives include:

• Simulating legacy healthcare data structures
• Performing data quality investigations using SQL
• Identifying orphan records and missing values
• Validating referential integrity between tables
• Demonstrating how data issues are identified prior to system conversion

Database Structure

The project uses three core tables that simulate common entities found in healthcare systems.

1. Patients (Legacy System)

Stores demographic information about patients.

Key Fields

Column	Description
patient_id	Unique patient identifier
first_name	Patient first name
last_name	Patient last name
dob	Date of birth
phone	Contact phone number
2. Appointments (Legacy System)

Contains appointment scheduling information.

Key Fields

Column	Description
appt_id	Unique appointment identifier
patient_id	Links appointment to patient
appt_date	Appointment date
doctor	Assigned physician
3. Diagnosis Records

Stores diagnosis information associated with patient encounters.

Key Fields

Column	Description
diag_id	Diagnosis record identifier
patient_id	Associated patient
icd_code	Diagnosis code
description	Diagnosis description
Data Volume

To simulate enterprise datasets, synthetic data was generated.

Table	Records
patients_legacy	100,000
appointments_legacy	100,000
diagnosis_legacy	100,000

Randomized sample data was generated to mimic realistic patient demographics and medical records.

Example Data Quality Investigations

Several SQL queries were developed to identify potential data issues before migration.

1 Missing Contact Information

Identifies patients without phone numbers.

SELECT patient_id, first_name, last_name
FROM patients_legacy
WHERE phone IS NULL;
2 Orphan Appointment Records

Detects appointments that do not have a valid patient record.

SELECT a.appt_id, a.patient_id
FROM appointments_legacy a
LEFT JOIN patients_legacy p
ON a.patient_id = p.patient_id
WHERE p.patient_id IS NULL;
3 Patients Without Diagnosis Records

Identifies patients missing diagnosis documentation.

SELECT p.patient_id
FROM patients_legacy p
LEFT JOIN diagnosis_legacy d
ON p.patient_id = d.patient_id
WHERE d.diag_id IS NULL;
4 Missing Diagnosis Codes

Finds diagnosis records that are incomplete.

SELECT diag_id, patient_id
FROM diagnosis_legacy
WHERE icd_code IS NULL;
5 High Appointment Volume Detection

Flags patients with an unusually high number of appointments.

SELECT patient_id, COUNT(*) AS appointment_count
FROM appointments_legacy
GROUP BY patient_id
HAVING COUNT(*) > 10;
Data Quality Risks Identified

The simulated dataset intentionally includes data issues commonly encountered during migrations:

• Missing patient contact information
• Appointments referencing non-existent patients
• Diagnosis records missing ICD codes
• Patients without associated medical records

These issues demonstrate the importance of data validation prior to system go-live.

Tools Used

• SQL (PostgreSQL / relational database)
• Excel (data exploration and validation)
• SQL joins and aggregation functions
• Synthetic data generation techniques

Skills Demonstrated

This project highlights several technical and analytical skills:

Data Analysis

SQL data investigation

anomaly detection

root cause identification

Data Conversion

legacy data structure analysis

referential integrity validation

pre-migration data validation

Data Quality

identification of incomplete or inconsistent records

validation of relational dependencies

risk identification before deployment

Real-World Relevance

Healthcare data migrations require strict validation to ensure patient safety, billing accuracy, and regulatory compliance.

This project simulates the type of data quality analysis and SQL investigations performed by Data Conversion Engineers during EHR implementations.

Author

Cesar Marty
Data Quality Analyst | SQL | Data Governance | Data Investigation
