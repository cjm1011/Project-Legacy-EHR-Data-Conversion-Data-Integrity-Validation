-- Finds out patients with missing phone numbers and what percentage
SELECT
COUNT(*) AS missing_phone_records,
ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM patients_legacy),2) AS percent_missing
FROM patients_legacy
WHERE phone IS NULL;

-- Finds patients without diagnosis
SELECT p.patient_id
FROM patients_legacy p
LEFT JOIN diagnosis_legacy d
ON p.patient_id = d.patient_id
WHERE d.patient_id IS NULL;

--Finds appointments that do not have a patient listed 
SELECT a.appt_id
FROM appointments_legacy a
LEFT JOIN patients_legacy p
ON a.patient_id = p.patient_id
WHERE p.patient_id IS NULL;
