
/*1. Нарисуйте архитектуру ETL процесса для сбора и анализа данных компанией которая хочет провести маркетинговую кампанию, используя app.diagrams.net. Сделайте описание почему вы считаете что архитектура должна выглядеть именно так. 
2. Постройте реляционную и иерархическую модели данных для магазина который продает телефоны. 
3. Определите в какой нормальной форме данная таблица, приведите её ко 2 и 3 нормальным формам последовательно. 



-- ETL процесс для сбора и анализа данных компанией которая хочет провести маркетинговую кампанию
1. Извлечение (Extract):
Источники данных: Различные источники, такие как базы данных, CRM-системы, веб-серверы, социальные сети, внешние API и т. д., откуда берутся данные для маркетинговой кампании.
Механизмы извлечения: Использование ETL-инструментов, скриптов, API-запросов для извлечения данных из источников.
2. Трансформация (Transform):
- Чистка и обработка данных: Удаление дубликатов, обработка нулевых значений, стандартизация форматов данных, преобразование типов и т. д.
- Обогащение данных: Добавление дополнительных данных, например, географических данных, данных из сторонних источников и т. д.
- Агрегация: Сводка и агрегация данных для создания обобщенной информации.
3. Загрузка (Load):
- Хранилище данных: Хранение обработанных данных в централизованном хранилище (например, хранилище данных, база данных, хранилище для аналитики).
- Регулярное обновление: Планирование периодических обновлений данных в хранилище для актуальности информации.

Собирать данные из разных источников для полного понимания клиентов и маркетинговых возможностей.
Обрабатывать данные для их чистки, структурирования и подготовки к анализу.
Обогащать данные дополнительной информацией для более глубокого анализа и лучшего понимания целевой аудитории.
Хранить данные в централизованном хранилище для удобного доступа и анализа.


-- 2. Постройте реляционную и иерархическую модели данных для магазина который продает телефоны.

-- Реляционная модель данных

- Категории
- Бренды
- Модели телефонов
- Характеристики телефонов
- Заказы
- Клиенты
*/

DROP DATABASE IF EXISTS mobileshop_rel;
CREATE DATABASE mobileshop_rel;
USE mobileshop_rel;

DROP TABLE IF EXISTS Customer;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(255),
    phone_number VARCHAR(20)
);


DROP TABLE IF EXISTS Categories;
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

DROP TABLE IF EXISTS Brands;
CREATE TABLE Brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(100),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

DROP TABLE IF EXISTS Models;
CREATE TABLE Models (
    model_id INT PRIMARY KEY,
    model_name VARCHAR(100),
    brand_id INT,
    FOREIGN KEY (brand_id) REFERENCES Brands(brand_id)
);

DROP TABLE IF EXISTS Specifications;
CREATE TABLE Specifications (
    spec_id INT PRIMARY KEY,
    model_id INT,
    screen_size DECIMAL,
    processor VARCHAR(100),
    storage_capacity INT,
    camera_resolution VARCHAR(50),
    FOREIGN KEY (model_id) REFERENCES Models(model_id)
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    model_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (model_id) REFERENCES Models(model_id)
);

SHOW TABLES;
/*SELECT * FROM Brands;
SELECT * FROM Categories;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Models;
SELECT * FROM Specifications;*/



-- Иерархическая модель

/*
- Категории продуктов
  - Смартфоны
    - Бренды
      - Модели телефонов
        - Характеристики телефонов
    - Заказы

*/


DROP DATABASE IF EXISTS mobileshop_hierar;
CREATE DATABASE mobileshop_hierar;
USE mobileshop_hierar;

-- Создание таблицы Категории продуктов
DROP TABLE IF EXISTS Categories;
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Создание таблицы Бренды
DROP TABLE IF EXISTS Brands;
CREATE TABLE Brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Создание таблицы Модели телефонов
DROP TABLE IF EXISTS PhoneModels;
CREATE TABLE PhoneModels (
    model_id INT PRIMARY KEY,
    model_name VARCHAR(100) NOT NULL,
    brand_id INT,
    FOREIGN KEY (brand_id) REFERENCES Brands(brand_id)
);

-- Создание таблицы Характеристики телефонов
DROP TABLE IF EXISTS PhoneSpecifications;
CREATE TABLE PhoneSpecifications (
    spec_id INT PRIMARY KEY,
    model_id INT,
    screen_size DECIMAL(5, 2),
    processor VARCHAR(100),
    storage_capacity INT,
    camera_resolution VARCHAR(50),
    FOREIGN KEY (model_id) REFERENCES PhoneModels(model_id)
);

-- Создание таблицы Клиенты
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    address VARCHAR(255),
    phone_number VARCHAR(20)
);

-- Создание таблицы Заказы
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    model_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (model_id) REFERENCES PhoneModels(model_id)
);


SHOW TABLES;
/*SELECT * FROM Brands;
SELECT * FROM Categories;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM PhoneModels;
SELECT * FROM PhoneSpecifications;*/



/*
3. Определите в какой нормальной форме данная таблица, приведите её ко 2 и 3 нормальным формам последовательно. 


Исходная таблица содержит информацию о сотрудниках, их работе, коде должности и местоположении. 

Исходная таблица:
Employee_ID Name    Job_Code    Job     City_code   Home_city
E001        Alice   J01         Chef    26           Moscow
E001        Alice   J02         Waiter  26           Moscow
E002        Bob     J02         Waiter  56            Perm
E002        Bob     J03     Bartender   56            Perm
E003        Alice   J01         Chef    56            Perm
*/




DROP DATABASE IF EXISTS empl;
CREATE DATABASE empl;
USE empl;


-- Создание исходной таблицы Employees
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
    Employee_ID VARCHAR(5),
    Name VARCHAR(50),
    Job_Code VARCHAR(5),
    Job VARCHAR(50),
    City_code VARCHAR(5),
    Home_city VARCHAR(50)
);

-- Заполнение таблицы данными
INSERT INTO Employees (Employee_ID, Name, Job_Code, Job, City_code, Home_city)
VALUES
    ('E001', 'Alice', 'J01', 'Chef', '26', 'Moscow'),
    ('E001', 'Alice', 'J02', 'Waiter', '26', 'Moscow'),
    ('E002', 'Bob', 'J02', 'Waiter', '56', 'Perm'),
    ('E002', 'Bob', 'J03', 'Bartender', '56', 'Perm'),
    ('E003', 'Alice', 'J01', 'Chef', '56', 'Perm');


-- Преобразование во вторую нормальную форму (2NF):

-- создание нормализованной таблицы сотрудников
CREATE TABLE EmployeesInfo (
    Employee_ID VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(50),
    Home_city VARCHAR(50)
);

-- Заполнение таблицы сотрудников данными из исходной таблицы
INSERT INTO EmployeesInfo (Employee_ID, Name, Home_city)
SELECT DISTINCT Employee_ID, Name, Home_city FROM Employees;


-- Создание таблицы работ
CREATE TABLE Jobs (
    Job_Code VARCHAR(5) PRIMARY KEY,
    Job VARCHAR(50)
);

-- Заполнение таблицы работ данными из исходной таблицы
INSERT INTO Jobs (Job_Code, Job)
SELECT DISTINCT Job_Code, Job FROM Employees;

-- Удаление избыточной информации о работе из исходной таблицы
ALTER TABLE Employees DROP COLUMN Job_Code, DROP COLUMN Job;




-- Преобразование в третью нормальную форму (3NF):
-- Создание таблицы городов:

CREATE TABLE Cities (
    City_code VARCHAR(5) PRIMARY KEY,
    Home_city VARCHAR(50)
);

-- Заполнение таблицы городов данными из исходной таблицы
INSERT INTO Cities (City_code, Home_city)
SELECT DISTINCT City_code, Home_city FROM Employees;

-- Удаление избыточной информации о городах из таблицы сотрудников
ALTER TABLE Employees DROP COLUMN City_code;



SHOW tables;
SELECT * FROM Cities;
SELECT * FROM Employees;
SELECT * FROM EmployeesInfo;
SELECT * FROM Jobs;

