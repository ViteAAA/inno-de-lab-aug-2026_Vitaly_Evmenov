-- создание таблицы Departments
CREATE TABLE Departments (
	DepartmentId SERIAL PRIMARY KEY,
	DepartmentName VARCHAR(50) UNIQUE NOT NULL,
	Location VARCHAR(50)
);

-- изменение таблицы employees
ALTER TABLE employees ADD COLUMN email VARCHAR(100);

-- добавление ограничения UNIQUE для Email
ALTER TABLE employees ADD CONSTRAINT UQ_Email UNIQUE (email);

-- сделать email обязательным полем (делается только после заполнения этого поля данными, в противном случае - ошибка)
ALTER TABLE employees ALTER COLUMN email SET NOT NULL;

-- обновление данных в таблице employees
UPDATE employees
SET email = LOWER(firstname) || LOWER(lastname) || '@gmail.com';


-- переименование колонки в таблице departments
ALTER TABLE departments RENAME COLUMN location TO OfficeLocation;
