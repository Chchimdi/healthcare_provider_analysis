-- Age distribution of patients
SELECT
Age,
COUNT(DISTINCT PatientID) Number_of_Patients
FROM Patients
GROUP BY Age
ORDER BY Number_of_Patients DESC;

-- Gender ratio of patients
SELECT
Gender,
COUNT(DISTINCT PatientID) Number_of_Patients
FROM Patients
GROUP BY Gender
ORDER BY Number_of_Patients DESC;

-- Distribution of patients across different zip codes
SELECT
ZipCode,
COUNT(DISTINCT PatientID) Number_of_Patients
FROM Patients
GROUP BY ZipCode
ORDER BY Number_of_Patients DESC;