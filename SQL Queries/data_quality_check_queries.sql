-- This query checks for uniqueness
SELECT patient_id, count(*)
FROM patients_legacy
GROUP BY patient_id
HAVING COUNT(*) > 1;

-- This query checks for valid values (completed, cancelled, scheduled, no_show)
SELECT * 
FROM appointments_legacy
WHERE status NOT IN 
	('completed','cancelled','scheduled','no_show');

-- This dentifies appointments without valid patients
SELECT 
a.appt_id,
a.patient_id,
a.appt_date,
a.doctor
FROM appointments_legacy a
LEFT JOIN patients_legacy p
ON a.patient_id = p.patient_id
WHERE p.patient_id IS NULL;

--Find patients who do not have any diagnosis records.
SELECT 
p.patient_id, 
p.full_name
FROM patients_legacy p
LEFT JOIN diagnosis_legacy d 
ON p.patient_id = d.patient_id
WHERE diag_id IS NULL;

--Find all diagnosis records where the ICD code is missing and provide the percentage.
SELECT
COUNT(*) AS missing_icd_codes,
ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM diagnosis_legacy),2) AS percent_missing
FROM diagnosis_legacy
WHERE icd_code IS NULL;

--Find patients who have 5 or more appointments.
SELECT 
patient_id,
COUNT(appt_id) AS number_of_appointments
FROM appointments_legacy
WHERE patient_id IS NOT NULL
GROUP BY patient_id
HAVING COUNT(appt_id) >= 5
ORDER BY number_of_appointments DESC;
