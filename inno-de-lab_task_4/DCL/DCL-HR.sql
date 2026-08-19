-- вставка значений от пользователя hr_user
INSERT INTO employees (firstname, lastname, department, salary, email)
VALUES ('god', 'odin', 'IT', 76000, 'hr@gmail.com');

-- выборка значений 
SELECT 
	*
FROM 
	employees;

-- обновление значений 
UPDATE employees
SET email = 'newhr@gmail.com'
WHERE email = 'hr@gmail.com';