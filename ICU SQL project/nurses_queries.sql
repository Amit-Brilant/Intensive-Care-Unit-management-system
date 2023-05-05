USE icu_project;
-- nurse

-- 1
SELECT COUNT(gone.number) AS "current capacity", o.number_of_beds AS "full capacity", o.number_of_beds - COUNT(gone.number) AS "free beds"
FROM (SELECT number, patient_id
	  FROM Hospitalizations
	  WHERE check_out_date IS NULL) gone, Inpatients i, hospitals o
WHERE (gone.Patient_ID, gone.number) = (i.Patient_ID, i.number)
AND (o.name, o.city) = (i.hospital_name, i.hospital_city)
AND o.name = "Hadasa" AND o.city = "Jerusalem";

-- 2
SELECT DISTINCT p.first_name, p.last_name, p.contact_first_name, p.contact_last_name,p.contact_phone_number, m.name as 'sensitivite to'
FROM patients p LEFT JOIN inpatients i ON i.patient_ID=p.id
INNER JOIN sensitivity s ON i.patient_ID=s.patient_id
INNER JOIN medications m ON s.medication_id=m.id
WHERE i.hospital_name = "Belinson"
ORDER BY p.first_name;

-- 3
SELECT DISTINCT p.id, p.first_name, p.last_name
FROM sensitivity s, patients p, medications m, inpatients i
WHERE s.patient_id = p.id
AND s.medication_id = m.id
AND p.id = i.patient_ID
AND i.hospital_name = "Meir"
AND m.name IN ("Dopamine","Epinephrine");
