-- Average cost per visit
SELECT AVG(TotalCost) as average_cost
FROM Costs;

-- Distribution of costs across different cost categories
SELECT CostCategory, AVG(TotalCost) as average_cost
FROM Costs
GROUP BY CostCategory;

-- proportion of costs covered by insurance vs. paid by patients
SELECT 
YEAR(vs.VisitDate) as VisitYear,
MONTH(vs.VisitDate) as VisitMonth,
SUM(cs.TotalCost) as Total_cost,
SUM(cs.InsurancePaid) Insurance,
SUM(cs.PatientPaid) Out_of_Pocket
FROM Costs cs
JOIN Visits vs
	ON cs.VisitID = vs.VisitID
GROUP BY VisitYear, VisitMonth;