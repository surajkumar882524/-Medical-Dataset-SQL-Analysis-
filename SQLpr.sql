create database medical_reports;
use medical_reports;
select*from doctors;
select*from admissions;
select*from patients;
select*from provinces;

#1. Show first name, last name, and gender of patients who's gender is 'M'
SELECT first_name,last_name from patients where gender = 'm';

#2. Show first name and last name of patients who does not have allergies.
SELECT first_name,last_name from patients where allergies is null;

#3. Show first name of patients that start with the letter 'C'
SELECT first_name from patients where first_name LIKE 'c%';

#4. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
SELECT first_name,last_name from patients where weight between 100 AND 120;

#5.  Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
 UPDATE patients set allergies = 'NKA' WHERE allergies IS NULL;
 select * from patients;

#6. Show first name and last name concatenated into one column to show their full name. 
SELECT concat(first_name,last_name) as full_name from patients;

#7. Show first name, last name, and the full province name of each patient.
SELECT first_name, last_name, province_name from patients join provinces on patients.province_id = provinces.province_id;

#8. Show how many patients have a birth_date with 2010 as the birth year.
#SELECT first_name,last_name,birth_date as birth_year from patients where year('2010');
#select birth_date as birth_year from patients where year(birth_date) '2010';
#select * from patients where birth_date = '2010';
# COUNT(*) AS birth_year FROM patients WHERE YEAR(birth_date) = 2010;
#SELECT count(birth_date) from patients where year('2010');
#SELECT COUNT(*) AS birth_year FROM patients WHERE YEAR(birth_date) = 2010;
#SELECT first_name, last_name, birth_date FROM patients WHERE birth_date >= '2010-01-01' AND birth_date < '2011-01-01';
SELECT birth_date FROM patients WHERE birth_date like '%2010%';

#9.  Show the first_name, last_name, and height of the patient with the greatest height. 
SELECT first_name,last_name,height from patients order by height desc;

#10.  Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000
SELECT * from patients where patient_id IN (1,45,534,879,1000);

#11.  Show the total number of admissions
SELECT count(admission_date) from admissions;

#12.  Show all the columns from admissions where the patient was admitted and discharged on the same day. 
SELECT admission_date, discharge_date from admissions where admission_date = discharge_date;

#13.  Show the total number of admissions for patient_id 579.
SELECT count(admission_date), patient_id from admissions where patient_id = '579';

#14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
SELECT DISTINCT city from patients where province_id = 'NS';

#15. Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70
SELECT first_name , last_name, height, weight from patients where height >='160' AND weight >= '70';

#16.  Show unique birth years from patients and order them by ascending.
#SELECT DISTINCT year(birth_date) as birth_year from patients order by birth_year asc;
#SELECT DISTINCT birth_date as birth_year from patients order by birth_year;

#17.  Show unique first names from the patients table which only occurs once in the list.
SELECT first_name from patients group by first_name having count(first_name) = 1;


#18. Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
SELECT patient_id, first_name from patients where first_name LIKE  's%' AND first_name like '%s' and length(first_name) >= 6;

#19. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.   Primary diagnosis is stored in the admissions table. 
#SELECT first_name, last_name, diagnosis from patients  join admissions  on patients.patient_id = admissions.patient_id where a.primary_diagnosis = 'Dementia';
SELECT  p.patient_id, p.first_name, p.last_name, a.diagnosis FROM patients p  JOIN admissions a ON p.patient_id = a.patient_id where a.diagnosis = 'Dementia';

#20.  Display every patient's first_name. Order the list by the length of each name and then by alphbetically.
SELECT first_name from patients order by length(first_name), first_name;

#21. Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.
#SELECT count(gender) from patients where gender = 'm' or 'f';
SELECT count(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) AS male, count(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) AS female FROM patients;


#22. Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
SELECT patient_id, diagnosis from admissions group by patient_id,diagnosis having count(*) > 1;

#23.  Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.
SELECT city, count(*) as totaL_patient from patients group by city order by total_patient desc, city asc;

#24. Show first name, last name and role of every person that is either patient or doctor.    The roles are either "Patient" or "Doctor" 
#SELECT first_name, last_name, specialty from doctors;
SELECT first_name, last_name, 'Patient' AS role FROM patients UNION SELECT first_name, last_name, 'Doctor' AS role FROM doctors;

#25. Show all allergies ordered by popularity. Remove NULL values from query.
SELECT allergies,count(*) as total_case from patients where allergies is not null group by allergies order by total_case;
#SELECT allergies, COUNT(*) AS total_cases FROM patients WHERE allergies IS NOT NULL GROUP BY allergies ORDER BY total_cases DESC, allergies ASC;

#26.  Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
SELECT first_name, last_name, birth_date from patients where birth_date between '1970' AND '1979' order by birth_date asc;


#27. We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower 
#case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order    EX: SMITH,jane

SELECT concat(upper(last_name), ',', lower(first_name)) as full_name from patients order by lower(first_name)desc;

#28.  Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
SELECT province_id, sum(height) as total_height from patients  group by province_id having sum(height)>='7000';

#29. Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni' 
SELECT max(weight) - min(weight) as weight_difference from patients where last_name = 'maroni';

#30.  Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions. 
SELECT DAY(admission_date) AS day_of_month,COUNT(*) AS total_admissions FROM admissions GROUP BY DAY(admission_date) ORDER BY total_admissions DESC, day_of_month ASC;

#31. Show all of the patients grouped into weight groups. Show the total amount of patients in each weight group. Order the list by the weight group 
# decending. e.g. if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc.

SELECT (FLOOR(weight / 10) * 10) AS weight_group, COUNT(*) AS total_patients FROM patients GROUP BY weight_group ORDER BY weight_group DESC;


#32.  Show patient_id, weight, height, is Obese from the patients table. Display i sObese as a boolean 0 or 1. Obese is defined as weight(kg)/(height(m). 
# Weight is in units kg. Height is in units cm.

SELECT patient_id, weight, height, CASE WHEN (weight / POWER(height / 100.0, 2)) >= 30 THEN 1 ELSE 0 END AS isObese FROM patients;

#33. Show patient_id, first_name, last_name, and attending doctor's specialty. Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first 
#name is 'Lisa'. Check patients, admissions, and doctors tables for required information

#  SELECT patient_id, first_name, last_name , specialty from patients Join admissions on patients.patient_id = admissions.patient_id join doctors on admissions.doctor_id = doctors.doctor_id
#where admissions.diagnosis = 'Epilepsy' and doctors.first_name = 'Lisa';

SELECT p.patient_id, p.first_name, p.last_name, d.specialty FROM patients p JOIN admissions a ON p.patient_id = a.patient_id JOIN doctors d ON a.doctor_id = d.doctor_id WHERE a.diagnosis = 'Epilepsy' AND d.first_name = 'Lisa';








