# -MEDICAL-DATASET-SQL-ANALYSIS-
A structured SQL project focused on analyzing medical datasets to extract actionable insights. The repository includes schema design, data import workflows, and optimized queries for patient records, treatments, and hospital operations.

The SQL project on the medicalreports dataset features 33 comprehensive practice queries demonstrating core to intermediate SQL skills on healthcare data. Work focused on a relational database with four main tables: patients (demographics, vitals, allergies), admissions (dates, diagnoses), doctors (specialties), and provinces (locations).
​

# KEY ANALYSIS AREA
1. Patient Filtering & Exploration: Queries filtered by gender, allergies (NULL handling/UPDATE to 'NKA'), names (LIKE 'C%', starts/ends with 's'), weights (BETWEEN 100-120), heights (>160cm with weight >70kg), and birth years (1970s decade, 2010 count).
​

2. Aggregations & Grouping: COUNT for admissions (total, per patient, same-day), unique cities/provinces, birth years, allergies popularity (excluding NULLs), patients per city (ordered by volume), male/female counts in one row via CASE.
​

3. Joins & Relationships: Multi-table JOINs linked patients to provinces (full names/locations), admissions (diagnoses like Dementia/Epilepsy), and doctors (specialties for Epilepsy patients treated by 'Lisa'). Also UNION for patient/doctor roles

# READMISSION INSIGHTS
Total admissions across all patients indicate overall hospital activity levels.
​

Patient 579 had multiple admissions, serving as an example of a high-readmission case.
​

Query 22 identifies patients readmitted multiple times (>1) for the same diagnosis (GROUP BY patientid, diagnosis HAVING COUNT(*) >1), revealing potential chronic condition patterns like repeated Dementia entries.
​

Same-day admissions/discharges (admissiondate = dischargedate) flag short-stay or observation cases, which could proxy low-risk readmissions



# EER DIAGRAM

<img width="1919" height="980" alt="Screenshot 2026-01-30 141129" src="https://github.com/user-attachments/assets/4cb4c87d-3d30-402c-85f9-806e602a211a" />

This  (EER) diagram represents the core structure of a healthcare database system built in MySQL. It models key entities and their relationships to support efficient management of patient records, doctor profiles, and hospital admissions.

This schema is designed to support real-world healthcare operations such as:
- Recording patient visits and diagnoses
- Assigning doctors to cases
- Analyzing patient demographics and regional health trends
The diagram provides a clear and normalized structure, ideal for building scalable medical applications or analytics dashboards.

# CONCLUSION

This EER diagram provides a robust foundation for a healthcare database system, capturing essential relationships between patients, doctors, admissions, and geographic data. Its normalized structure ensures data integrity, scalability, and ease of querying for real-world medical applications. Whether you're building dashboards, running analytics, or developing patient management tools, this schema offers a clear and efficient starting point for backend development and data-driven decision-making.


