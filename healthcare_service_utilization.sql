-- The most common types of services provided
SELECT
ServiceType,
COUNT(VisitID) times_provided
FROM Visits
GROUP BY ServiceType
ORDER BY times_provided DESC;

-- Number of Visits per Service Type
SELECT
ServiceType,
COUNT(VisitID) times_provided
FROM Visits
GROUP BY ServiceType
ORDER BY times_provided DESC;


-- daily visits
SELECT DATE(VisitDate) AS VisitDate, COUNT(*) AS VisitCount
FROM Visits
GROUP BY DATE(VisitDate)
ORDER BY VisitDate;

-- weekly visits
SELECT YEAR(VisitDate) AS Year, WEEK(VisitDate) AS Week, COUNT(*) AS VisitCount
FROM Visits
GROUP BY YEAR(VisitDate), WEEK(VisitDate)
ORDER BY Year, WEEK;

-- monthly visits
SELECT YEAR(VisitDate) AS Year, MONTH(VisitDate) AS Month, COUNT(*) AS VisitCount
FROM Visits
GROUP BY YEAR(VisitDate), MONTH(VisitDate)
ORDER BY Year, Month;

