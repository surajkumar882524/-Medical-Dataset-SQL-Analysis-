# -Medical-Dataset-SQL-Analysis-
A structured SQL project focused on analyzing medical datasets to extract actionable insights. The repository includes schema design, data import workflows, and optimized queries for patient records, treatments, and hospital operations.

The SQL project on the medicalreports dataset features 33 comprehensive practice queries demonstrating core to intermediate SQL skills on healthcare data. Work focused on a relational database with four main tables: patients (demographics, vitals, allergies), admissions (dates, diagnoses), doctors (specialties), and provinces (locations).
​

# Key Analysis Areas
1. Patient Filtering & Exploration: Queries filtered by gender, allergies (NULL handling/UPDATE to 'NKA'), names (LIKE 'C%', starts/ends with 's'), weights (BETWEEN 100-120), heights (>160cm with weight >70kg), and birth years (1970s decade, 2010 count).
​

2. Aggregations & Grouping: COUNT for admissions (total, per patient, same-day), unique cities/provinces, birth years, allergies popularity (excluding NULLs), patients per city (ordered by volume), male/female counts in one row via CASE.
​

3. Joins & Relationships: Multi-table JOINs linked patients to provinces (full names/locations), admissions (diagnoses like Dementia/Epilepsy), and doctors (specialties for Epilepsy patients treated by 'Lisa'). Also UNION for patient/doctor roles

# Readmissions Insights
Total admissions across all patients indicate overall hospital activity levels.
​

Patient 579 had multiple admissions, serving as an example of a high-readmission case.
​

Query 22 identifies patients readmitted multiple times (>1) for the same diagnosis (GROUP BY patientid, diagnosis HAVING COUNT(*) >1), revealing potential chronic condition patterns like repeated Dementia entries.
​

Same-day admissions/discharges (admissiondate = dischargedate) flag short-stay or observation cases, which could proxy low-risk readmissions
