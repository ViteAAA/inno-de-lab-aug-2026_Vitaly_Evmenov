SELECT 
	p.projectname
FROM employeeprojects ep
INNER JOIN employees e 
ON e.employeeid = ep.employeeid 
INNER JOIN projects p
ON ep.projectid = p.projectid
WHERE 
	e.firstname = 'Bob'
	AND e.lastname = 'Johnson'
	AND ep.hoursworked > 150

ROLLBACK;
BEGIN;

UPDATE projects
SET budget = budget * 1.1
WHERE projectid IN (
	SELECT DISTINCT
		ep.projectid
	FROM 
		employeeprojects ep
	INNER JOIN employees e
	ON ep.employeeid = e.employeeid 
	WHERE 
		e.department = 'IT'
	
);

SELECT 
	*
FROM
	projects;

ROLLBACK;


-- транзакция изменения enddate в projects

SELECT 
	*
FROM 
	projects;

BEGIN;

UPDATE projects
SET enddate = startdate + INTERVAL '1 year'
WHERE enddate IS NULL;

SELECT 
	*
FROM 
	projects;

ROLLBACK;

-- вставка сотрудника

SELECT
	*
FROM
	employees;

SELECT
	*
FROM
	projects;

BEGIN;

WITH inserted_value AS (
	INSERT INTO employees (firstname, lastname, department, salary, email)
	VALUES 
		('Evgeny', 'Ivanov', 'HR', 20000, 'evgenyivanov@gmail.com')
	RETURNING employeeid
)
INSERT INTO employeeprojects (employeeid, projectid, hoursworked)
SELECT 
	employeeid, 
	(
		SELECT 
			Projectid
		FROM Projects
		WHERE ProjectName = 'Website Redesign'
	), 
	80
FROM inserted_value;

SELECT
	*
FROM
	projects;

SELECT
	*
FROM
	employeeprojects;

ROLLBACK;
