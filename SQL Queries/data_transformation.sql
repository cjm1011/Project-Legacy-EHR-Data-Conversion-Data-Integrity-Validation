-- Split full name

--First, create the new columns in the table
ALTER TABLE patients_new_system
ADD COLUMN first_name TEXT,
ADD COLUMN last_name TEXT;

--Second, split the full_name column.
UPDATE patients_new_system
SET
first_name = split_part(full_name, '_', 1),
last_name = split_part(full_name, '_', 2);

--lastly once the data is validated, drop the legacy column:
ALTER TABLE patients_new_system
DROP COLUMN full_name;


--This ensures consistent phone number formatting for downstream systems.
UPDATE patients_new_system
SET phone = REGEXP_REPLACE(phone, '[^0-9]', '', 'g');


-- Handles missing phone number Values
UPDATE patients_new_system
SET phone = '0000000000'
WHERE phone IS NULL;


--
