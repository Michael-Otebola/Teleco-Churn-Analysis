CREATE DATABASE TelecommChurn;
USE TelecommChurn;

-- Verify Data Structure
DESCRIBE telecomm_customer;

-- Data Exploration Queries
-- Get Basic Information on Row Count and Null Values
SELECT 
    COUNT(*) AS TotalRows,
    COUNT(gender) AS NonNullGender,
    COUNT(SeniorCitizen) AS NonNullSeniorCitizen,
    COUNT(Partner) AS NonNullPartner,
    COUNT(Dependents) AS NonNullDependents,
    COUNT(tenure) AS NonNullTenure,
    COUNT(PhoneService) AS NonNullPhoneService,
    COUNT(MultipleLines) AS NonNullMultipleLines,
    COUNT(InternetService) AS NonNullInternetService,
    COUNT(OnlineSecurity) AS NonNullOnlineSecurity,
    COUNT(OnlineBackup) AS NonNullOnlineBackup,
    COUNT(DeviceProtection) AS NonNullDeviceProtection,
    COUNT(TechSupport) AS NonNullTechSupport,
    COUNT(StreamingTV) AS NonNullStreamingTV,
    COUNT(StreamingMovies) AS NonNullStreamingMovies,
    COUNT(Contract) AS NonNullContract,
    COUNT(PaperlessBilling) AS NonNullPaperlessBilling,
    COUNT(PaymentMethod) AS NonNullPaymentMethod,
    COUNT(MonthlyCharges) AS NonNullMonthlyCharges,
    COUNT(TotalCharges) AS NonNullTotalCharges,
    COUNT(Churn) AS NonNullChurn
FROM telecomm_customer;

-- Gender Count
SELECT 
    gender, COUNT(*) AS GenderCount
FROM telecomm_customer
GROUP BY gender;

-- Churn Count
SELECT 
    Churn, COUNT(*) AS ChurnCount
FROM telecomm_customer
GROUP BY Churn;
-- Contract Count
SELECT 
    Contract, COUNT(*) AS ContractCount
FROM telecomm_customer
GROUP BY Contract;

-- Examine the Distribution of Categorical Variables
SELECT 
    Partner, COUNT(*) AS PartnerCount
FROM telecomm_customer
GROUP BY Partner;

SELECT 
    PaymentMethod, COUNT(*) AS PaymentMethodCount
FROM telecomm_customer
GROUP BY PaymentMethod;

 -- Basic Summary Statistics for Numerical Columns
 SELECT 
    MIN(SeniorCitizen) AS MinSeniorCitizen,
    MAX(SeniorCitizen) AS MaxSeniorCitizen,
    AVG(SeniorCitizen) AS AvgSeniorCitizen,
    MIN(tenure) AS MinTenure,
    MAX(tenure) AS MaxTenure,
    AVG(tenure) AS AvgTenure,
    MIN(MonthlyCharges) AS MinMonthlyCharges,
    MAX(MonthlyCharges) AS MaxMonthlyCharges,
    AVG(MonthlyCharges) AS AvgMonthlyCharges,
    MIN(TotalCharges) AS MinTotalCharges,
    MAX(TotalCharges) AS MaxTotalCharges,
    AVG(TotalCharges) AS AvgTotalCharges
FROM telecomm_customer;

-- Standardizing Text-Based Categorical Variables
-- Update Churn column: Yes -> 1, No -> 0
UPDATE telecomm_customer
SET Churn = CASE
    WHEN Churn = 'Yes' THEN 1
    WHEN Churn = 'No' THEN 0
    ELSE Churn
END;

-- Verify the updates to the 'Churn' column
SELECT customerID, Churn
FROM telecomm_customer
LIMIT 10;
SET SQL_SAFE_UPDATES = 0;

-- Check for invalid or missing values in 'TotalCharges' and 'MonthlyCharges'
SELECT customerID, TotalCharges, MonthlyCharges
FROM telecomm_customer
WHERE TotalCharges IS NULL OR MonthlyCharges IS NULL
   OR TotalCharges NOT REGEXP '^[0-9]+(\.[0-9]{1,2})?$'
   OR MonthlyCharges NOT REGEXP '^[0-9]+(\.[0-9]{1,2})?$';

-- Descriptive Statistics
-- Summary statistics for the numerical columns
SELECT
    MIN(MonthlyCharges) AS Min_MonthlyCharges,
    MAX(MonthlyCharges) AS Max_MonthlyCharges,
    AVG(MonthlyCharges) AS Avg_MonthlyCharges,
    STDDEV(MonthlyCharges) AS StdDev_MonthlyCharges,
    MIN(TotalCharges) AS Min_TotalCharges,
    MAX(TotalCharges) AS Max_TotalCharges,
    AVG(TotalCharges) AS Avg_TotalCharges,
    STDDEV(TotalCharges) AS StdDev_TotalCharges,
    MIN(tenure) AS Min_Tenure,
    MAX(tenure) AS Max_Tenure,
    AVG(tenure) AS Avg_Tenure,
    STDDEV(tenure) AS StdDev_Tenure
FROM telecomm_customer;

-- Distribution of Monthly Charges
SELECT
    MonthlyCharges,
    COUNT(*) AS Frequency
FROM telecomm_customer
GROUP BY MonthlyCharges
ORDER BY Frequency DESC
LIMIT 10;

-- Correlation between MonthlyCharges and TotalCharges
 -- Using the Pearson Correlation Formular [between MonthlyCharges and TotalCharges]
SELECT
    (COUNT(*) * SUM(MonthlyCharges * TotalCharges) - SUM(MonthlyCharges) * SUM(TotalCharges)) /
    (SQRT(COUNT(*) * SUM(POW(MonthlyCharges, 2)) - POW(SUM(MonthlyCharges), 2)) *
     SQRT(COUNT(*) * SUM(POW(TotalCharges, 2)) - POW(SUM(TotalCharges), 2))) AS Correlation
FROM telecomm_customer;


-- Exploring Churn Rate
-- Distribution of Churn (1 = Yes, 0 = No)
SELECT Churn, COUNT(*) AS Frequency
FROM telecomm_customer
GROUP BY Churn;

-- Churn by Customer Demographics
-- Churn by SeniorCitizen status (1 = Yes, 0 = No)
SELECT SeniorCitizen, Churn, COUNT(*) AS Frequency
FROM telecomm_customer
GROUP BY SeniorCitizen, Churn;

-- Churn by Partner status (1 = Yes, 0 = No)
SELECT Partner, Churn, COUNT(*) AS Frequency
FROM telecomm_customer
GROUP BY Partner, Churn;

-- Churn by Contract Type (1 = Yes, 0 = No)
SELECT Contract, Churn, COUNT(*) AS Frequency
FROM telecomm_customer
GROUP BY Contract, Churn;

-- Monthly Charges vs Churn Status (1 = Yes, 0 = No)
SELECT Churn, AVG(MonthlyCharges) AS AvgMonthlyCharges
FROM telecomm_customer
GROUP BY Churn;

-- Tenure Vs Churn (1 = Yes, 0 = No)
SELECT Churn, AVG(tenure) AS AvgTenure
FROM telecomm_customer
GROUP BY Churn;





