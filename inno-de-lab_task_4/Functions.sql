-- функция расчета бонуса к зарплате
CREATE OR REPLACE FUNCTION CalculateAnnualBonus(
	employeeid 	INT,
	salary 		DECIMAL
)
RETURNS DECIMAL
LANGUAGE plpgSQL
AS $$
BEGIN
	RETURN salary * 0.1;
END;
$$;
-- использование функции в select запросе
SELECT 
	employeeid,
	firstname,
	lastname,
	salary,
	CalculateAnnualBonus(employeeid, salary) AS salarybonus
FROM employees;

-- создание представления
CREATE VIEW IT_Department_View AS SELECT EmployeeId, FirstName, LastName, Salary
FROM employees
WHERE Department = 'IT';

SELECT
	*
FROM 
	IT_Department_View;