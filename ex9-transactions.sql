

-- Практическое задание по теме “Транзакции, переменные, представления”

-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users 
-- в таблицу sample.users. Используйте транзакции.

-- SELECT * FROM sample.users;
-- SELECT * FROM shop.users;

START TRANSACTION;

INSERT INTO sample.users SELECT id, name FROM shop.users WHERE shop.users.id = 1;
DELETE FROM shop.users WHERE shop.users.id = 1;

COMMIT;

SELECT * FROM sample.users;
SELECT * FROM shop.users;


-- Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.

USE shop;
DROP VIEW IF EXISTS cat;
CREATE VIEW cat AS 
(SELECT 
    products.name AS item, catalogs.name AS name
FROM products JOIN catalogs
ON catalogs.id = products.catalog_id);

SELECT * FROM cat;

-- по желанию) Пусть имеется таблица с календарным полем created_at. В ней размещены разреженные календарные записи за август 2018 года 
-- '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. Составьте запрос, который выводит полный список дат за август, 
-- выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0, если она отсутствует.

USE sample;
DROP TABLE IF EXISTS dates;
CREATE TABLE dates( 
    created_at date );

INSERT INTO dates
  (created_at)
VALUES
   ('2018-08-01'), ('2016-08-04'), ('2018-08-16'), ('2018-08-17');
   
SELECT * FROM dates;

DROP TABLE IF EXISTS august;
CREATE TABLE august(all_days date);

INSERT INTO `august` (all_days) VALUES ('2018-08-01'),('2018-08-02'),('2018-08-03'),('2018-08-04'),('2018-08-05'),('2018-08-06'),('2018-08-07'),('2018-08-08'),('2018-08-09'),('2018-08-10'),('2018-08-11'),('2018-08-12'),('2018-08-13'),('2018-08-14'),('2018-08-15'),('2018-08-16'),('2018-08-17'),('2018-08-18'),('2018-08-19'),('2018-08-20'),('2018-08-21'),('2018-08-22'),('2018-08-23'),('2018-08-24'),('2018-08-25'),('2018-08-26'),('2018-08-27'),('2018-08-28'),('2018-08-29'),('2018-08-30'),('2018-08-31');

SELECT august.all_days, august.all_days IN (SELECT created_at FROM dates) FROM august;


-- вариант с созданием представления
CREATE OR REPLACE VIEW v1 (day_of_month, is_day) 
AS SELECT august.all_days, august.all_days IN (SELECT created_at FROM dates) FROM august;

SELECT * FROM v1;


-- (по желанию) Пусть имеется любая таблица с календарным полем created_at. Создайте запрос, который удаляет устаревшие записи из таблицы, 
-- оставляя только 5 самых свежих записей.

DROP TABLE IF EXISTS dates;
CREATE TABLE dates( 
    created_at date );

INSERT INTO dates
  (created_at)
VALUES
   ('2018-11-01'), ('2016-01-04'), ('2018-02-16'), ('2018-03-17'), ('2014-05-04'), ('2010-08-16'), ('2015-08-17');
  
SELECT * FROM dates;


START TRANSACTION;

CREATE TEMPORARY TABLE temp_tbl (created_at date);

INSERT INTO temp_tbl
    (SELECT created_at FROM dates ORDER BY created_at DESC LIMIT 5);

DELETE FROM dates
    WHERE created_at NOT IN (SELECT created_at FROM temp_tbl);

DROP TEMPORARY TABLE temp_tbl;

COMMIT;

SELECT * FROM dates;