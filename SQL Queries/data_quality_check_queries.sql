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
