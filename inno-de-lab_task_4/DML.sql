-- вставка данных в таблицу employees
INSERT INTO employees (firstname, lastname, department, salary)
VALUES 
	('Jon', 'Smith', 'HR', 5000),
	('Aron', 'Simson', 'Finance', 50000);


-- проверка вставки
SELECT 
	*
FROM employees e;

-- выборка работников, работающих в департаменте IT
SELECT
	e.firstname,
	e.lastname
FROM employees e 
WHERE e.department = 'IT';


-- обновление зарплаты
UPDATE employees
SET salary = 65000
WHERE firstname = 'Alice' AND lastname = 'Smith';

-- удаление Евы
DELETE FROM employees
WHERE firstname = 'Eve' AND lastname = 'Davis';

-- проверка корректности всех операций
SELECT 
	*
FROM 
	employees;
	