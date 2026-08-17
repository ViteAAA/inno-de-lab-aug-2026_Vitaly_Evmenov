-- вставка значений от пользователя hr_user
INSERT INTO employees (employeeid, firstname, lastname, department, salary, email)
VALUES (8, 'god', 'odin', 'IT', 76000, 'hr@gmail.com');

-- выборка значений 
SELECT 
	*
FROM 
	employees;

-- обновление значений 
UPDATE employees
SET email = 'newhr@gmail.com'
sWHERE employeeid = 8;