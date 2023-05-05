USE icu_project;
-- 4 INSERT/UPDATE/DELETE commands

-- 1
INSERT INTO Employees
VALUES
(12, "Barzilai", "Ashqelon", "Esti", "Feldman", 0537417434, "1982-09-01", 6, "2020-11-04", "f", "senior doctor", 40000, 4);

-- 2
INSERT INTO Sensitivity
VALUES
(109, 29),
(108, 26);

-- 3
DELETE FROM Hospitalizations WHERE check_out_date Like "2019%";

-- 4
UPDATE Hospitals SET number_of_beds = 50 WHERE name = 'Meir';

