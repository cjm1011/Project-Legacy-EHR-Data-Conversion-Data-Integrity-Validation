-- Split full name

SELECT
patient_id,
SPLIT_PART(full_name,' ',1) AS first_name,
SPLIT_PART(full_name,' ',2) AS last_name,
TO_DATE(dob,'YYYY/MM/DD') AS birth_date,
gender,
phone
FROM patients_legacy;

--This ensures consistent phone number formatting for downstream systems.
UPDATE patients_legacy
SET phone = REGEXP_REPLACE(phone, '[^0-9]', '', 'g');


-- Handles missing phone number Values
UPDATE patients_legacy
SET phone = '0000000000'
WHERE phone IS NULL;
