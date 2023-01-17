-- 1 -- 
-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

USE shop;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = 'Заказы';

INSERT INTO `orders` VALUES
    (1,1,'2018-07-30 19:20:09','1980-11-07 08:58:20'),
    (2,2,'1979-10-27 05:51:56','1972-03-07 23:59:41'),
    (3,5,'1970-08-09 02:44:51','2007-06-14 00:03:48'),
    (4,2,'1982-03-08 16:16:50','1996-09-07 20:30:50'),
    (5,5,'2018-01-16 05:50:27','1997-09-15 04:26:15');

SELECT * FROM orders;

SELECT user_id, count(*) AS nums_of_orders FROM orders GROUP BY user_id;

-- 2 --
-- Выведите список товаров products и разделов catalogs, который соответствует товару.

-- SELECT * FROM products;
-- SELECT * FROM catalogs;
SELECT p.name, c.name FROM products AS p JOIN catalogs AS c ON c.id = p.catalog_id;

-- 3 --
-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.

DROP DATABASE IF EXISTS airport;
CREATE DATABASE airport;

USE airport;

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
    lable varchar(100),
    name varchar(100),
    
    INDEX cities_lable_idx(lable)
 );
 
INSERT INTO `cities` VALUES ('Michigan','Мичиган'),('Wisconsin','Висконсин'),('NorthDakota','Дакота'),('Kansas','Канзас'),('Ohio','Огайо'),('Montana','Монтана'),('Alabama','Алабама'),('Maryland','Мэрилэд');


DROP TABLE IF EXISTS flights;
CREATE TABLE flights( 
    flight_id SERIAL,
    flight_from varchar(100),
    flight_to varchar(100),
    

FOREIGN KEY (flight_from) REFERENCES cities(lable),
FOREIGN KEY (flight_to) REFERENCES cities(lable)
);

INSERT INTO `flights` VALUES (1,'Alabama','Kansas'),(2,'Kansas','Maryland'),(3,'Maryland','Kansas'),(4,'Michigan','Michigan'),(5,'Montana','Ohio'),(6,'Michigan','NorthDakota'),(7,'Kansas','Ohio'),(8,'Wisconsin','Montana'),(9,'Ohio','Alabama'),(10,'Kansas','Wisconsin');

-- SELECT * FROM cities;
SELECT * FROM flights;

SELECT 
    (SELECT cities.name FROM cities WHERE cities.lable = flights.flight_from) AS 'ВЫЛЕТ',
    (SELECT cities.name FROM cities WHERE cities.lable = flights.flight_to) AS 'ПРИЛЕТ'    
FROM flights;