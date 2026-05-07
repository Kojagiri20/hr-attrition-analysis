#Attrition Rate by Department
SELECT Department,
       COUNT(*) AS total_employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
       ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_percent
FROM hr_attrition_clean
GROUP BY Department
ORDER BY attrition_rate_percent DESC;

#Average Salary - Left vs Stayed
SELECT Attrition,
       ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_salary
FROM hr_attrition_clean
GROUP BY Attrition;

#Overtime vs Attrition
SELECT OverTime,
       Attrition,
       COUNT(*) AS employee_count
FROM hr_attrition_clean
GROUP BY OverTime, Attrition
ORDER BY OverTime, Attrition;

#Top Job Roles with Highest Attrition
SELECT JobRole,
       COUNT(*) AS employees_left
FROM hr_attrition_clean
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY employees_left DESC
LIMIT 5;

#Average Tenure - Left vs Stayed
SELECT Attrition,
       ROUND(AVG(YearsAtCompany), 1) AS avg_years_at_company
FROM hr_attrition_clean
GROUP BY Attrition;
