DROP DATABASE IF EXISTS `moda_analysis`;
CREATE DATABASE `moda_analysis`;
USE `moda_analysis`;


CREATE TABLE Patients (
    PatientID VARCHAR(36) PRIMARY KEY,
    Age INT,
    Gender ENUM('Male', 'Female', 'Other'),
    ZipCode VARCHAR(10),
    Company VARCHAR(255)
);

CREATE TABLE Providers (
    ProviderID VARCHAR(36) PRIMARY KEY,
    ProviderName VARCHAR(255),
    Specialty ENUM('General Practitioner', 'Cardiologist', 'Surgeon'),
    YearsExperience INT,
    Rating DECIMAL(2, 1),
    Company VARCHAR(255)
);

CREATE TABLE Visits (
    VisitID VARCHAR(36) PRIMARY KEY,
    PatientID VARCHAR(36),
    VisitDate DATE,
    ProviderID VARCHAR(36),
    ServiceType ENUM('General Consultation', 'Surgery', 'Emergency'),
    DiagnosisCode VARCHAR(10),
    TreatmentCode VARCHAR(10),
    Company VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (ProviderID) REFERENCES Providers(ProviderID)
);

CREATE TABLE Costs (
    VisitID VARCHAR(36),
    TotalCost DECIMAL(10, 2),
    InsurancePaid DECIMAL(10, 2),
    PatientPaid DECIMAL(10, 2),
    CostCategory ENUM('Medication', 'Surgery', 'Consultation'),
    Company VARCHAR(255),
    PRIMARY KEY (VisitID),
    FOREIGN KEY (VisitID) REFERENCES Visits(VisitID)
);

CREATE TABLE QualityMetrics (
    VisitID VARCHAR(36),
    ReadmissionRate DECIMAL(3, 2),
    PatientSatisfactionScore INT,
    AdverseEvents INT,
    TreatmentOutcome ENUM('Improved', 'Unchanged', 'Worsened'),
    Company VARCHAR(255),
    PRIMARY KEY (VisitID),
    FOREIGN KEY (VisitID) REFERENCES Visits(VisitID)
);



