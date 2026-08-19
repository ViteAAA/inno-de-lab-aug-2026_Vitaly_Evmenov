-- Выбрать всех сотрудников, чтобы просмотреть их данные до операций
SELECT 
	*
FROM employees
ORDER BY employeeid DESC;

-- транзакция увеличения зарплаты и отката назад
BEGIN; 	

UPDATE employees
SET salary = salary * 0.1 + salary
WHERE department = 'HR';

SELECT 
	*
FROM employees
ORDER BY employeeid DESC;

ROLLBACK;

-- повышение в должности сотрудников, зарплата которых выше 70000
SELECT 
	*
FROM employees 
ORDER BY 
	employeeid  DESC;

-- транзакция обновления отдела сотрудников с зарплатой выше 70000
BEGIN;

UPDATE employees
SET department = 'Senior IT'
WHERE salary > 70000.00;

SELECT 
	* 
FROM employees 
ORDER BY 
	employeeid DESC;

ROLLBACK;

-- проверка отката изменений
SELECT 
	*
FROM employees 
ORDER BY 
	employeeid  DESC;

-- удаление сотрудников
SELECT 
	*
FROM 
	employees
ORDER BY employeeid;

BEGIN;

DELETE FROM 
	employees e
WHERE e.employeeid IN (
	SELECT 
		e2.employeeid
	FROM employees e2 
	LEFT JOIN employeeprojects ep ON e2.employeeid = ep.employeeid 
	WHERE ep.employeeid IS NULL
);

SELECT 
	*
FROM 
	employees
ORDER BY employeeid;

ROLLBACK;

-- вставка проекта и назначение сотрудников
SELECT 
	*
FROM projects;

BEGIN;

INSERT INTO projects (projectname, budget, startdate, enddate)
VALUES 
	('Update soft for VR', 120000, current_date, DATE'2026-10-01');

SELECT 
	*
FROM 
	projects;

INSERT INTO employeeprojects (employeeid, projectid, hoursworked)
VALUES
	(1, 4, 75),
	(2, 4, 65);
	

SELECT 
	*
FROM 
	employeeprojects;

ROLLBACK;
