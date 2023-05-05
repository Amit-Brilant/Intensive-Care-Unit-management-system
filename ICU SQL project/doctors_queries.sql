USE icu_project;
-- doctors

-- 1
SELECT COUNT(h.patient_id) AS num_of_patients 
FROM hospitalizations h INNER JOIN inpatients i
ON (h.number , h.patient_ID) = (i.number , i.patient_ID)
WHERE h.check_in_date BETWEEN '2020-10-01' AND '2020-10-30'
AND h.check_out_date BETWEEN '2020-10-01' AND '2020-10-30'
AND i.hospital_name = "Belinson"
AND i.Hospital_city = "Petah Tikva";

-- 2
SELECT e.first_name, e.last_name, s.name, e.years_of_experience, ROUND(DATEDIFF(CURDATE(),e.date_of_birth)/365) AS "age"
FROM employees e, specializations s
WHERE years_of_experience BETWEEN 4 AND 5
AND role = "Medical Intern"
AND s.id = e.specialization_id
AND e.hospital_name = "Refael"
ORDER BY age DESC;

-- 3
SELECT p.first_name, p.last_name, p.gender, COUNT(mp.id) AS "number of procedures"
FROM patients p, medical_procedures mp, p_mp_treatments pmp, inpatients i
WHERE p.id = pmp.patient_id
AND mp.id = pmp.procedure_id
AND p.id = i.patient_id
AND i.hospital_name = "Belinson"
AND i.Hospital_city = "Petah Tikva"
GROUP BY p.id
HAVING COUNT(mp.id) > 0
ORDER BY p.first_name, p.last_name;

-- 4
SELECT e.role, e.first_name, e.last_name, e.years_of_experience, s.name "specialization field"
FROM employees e INNER JOIN specializations s 
ON e.specialization_id = s.ID 
WHERE e.role = 'senior doctor'
AND hospital_name = "Refael"
AND hospital_city = "Tel Aviv"
GROUP BY s.ID
ORDER BY e.years_of_experience DESC;

