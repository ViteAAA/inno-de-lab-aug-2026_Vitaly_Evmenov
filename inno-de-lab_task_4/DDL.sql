-- создание таблицы Departments
CREATE TABLE Departments (
	DepartmentId SERIAL PRIMARY KEY,
	DepartmentName VARCHAR(50) UNIQUE NOT NULL,
	Location VARCHAR(50)
);

ALTER TABLE employees DROP COLUMN email;

-- изменение таблицы employees
ALTER TABLE employees ADD COLUMN email VARCHAR(50);

ALTER TABLE employees ADD CONSTRAINT UQ_Email UNIQUE (email);

-- сделать email обязательным полем (делается только после заполнения этого поля данными, в противном случае - ошибка)
ALTER TABLE employees ALTER COLUMN email SET NOT NULL;

-- обновление данных в таблице employees
UPDATE employees
SET email = LOWER(firstname) || LOWER(lastname) || '@gmail.com';
-- добовление правила в таблице employees
ALTER TABLE employees ADD CONSTRAINT UQ_Email UNIQUE (email);

-- переименование колонки в таблице departments
ALTER TABLE departments RENAME COLUMN location TO OfficeLocation;