USE icu_project;

-- health organization

-- 1
SELECT Health_maintenance_organization, gender, count(id)
FROM patients
GROUP BY Health_maintenance_organization, gender
ORDER BY Health_maintenance_organization;

-- 2
SELECT h.name, h.city, COALESCE(s.outcome,0) as "outcomes", COALESCE(SUM(i.bill),0) as "incomes", COALESCE(SUM(i.bill),0)-COALESCE(s.outcome,0) as "balance"
FROM (SELECT hospital_name, Hospital_city, SUM(salary) as "outcome"
	  FROM employees e
      GROUP BY e.hospital_name, e.Hospital_city) s RIGHT OUTER JOIN hospitals h ON (s.hospital_name, s.Hospital_city)=(h.name, h.city)
      LEFT OUTER JOIN inpatients i on (s.hospital_name, s.Hospital_city)=(i.hospital_name, i.Hospital_city) 
GROUP BY h.name, h.city;

-- 3
SELECT p.first_name, p.last_name, m.name "medication name", i.hospital_name, i.Hospital_city
FROM patients p, pm_treatments pm, medications m, sensitivity s, inpatients i
WHERE p.id = pm.patient_id
AND m.id = pm.medication_id
AND p.id = i.patient_ID
AND (pm.patient_id = s.patient_id AND pm.medication_id = s.medication_id);

-- 4 
SELECT h.name, h.city , h.number_of_beds, avg.average, h.type
FROM (SELECT AVG(number_of_beds) AS "average"
	  FROM hospitals) avg, hospitals h
WHERE number_of_beds > avg.average;

-- 5
SELECT p.first_name, p.last_name, mp.name "procedures"
FROM  medical_procedures mp, patients p, p_mp_treatments t
WHERE mp.name = ANY(SELECT name FROM medical_procedures
					WHERE name LIKE '%imaging%')
AND t.patient_id=p.id 
AND t.Procedure_ID=mp.id;
