CREATE SCHEMA icu_project;
USE icu_project;
Set sql_safe_updates = false;

-- table 1
CREATE TABLE Hospitals
(name VARCHAR(40),
city VARCHAR(40),
type ENUM ("govermental","private"),
number_of_beds INT,
PRIMARY KEY (name,city)) 
ENGINE=INNODB;

INSERT INTO Hospitals
VALUES
("Belinson","Petah Tikva","govermental",24),
("Refael","Tel aviv","private",11),
("Asuta","Tel aviv","private",8),
("Asuta","Haifa","private",11),
("Asuta","Ashdod","private",12),
("Meir","Kefar Saba","govermental",40),
("Hadasa","Jerusalem","govermental",105),
("Shiba - Tel Hashomer","Ramat Gan","govermental",72),
("Volfson","Holon","govermental",52),
("Barzilai","Ashqelon","govermental",30);

-- table 2
CREATE TABLE Specializations
(ID INT AUTO_INCREMENT,
name VARCHAR(40),
PRIMARY KEY (ID)) 
ENGINE=INNODB;

INSERT INTO Specializations (name)
VALUES
("General"),
("Trauma"),
("Pediatrics"),
("Cardiology"),
("Neurology"),
("Gastrolog");

-- table 3
CREATE TABLE Employees
(employee_number INT,
hospital_name VARCHAR(40),
Hospital_city VARCHAR(40),
first_name VARCHAR(20),
last_name VARCHAR(20),
phone_number INT UNIQUE,
date_of_birth date,
years_of_experience DECIMAL(3,1),
start_date date,
gender ENUM ("m","f","other"),
role ENUM ("department head doctor","department head nurse","senior doctor","medical intern","nurse"), 
salary INT,
specialization_id INT,
PRIMARY KEY (employee_number, hospital_name, Hospital_city),
FOREIGN KEY (specialization_id) REFERENCES Specializations(ID),
FOREIGN KEY (hospital_name, Hospital_city) REFERENCES Hospitals(name, city))
ENGINE=INNODB;

INSERT INTO Employees
VALUES
(15, "Refael", "Tel aviv", "Moti", "Matat", 0502220382, "1989-07-11", 4.5, "2016-08-28", "m", "medical intern", 15000, 2),
(16, "Refael", "Tel aviv", "Shaniqua", "Jacobs", 0501355269, "1988-05-03", 4, "2017-11-07", "f", "medical intern", 16000, 4),
(10, "Refael", "Tel aviv", "Daniel", "Cohen", 0507943382, "1980-05-17", 12, "2004-01-04", "m", "senior doctor", 24000, 2),
(11, "Asuta", "Ashdod", "Ofer", "Shalem", 0527971803, "1992-11-02", 1.5, "2019-12-10", "m", "medical intern", 15500, 4),
(12, "Asuta", "Tel aviv", "Simha", "Nagar", 0547773681, "1958-08-22", 37, "1994-08-13", "f", "department head nurse", 22500, NULL),
(13, "Meir", "kefar Saba", "Liorn", "Levi", 0507941220, "1973-09-17", 17.5, "2012-01-30", "f", "senior doctor", 24500, 5),
(14, "Hadasa", "Jerusalem", "Jacob", "Faruq", 0544280069, "1969-05-01", 20, "2000-10-27", "m", "nurse", 17000, 6),
(10, "Belinson", "Petah Tikva", "Zila", "Ben David", NULL, "1955-07-03", 31, "2008-05-14", "f", "department head doctor", 35000, 1),
(10, "Shiba - Tel Hashomer", "Ramat Gan", "Gal", "Grumat", 0501712217, "1963-02-23", 28, "2003-06-30", "f", "department head doctor", 36000, 2),
(11, "Shiba - Tel Hashomer", "Ramat Gan", "Asaf", "Avidan", 0588006004, "1978-04-07", 15, "2010-05-14", "m", "senior doctor", 35000, 1),
(10, "Volfson", "Holon", "Muhamad", "Tabibi", 0548339751, "1992-09-21", 2, "2018-12-27", "m", "medical intern", 35000, 5),
(11, "Volfson", "Holon", "Shoshana", "Damari", 0504244097, "1951-06-06", 48, "2008-05-14", "f", "department head nurse", 25000, NULL),
(10, "Barzilai", "Ashqelon", "Ofer", "Sharabi", 0524133798, "1988-07-27", 3.5, "2017-01-13", "m", "medical intern", 24000, 6),
(11, "Barzilai", "Ashqelon", "Yael", "Zur", 0537417412, "1985-08-01", 6, "2015-11-04", "f", "senior doctor", 30000, 4);

-- table 4
CREATE TABLE Patients
(ID INT,
first_name VARCHAR(20),
last_name VARCHAR(20),
phone_number INT,
date_of_birth date,
gender ENUM ("m","f","other"),
Health_maintenance_organization ENUM ("Clalit","Macabi","Leumit","Meuhedet"),
contact_first_name VARCHAR(20),
contact_last_name VARCHAR(20),
contact_phone_number INT,
family_kinship VARCHAR(20),
PRIMARY KEY (ID))
ENGINE=INNODB;

INSERT INTO Patients
VALUES 
(100, "Avi", "Gilad", 0549917388, "2000-09-02", "m", "Clalit", "Moshe", "Gilad", 0549917385, "Father"),
(101, "Dikla", "Mekonen", 0587771423, "1994-08-27", "f", "Macabi", "Mazal", "Mekonen", 0587771444, "Mother"),
(102, "Dafna", "Shalom", 0540002378, "1962-01-07", "f", "Leumit", "Moshe", "Shalom", NULL, "Brother"),
(103, "Omer", "Adam", 0500000000, "2000-02-20", "m", "Meuhedet", "Gal", "Adam", 0522222222, "Brother"),
(104, "Avi", "Kushnir", 0579878972, "1975-12-30", "m", "Clalit", "Sara", "Kushnir", 0541231231, "Wife"),
(105, "Dana", "Aharon", 0534879995, "1986-04-16", "f", "Clalit", "Danit", "Aharon", 0541231231, "Sister"),
(106, "Aviel", "Levi", 0507865243, "1991-05-03", "f", "Macabi", "Adi", "Cohen", 0524033121, "Uncle"),
(107,"Eyal", "Katz", 0504843995, "1984-04-20", "m","Leumit", "Avi", "Katz", NULL, "Father"),
(108, "Ivri" ,"Lider" ,0526082323, "1978-02-12", "Other", "Meuhedet", "Ahmed", "Hasin", Null, "Brother"),
(109, "Sarit", "Hadad", 0548998976, "1970-06-06", "f", "Clalit", "Emily", "Hadad", 0548998977, "Dauther"),
(110, "Eli", "Eliran" , 0533324243, "1999-04-01" , "m" , "Macabi", "Lena", "Fridman", 0533324243, "Mom");

-- table 5
CREATE TABLE Hospitalizations
(number INT,
patient_ID INT,
check_in_date date,
check_out_date date,
PRIMARY KEY (number, patient_ID),
FOREIGN KEY (patient_ID) REFERENCES Patients(ID))
ENGINE=INNODB;

-- table 6
CREATE TABLE archive_hospitalizations
(old_patient_id INT,
check_in_date date,
check_out_date date)
ENGINE=INNODB;

delimiter $
CREATE TRIGGER archive_hospitalizations AFTER DELETE ON hospitalizations FOR EACH ROW
BEGIN
  INSERT INTO archive_hospitalizations VALUES(old.patient_id,old.check_in_date,old.check_out_date);
END$

INSERT INTO Hospitalizations
VALUES
(1, 100, "2020-12-01", "2020-12-05"),
(2, 100, "2020-12-08", "2020-12-09"),
(1, 101, "2020-10-14", "2020-10-16"),
(1, 103, "2019-01-18", "2019-01-26"),
(1, 104, "2020-12-18", NULL),
(1, 106, "2019-10-13", "2019-11-11"),
(1, 109, "2020-10-29", "2020-11-05"),
(1, 108, "2020-05-08","2020-08-05"),
(2, 109, "2020-11-29", "2020-12-10"),
(1, 107, "2020-08-18", "2020-08-19"),
(3, 109, "2020-11-29", NULL);

-- table 7
CREATE TABLE Inpatients
(number INT,
patient_ID INT,
hospital_name VARCHAR(40),
Hospital_city VARCHAR(40),
bed_number INT,
bill INT DEFAULT 250, CHECK (bill >= 250),
PRIMARY KEY (number, patient_ID, hospital_name, Hospital_city),
FOREIGN KEY (patient_ID) REFERENCES Patients(ID),
FOREIGN KEY (number) REFERENCES Hospitalizations(number) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (hospital_name, Hospital_city) REFERENCES Hospitals(name, city))
ENGINE=INNODB;

INSERT INTO Inpatients
VALUES
(1, 100, "Belinson", "Petah Tikva", 24, 1000),
(1, 101, "Belinson", "Petah Tikva", 23, 300),
(1, 102, "Asuta", "Ashdod", 10, 1120),
(1, 104, "Hadasa", "Jerusalem", 98, 879),
(2, 100, "Belinson", "Petah Tikva", 5, 250),
(1, 103, "Meir", "Kefar Saba", 33, 6430),
(1, 109,"Meir", "Kefar Saba", 04, 500),
(2, 109,"Asuta", "Haifa", 10, 3250),
(1, 105,"Asuta", "Tel Aviv", 02, 12500),
(1, 106, "Refael", "Tel Aviv", 05, 13000),
(1, 107, "Hadasa", "Jerusalem", 88, 8379),
(1, 108, "Belinson", "Petah Tikva", 30, 32430);

-- table 8
CREATE TABLE PE_treatments -- patient employee treatment
(patient_ID INT,
employee_number INT,
hospital_name VARCHAR(40) NOT NULL,
Hospital_city VARCHAR(40) NOT NULL,
PRIMARY KEY (patient_ID, employee_number),
FOREIGN KEY (employee_number) REFERENCES Employees(employee_number),
FOREIGN KEY (patient_ID) REFERENCES Patients(ID),
FOREIGN KEY (hospital_name, Hospital_city) REFERENCES Hospitals(name, city)) 
ENGINE=INNODB;

INSERT INTO PE_treatments
VALUES
(100, 10, "Belinson", "Petah Tikva"),
(101, 10, "Belinson", "Petah Tikva"),
(104, 14, "Hadasa", "Jerusalem"),
(102, 11, "Asuta", "Ashdod");

-- table 9
CREATE TABLE Medications
(ID INT,
name VARCHAR(40),
Administration_way VARCHAR(100),
PRIMARY KEY (ID))
ENGINE=INNODB;

INSERT INTO Medications
VALUES
(20, "Valume", "IV injection"),
(21, "Epinephrine", "IV injection"),
(22, "Dopamine", "IM injection"),
(23, "Esmolol", "IV injection"),
(24, "Synthomycine", "ointment"),
(25, "Vasopressin", "IV injection"),
(26, "Augmentin", "Pills"),
(27, "Cefadroxil", "Syrup"),
(28, "Cefixime", "Syrup"),
(29,"Lansoprazole" ,"Pills"),
(30, "Omeprazole" , "Pills"),
(31, "Doxycycline","IM injection");


-- table 10
CREATE TABLE Medical_procedures
(ID INT,
name VARCHAR(40),
price INT,
Restrictions VARCHAR(250),
PRIMARY KEY (ID)) 
ENGINE=INNODB;

INSERT INTO Medical_procedures
VALUES
(30, "fMRI Imaging", 5000, "The patient can not have non-MRI compatible metals in his body"),
(31, "Cardiovascular monitoring", 400, NULL),
(32, "CT Imaging", 1500, "The patient must not be in pregnant"),
(33, "Colonoscopy", 300, "The patient must fast for 8 hours before the procedure"),
(34, "Transplant", 20000, "The patient nust have the same blood type as the donor"),
(35, "MRI Imaging", 5000, "The patient can not have non-MRI compatible metals in his body"),
(36, "Gastroscopy", 300, "The patient must fast for 8 hours before the procedure");

-- table 11
CREATE TABLE Medical_devices
(procedure_ID INT,
device_name VARCHAR(40),
PRIMARY KEY (procedure_ID, device_name),
FOREIGN KEY (procedure_ID) REFERENCES Medical_procedures(ID)) 
ENGINE=INNODB;

INSERT INTO Medical_devices
VALUES
(30, "MRI"),
(31, "Monitor"),
(31, "Electrodes"),
(32, "CT"),
(33, "Tube"),
(34, "Scalpel"),
(35, "MRI"),
(36, "Camera");

-- table 12
CREATE TABLE Sensitivity
(patient_ID INT,
medication_ID INT,
PRIMARY KEY (patient_ID, medication_ID),
FOREIGN KEY (patient_ID) REFERENCES Patients(ID),
FOREIGN KEY (medication_ID) REFERENCES Medications(ID)) 
ENGINE=INNODB;

INSERT INTO Sensitivity
VALUES
(100, 26),
(100, 24),
(101, 20),
(102, 23),
(103, 22),
(103, 21),
(105, 28),
(106, 30),
(107, 31),
(110, 31);

-- table 13
CREATE TABLE P_MP_treatments -- patient medical_procedure treatment
(patient_ID INT,
Procedure_ID INT,
PRIMARY KEY (patient_ID, Procedure_ID),
FOREIGN KEY (patient_ID) REFERENCES Patients(ID),
FOREIGN KEY (Procedure_ID) REFERENCES Medical_procedures(ID))
ENGINE=INNODB;

INSERT INTO P_MP_treatments
VALUES
(100, 33),
(102, 34),
(104, 30),
(101, 33),
(103, 32),
(104, 36),
(108, 35),
(109, 33),
(107, 32),
(110, 31);

-- table 14
CREATE TABLE Participants_in_procedure
(employee_number INT,
procedure_ID INT,
hospital_name VARCHAR(40),
Hospital_city VARCHAR(40),
PRIMARY KEY (employee_number, procedure_ID, hospital_name, Hospital_city),
FOREIGN KEY (employee_number) REFERENCES Employees(employee_number),
FOREIGN KEY (procedure_ID) REFERENCES Medical_procedures(ID),
FOREIGN KEY (hospital_name, Hospital_city) REFERENCES Hospitals(name, city))
ENGINE=INNODB;

INSERT INTO Participants_in_procedure
VALUES
(14, 33, "Hadasa", "Jerusalem"),
(10, 34, "Refael", "Tel Aviv"),
(10, 32, "Belinson", "Petah Tikva"),
(13, 30, "Meir", "Kefar Saba");

-- table 15
CREATE TABLE PM_treatments -- patient medication treatment
(patient_ID INT,
medication_ID INT,
PRIMARY KEY (patient_ID, medication_ID),
FOREIGN KEY (patient_ID) REFERENCES Patients(ID),
FOREIGN KEY (medication_ID) REFERENCES Medications(ID)) 
ENGINE=INNODB;

INSERT INTO PM_treatments
VALUES
(100, 25),
(101, 20),
(102, 22),
(103, 26),
(103, 20),
(104, 26),
(108, 25),
(109, 23),
(107, 22),
(110, 21);

-- table 16
CREATE TABLE PP_restrictions -- patient Procedure restrictions
(patient_ID INT,
Procedure_ID INT,
restrictions VARCHAR(200),
PRIMARY KEY (patient_ID, Procedure_ID, restrictions),
FOREIGN KEY (patient_ID) REFERENCES Patients(ID),
FOREIGN KEY (Procedure_ID) REFERENCES Medical_procedures(ID))
ENGINE=INNODB;

INSERT INTO PP_restrictions
VALUES
(100, 30, "The patient has a non-MRI compatible steel in his body"),
(104, 33, "The patient did not fast before the procedure"),
(102, 34, "The patient do not have a donor with the same blood type"),
(101, 32, "The patient is pregnant"),
(109, 35, "The patient has a non-MRI compatible steel in her body"),
(106, 36, "The patient did not fast before the procedure");
