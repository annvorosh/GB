DROP DATABASE IF EXISTS ex5;
CREATE DATABASE ex5;
USE ex5;


-- 1 -- 
--  Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.


DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name varchar(50),
    birthday date NOT NULL,
    created_at datetime,
    updated_at datetime
);

INSERT INTO `users` VALUES 
(1,'Giuseppe','1995-07-31','2001-03-29 16:04:47',NULL),
(2,'Conner','1986-05-22','2004-10-20 20:12:17','2021-08-11 13:49:16'),
(3,'Don','2006-07-16','2005-03-02 03:16:05',NULL),
(4,'Ladarius','1997-12-03','1977-12-20 09:40:56','1988-06-08 19:55:54'),
(5,'Paul','1982-08-17','1970-03-31 10:55:00','2012-03-24 13:20:45'),
(6,'Hubert','1990-10-08',NULL,NULL),
(7,'Donavon','1971-07-25','1983-01-07 08:11:04',NULL),
(8,'Dejuan','1971-02-17','1979-06-06 12:20:07','2001-04-07 17:01:55'),
(9,'Ben','1980-05-23',NULL,NULL),
(10,'Ali','1998-08-23',NULL ,NULL);

SELECT * FROM users WHERE created_at IS NULL OR updated_at IS NULL;

UPDATE users SET created_at = now() WHERE created_at IS NULL;
UPDATE users SET updated_at = now() WHERE updated_at IS NULL;

SELECT * FROM users;

-- 2 -- 
-- Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR 
-- и в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, 
-- сохранив введеные ранее значения.

-- SELECT DATE_FORMAT(created_at, '%d.%m.%Y %H:%m') AS created_at FROM users; 
-- SELECT DATE_FORMAT(updated_at, '%d.%m.%Y') AS updated_at FROM users; 

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date NOT NULL,
  `created_at` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` VALUES (1,'Bailey','1980-05-19','2006.02.02','2001.03.06'),(2,'Hamill','2018-04-28','1993.01.25','2017.10.31'),(3,'Smith','2022-08-26','1994.04.23','1980.03.10'),(4,'Nitzsche','1998-02-24','2022.05.03','2009.01.29'),(5,'Little','2010-01-07','1986.01.18','1988.01.14'),(6,'Renner','1996-12-11','1971.03.10','1982.09.17'),(7,'Adams','1979-12-28','2010.08.14','2021.10.02'),(8,'Boehm','1997-09-13','1976.04.26','2001.08.27'),(9,'Spencer','1970-11-09','1983.02.16','1986.11.18'),(10,'Walker','1991-08-15','1970.01.09','1984.03.12');
SELECT * FROM users;

SELECT date(created_at), date(updated_at) FROM users;

UPDATE users SET created_at = date(created_at);
UPDATE users SET updated_at = date(updated_at);
SELECT * FROM users;


-- 3 -- 
-- В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, 
-- если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
-- Однако, нулевые запасы должны выводиться в конце, после всех записей.

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products(
    product_id SERIAL PRIMARY KEY, 
    brand ENUM ('rico', 'casagrande', 'lana grossa', 'lang'),
    name VARCHAR(50) UNIQUE, 
    retail_price int,
    value INT
) COMMENT 'товар';

INSERT INTO `storehouses_products` VALUES (1,'rico','Raphael',1019,9),(2,'lana grossa','Amparo',1198,18),(3,'lang','Wilma',1233,16),(4,'rico','Estell',1191,0),(5,'lana grossa','Ayla',784,4),(6,'lana grossa','Enrique',1730,9),(7,'lang','Tanya',1759,9),(8,'lana grossa','Sasha',689,0),(9,'rico','Prudence',1990,0),(10,'casagrande','Andy',587,19);

SELECT * FROM storehouses_products;

-- SELECT * FROM storehouses_products WHERE value > 0 ORDER BY value; 

# первый вариант
SELECT * FROM storehouses_products ORDER BY IF( `value` = 0, 1, 0 ) , `value`;
# втоарой вариант
SELECT * FROM storehouses_products ORDER BY 
    CASE WHEN value = 0 THEN value END ASC,
    CASE WHEN value > 0 THEN value END ASC;

-- 4 -- (по желанию) 
-- Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august')

-- SELECT *, DATE_FORMAT(birthday, '%M') AS birthday_month FROM users;
-- SELECT * FROM users WHERE DATE_FORMAT(birthday, '%M') = 'may' OR DATE_FORMAT(birthday, '%M') = 'august';

ALTER TABLE users CHANGE birthday birthday varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL;
UPDATE users SET birthday = DATE_FORMAT(birthday, '%d %M %Y');

SELECT * FROM users;
SELECT name, birthday FROM users WHERE birthday LIKE '%May%' OR birthday LIKE '%August%';

-- 5 -- (по желанию) 
-- Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
-- Отсортируйте записи в порядке, заданном в списке IN.

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO catalogs VALUES
  (NULL, 'Yarns'),
  (NULL, 'Needles'),
  (NULL, 'Crochette'),
  (NULL, 'Accessories'),
  (NULL, 'Cosmetics');
  
SELECT * FROM catalogs  WHERE id IN (5, 1, 2) ORDER BY IF (`id` = 5, 1, 2), `id`;

-- Практическое задание теме “Агрегация данных”
-- 1. Подсчитайте средний возраст пользователей в таблице users

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date NOT NULL,
  `created_at` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` VALUES (1,'Bailey','1980-05-19','2006.02.02','2001.03.06'),(2,'Hamill','2018-04-28','1993.01.25','2017.10.31'),(3,'Smith','2022-08-26','1994.04.23','1980.03.10'),(4,'Nitzsche','1998-02-24','2022.05.03','2009.01.29'),(5,'Little','2010-01-07','1986.01.18','1988.01.14'),(6,'Renner','1996-12-11','1971.03.10','1982.09.17'),(7,'Adams','1979-12-28','2010.08.14','2021.10.02'),(8,'Boehm','1997-09-13','1976.04.26','2001.08.27'),(9,'Spencer','1970-11-09','1983.02.16','1986.11.18'),(10,'Walker','1991-08-15','1970.01.09','1984.03.12');

SELECT name, timestampdiff(YEAR, birthday, now()) AS age FROM users;

ALTER TABLE users ADD age int;
UPDATE users SET age = timestampdiff(YEAR, birthday, now());

SELECT avg(age) FROM users;

-- 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

ALTER TABLE users ADD this_year_bd date;
UPDATE users SET this_year_bd = DATE_FORMAT(birthday, '2022-%m-%d');
SELECT DAYNAME(this_year_bd) FROM users;

SELECT DAYNAME(this_year_bd) AS week_day, count(*) AS total FROM users GROUP BY DAYNAME(this_year_bd);

-- 3. (по желанию) Подсчитайте произведение чисел в столбце таблицы

DROP TABLE IF EXISTS `tbl`;
CREATE TABLE `tbl` (value int);

INSERT INTO tbl VALUES (1), (2), (3), (4), (5);
SELECT * FROM tbl;

-- ln(x * y * z) = ln(x) + ln(y) + ln(z) , x+y+z = expˆ(ln(x) + ln(y) + ln(z))
ALTER TABLE tbl ADD ln_value float;
UPDATE tbl SET ln_value = ln(value);


SELECT EXP(sum(ln_value)) FROM tbl;



