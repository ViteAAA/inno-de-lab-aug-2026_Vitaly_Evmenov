-- table of tenants
CREATE TABLE dim_Tenants(
    TenantId SERIAL PRIMARY KEY,
    Email VARCHAR(250) NOT NULL,
    PassportId BIGINT NOT NULL UNIQUE,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    DateOfBirthday DATE NOT NULL CHECK (DateOfBirthday > DATE'1900-01-01')
);
ALTER TABLE
    dim_Tenants ADD CONSTRAINT dim_tenants_email_unique UNIQUE(Email);
ALTER TABLE
    dim_Tenants ADD CONSTRAINT dim_tenants_passportid_unique UNIQUE(PassportId);

-- table of realty
CREATE TABLE dim_Realty(
    RealtyId SERIAL PRIMARY KEY,
    Address VARCHAR(100) NOT NULL,
    Type VARCHAR(100) NOT NULL,
    Rooms INTEGER NOT NULL,
    Realty_Area DECIMAL(8, 2) NOT NULL,
    Description TEXT NOT NULL,
    
    CONSTRAINT CHK_Rooms CHECK (Rooms > 0),
    CONSTRAINT CHK_Area CHECK (Realty_Area > 0)
);
ALTER TABLE
    dim_Realty ADD CONSTRAINT dim_realty_address_unique UNIQUE(Address);

-- table of employees
CREATE TABLE dim_Employees(
    EmployeeId SERIAL PRIMARY KEY,
    PassportId BIGINT NOT NULL UNIQUE,
    Email VARCHAR(255) NOT NULL,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    EmploymentType VARCHAR(100) NOT NULL,
    ContractTerm DATE NOT NULL,
    HireDate DATE NOT NULL,
    
    CONSTRAINT CHK_ValidContractTerm CHECK (ContractTerm > HireDate)
);

ALTER TABLE
    dim_Employees ADD CONSTRAINT dim_employees_passportid_unique UNIQUE(PassportId);
ALTER TABLE
    dim_Employees ADD CONSTRAINT dim_employees_email_unique UNIQUE(Email);

-- table of contracts
CREATE TABLE dim_Contracts(
    ContractId SERIAL PRIMARY KEY,
    ContractDescription TEXT NOT NULL,
    StartContractPeriod DATE NOT NULL,
    EndContractPeriod DATE NOT NULL,
    Price DECIMAL NOT NULL CHECK (Price >= 0),
    CONSTRAINT CHK_ValidContractPeriod CHECK (EndContractPeriod > StartContractPeriod)
);

-- table of orders
CREATE TABLE dim_Orders(
    OrderId 	SERIAL PRIMARY KEY,
    OrderDate 	DATE NOT NULL,
    WorkType 	VARCHAR(255) NOT NULL,
    Status 		VARCHAR(255) NOT NULL
);

-- fact table of contract assignments
CREATE TABLE facts_ContractAssignments(
	ContractAssignmentId	SERIAL PRIMARY KEY,
	RealtyId				INT REFERENCES dim_Realty(RealtyId) NOT NULL,
	TenantId				INT REFERENCES dim_Tenants(TenantId) NOT NULL,
	ContractId				INT REFERENCES dim_Contracts(ContractId) NOT NULL UNIQUE
);

-- assignments of requests
CREATE TABLE facts_RequestAssignments(
    RequestAssignmentsId	SERIAL PRIMARY KEY,
    FK_ContractId			INTEGER NOT NULL REFERENCES facts_ContractAssignments (ContractId),
    FK_OrderId 				INTEGER NOT NULL REFERENCES dim_Orders (OrderId),
    FK_EmployeeId 			INTEGER NOT NULL REFERENCES dim_Employees (EmployeeId),
    StartOrderDate 			DATE NOT NULL,
    EndOrderDate 			DATE,
    OrderCost 				DECIMAL(8, 2) NOT NULL,
    Rating 					INTEGER,
    
    CONSTRAINT CHK_Cost CHECK (OrderCost >= 0),
    CONSTRAINT CHK_Rating CHECK (Rating BETWEEN 1 AND 5),
    CONSTRAINT CHK_EndOrderDate CHECK (EndOrderDate > StartOrderDate OR EndOrderDate IS NULL)
);


-- 1. Realty
INSERT INTO dim_Realty (RealtyId, Address, Type, Rooms, Realty_Area, Description) VALUES
(1, 'ул. Ленина, д. 10, кв. 45', 'Квартира', 2, 48.5, 'Современная квартира рядом с метро'),
(2, 'ул. Гагарина, д. 5, кв. 12', 'Квартира', 3, 72.0, 'Просторная квартира для семьи'),
(3, 'ул. Пушкина, д. 20, оф. 301', 'Офис', 1, 35.0, 'Офисное помещение в бизнес-центре'),
(4, 'ул. Мира, д. 8, кв. 22', 'Квартира', 1, 31.5, 'Студия для одного человека'),
(5, 'ул. Садовая, д. 1', 'Таунхаус', 4, 125.0, 'Таунхаус с собственным двором'),
(6, 'пр. Науки, д. 15, кв. 78', 'Квартира', 2, 55.0, 'Новостройка с ремонтом'),
(7, 'ул. Лесная, д. 3, оф. 102', 'Офис', 2, 42.0, 'Офис на первой линии'),
(8, 'ул. Речная, д. 12', 'Дом', 5, 180.0, 'Загородный дом для большой семьи');

-- 2. Tenants
INSERT INTO dim_Tenants (TenantId, Email, PassportId, FirstName, LastName, DateOfBirthday) VALUES
(1, 'ivanov@mail.ru', 4515123456, 'Иван', 'Иванов', DATE'1985-03-15'),
(2, 'petrova@mail.ru', 4515987654, 'Мария', 'Петрова', DATE'1990-07-22'),
(3, 'sidorov@mail.ru', 4515567890, 'Алексей', 'Сидоров', DATE'1988-11-05'),
(4, 'kozlova@mail.ru', 4515234567, 'Анна', 'Козлова', DATE'1992-01-30'),
(5, 'morozov@mail.ru', 4515345678, 'Дмитрий', 'Морозов', DATE'1980-09-12'),
(6, 'novikov@mail.ru', 4515456789, 'Сергей', 'Новиков', DATE'1987-04-18'),
(7, 'fedorova@mail.ru', 4515678901, 'Ольга', 'Федорова', DATE'1995-06-25'),
(8, 'vasiliev@mail.ru', 4515789012, 'Андрей', 'Васильев', DATE'1983-12-03');

-- 3. Employees
INSERT INTO dim_Employees (EmployeeId, PassportId, Email, FirstName, LastName, EmploymentType, ContractTerm, HireDate) VALUES
(1, 4515111111, 'smirnova@company.ru', 'Елена', 'Смирнова', 'Риелтор', '2026-12-31', DATE'2020-02-01'),
(2, 4515222222, 'volkov@company.ru', 'Андрей', 'Волков', 'Менеджер', '2027-06-30', DATE'2021-05-15'),
(3, 4515333333, 'lebedeva@company.ru', 'Татьяна', 'Лебедева', 'Юрист', '2025-12-31', DATE'2019-08-10'),
(4, 4515444444, 'kuznetsov@company.ru', 'Павел', 'Кузнецов', 'Мастер', '2026-08-31', DATE'2022-01-20');

-- 4. Contracts
INSERT INTO dim_Contracts (ContractId, ContractDescription, StartContractPeriod, EndContractPeriod, Price) VALUES
(1, 'Договор аренды квартиры на Ленина', DATE'2026-01-01', DATE'2032-01-01', 1500),
(2, 'Договор аренды квартиры на Гагарина', DATE'2026-01-01', DATE'2026-04-30', 2000),
(3, 'Договор аренды офиса на Пушкина', DATE'2026-02-01', DATE'2028-09-01', 3500),
(4, 'Договор аренды студии на Мира', DATE'2026-03-16', DATE'2026-07-31', 4000),
(5, 'Договор аренды таунхауса', DATE'2026-01-01', DATE'2036-11-11', 2800),
(6, 'Договор аренды новостройки', DATE'2026-04-01', DATE'2029-04-21', 5000),
(7, 'Договор аренды квартиры на Гагарина (новый)', DATE'2026-05-01', DATE'2026-08-31', 3200),
(8, 'Договор аренды офиса на Лесной', DATE'2026-06-01', DATE'2045-03-25', 4500),
(9, 'Договор аренды студии (краткосрочный)', DATE'2026-01-15', DATE'2026-03-15', 1800),
(10, 'Договор аренды загородного дома', DATE'2026-07-01', DATE'2027-05-28', 6000);

-- 5. Orders
INSERT INTO dim_Orders (OrderId, OrderDate, WorkType, Status) VALUES
(1, DATE'2026-01-10', 'Сантехника', 'Выполнено'),
(2, DATE'2026-01-25', 'Электрика', 'Выполнено'),
(3, DATE'2026-02-05', 'Покраска стен', 'Выполнено'),
(4, DATE'2026-02-20', 'Ремонт двери', 'Выполнено'),
(6, DATE'2026-03-22', 'Уборка', 'Выполнено'),
(7, DATE'2026-04-12', 'Кондиционирование', 'Выполнено'),
(8, DATE'2026-05-15', 'Ремонт крыши', 'Выполнено'),
(9, DATE'2026-05-28', 'Сантехника', 'Выполнено'),
(10, DATE'2026-06-10', 'Электрика', 'Выполнено'),
(11, DATE'2026-07-05', 'Покраска', 'Отказано'),
(12, DATE'2026-07-20', 'Ремонт пола', 'Отказано'),
(13, DATE'2026-08-08', 'Установка окон', 'В процессе'),
(14, DATE'2026-08-18', 'Сантехника', 'В процессе');

-- fact table of the contract signing process
INSERT INTO facts_ContractAssignments (ContractAssignmentId, RealtyId, TenantId, ContractId) VALUES 
(1, 1, 1, 1),
(2, 5, 5, 5),
(3, 2, 2, 2),
(4, 3, 3, 3),
(5, 4, 4, 4),
(6, 6, 6, 6),
(7, 2, 7, 7),
(8, 7, 8, 8),
(9, 8, 2, 10),
(10, 4, 7, 9);

-- 6. Assignment of requests
INSERT INTO facts_RequestAssignments (RequestAssignmentsId, FK_ContractId, FK_OrderId, FK_EmployeeId, StartOrderDate, EndOrderDate, OrderCost, Rating) VALUES
-- completed requests
(1, 1, 1, 1, DATE'2026-01-10', DATE'2026-01-12', 800, 5),
(2, 5, 2, 2, DATE'2026-01-25', DATE'2026-01-27', 1200, 4),
(3, 2, 3, 3, DATE'2026-02-05', DATE'2026-02-08', 500, 5),
(4, 3, 4, 4, DATE'2026-02-20', DATE'2026-02-22', 1500, 4),
(5, 4, 6, 2, DATE'2026-03-22', DATE'2026-03-23', 750, 5),
(6, 6, 7, 3, DATE'2026-04-12', DATE'2026-04-15', 3000, 4),
(7, 7, 8, 4, DATE'2026-05-15', DATE'2026-05-17', 900, 5),
(8, 5, 9, 1, DATE'2026-05-28', DATE'2026-05-29', 1800, 4),
(9, 8, 10, 2, DATE'2026-06-10', DATE'2026-06-12', 2500, 5),

-- denied
(10, 10, 11, 3, DATE'2026-07-05', DATE'2026-07-06', 0, NULL),
(11, 3, 12, 4, DATE'2026-07-20', DATE'2026-07-21', 0, NULL),

-- in progress
(12, 1, 13, 1, DATE'2026-08-08', NULL, 3500, NULL),
(13, 6, 14, 2, DATE'2026-08-18', NULL, 800, NULL);