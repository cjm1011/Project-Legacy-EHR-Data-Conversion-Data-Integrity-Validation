CREATE TABLE patients_legacy (
patient_id INT PRIMARY KEY,
full_name VARCHAR(100),
dob DATE,
gender CHAR(1),
phone VARCHAR(15)
);

CREATE TABLE appointments_legacy (
appt_id INT PRIMARY KEY,
patient_id INT,
appt_date DATE,
doctor VARCHAR(50),
status VARCHAR(20)
);

CREATE TABLE diagnosis_legacy (
diag_id INT PRIMARY KEY,
patient_id INT,
icd_code VARCHAR(10),
description VARCHAR(100)
);
