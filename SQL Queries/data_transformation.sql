--

SELECT
patient_id,
SPLIT_PART(full_name,' ',1) AS first_name,
SPLIT_PART(full_name,' ',2) AS last_name,
TO_DATE(dob,'YYYY/MM/DD') AS birth_date,
gender,
phone
FROM patients_legacy;
