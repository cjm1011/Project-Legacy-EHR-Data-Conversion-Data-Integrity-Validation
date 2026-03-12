-- patients_legacy
INSERT INTO patients_legacy (full_name, dob, gender, phone)
SELECT
    'Patient_' || gs AS full_name,
    DATE '1950-01-01' + (RANDOM() * 20000)::INT,
    CASE WHEN RANDOM() > 0.5 THEN 'M' ELSE 'F' END,
    '813-555-' || LPAD((RANDOM()*9999)::INT::TEXT,4,'0')
FROM generate_series(1,100000) gs;

-- Used below query to replace "Patient_XXXX" data and update with real names

UPDATE patients_legacy
SET full_name =
(
    (ARRAY[
        'Jack','Mark','Mike','David','Chris','Daniel','James','Robert','John','Paul',
        'Kevin','Brian','Anthony','Matthew','Steven','Andrew','Ryan','Justin','Eric','Jason'
    ])[floor(random()*20 + 1)]
)
|| '_'
||
(
    (ARRAY[
        'Smith','Johnson','Williams','Brown','Jones','Garcia','Miller','Davis','Rodriguez','Martinez',
        'Hernandez','Lopez','Gonzalez','Wilson','Anderson','Thomas','Taylor','Moore','Jackson','Martin'
    ])[floor(random()*20 + 1)]
);

--appointments_legacy
INSERT INTO appointments_legacy
SELECT
gs AS appt_id,

floor(random()*100000 + 1)::int,

CURRENT_DATE - (random()*3650)::int,

(ARRAY[
'Dr. Adams','Dr. Patel','Dr. Chen','Dr. Rodriguez','Dr. Williams',
'Dr. Brown','Dr. Thompson','Dr. Clark'
])[floor(random()*8)+1],

(ARRAY[
'completed','scheduled','cancelled','no_show'
])[floor(random()*4)+1]

FROM generate_series(1,100000) gs;

--diagnosis_legacy
INSERT INTO diagnosis_legacy
SELECT
gs AS diag_id,

floor(random()*100000 + 1)::int,

(ARRAY[
'E11','I10','J45','M54','E78','F41','K21','N39'
])[floor(random()*8)+1],

(ARRAY[
'Type 2 Diabetes',
'Hypertension',
'Asthma',
'Back Pain',
'High Cholesterol',
'Anxiety Disorder',
'Acid Reflux',
'Urinary Tract Infection'
])[floor(random()*8)+1]

FROM generate_series(1,100000) gs;
