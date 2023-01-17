-- Voroshilova Anna annv.edu@gmail.com 
-- Data Base for CozyYarn Shop


-- Требования к курсовому проекту:
-- Составить общее текстовое описание БД и решаемых ею задач;
-- минимальное количество таблиц: 10;
-- скрипты создания структуры БД (DDL, с первичными ключами, индексами, внешними ключами);
-- создать ERDiagram для БД;
-- скрипты наполнения БД данными (дамп, не более 20 строк в таблицах);
-- скрипты характерных выборок (SELECT, включающие группировки, JOIN'ы, вложенные запросы);
-- представления (минимум 2);
-- Хранимая процедура / функция / триггер (на выбор, 1 шт.);



-- Описание базы данных
-- База данных магазина рукоделия. Магазин имеет склад внутри магазина и удалённый склад. 
-- Компания закупает часть продукции у дистрибьюторов, а часть продукции напрямую от производителей (разные скидки на закупку) 
-- и сама является дистрибьютором (оптовые цены) соответственно проводит оптовые продажи другим магазинам. 
-- Покупатели могут оставлять рейтинг и отзывы на продукцию.


DROP DATABASE IF EXISTS cozyyarn;
CREATE DATABASE cozyyarn;
USE cozyyarn;

-- 1 ok
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(50)COMMENT 'Customer name',
  lastname VARCHAR(50),
  email VARCHAR(120) UNIQUE,
  password_hash VARCHAR(100), -- 123456 => vzx;clvgkajrpo9udfxvsldkrn24l5456345t
  phone BIGINT UNSIGNED UNIQUE,
  is_teatcher char(1),
  INDEX users_firstname_lastname_idx(firstname, lastname)
) COMMENT = 'Customers';

INSERT INTO `users` VALUES 
    (1,'Lucy','Neveu','rodrigues.gabrielle@gmail.com','dolore',63749953,''),
    (2,'Alice','Gimenez','eugène.fleury@yahoo.com','voluptas',9337145,'1'),
    (3,'Aimée','Guillon','gpottier@hotmail.com','aliquid',83783364,''),
    (4,'Jeannine','Colin','boucher.denise@yahoo.com','molestiae',74340484,''),
    (5,'Joséphine','Raynaud','valérie.aubert@yahoo.com','qui',80898993,''),
    (6,'Alice','Guillon','abenard@yahoo.com','et',62331661,''),
    (7,'Jeanne','Laine','aimée27@yahoo.com','consequatur',46967411,'1'),
    (8,'Agnès','Payet','matthieu14@gmail.com','ad',26963112,''),
    (9,'Henriette','Mendes','virginie.weber@gmail.com','labore',94944785,''),
    (10,'Diane','Deschamps','godard.thibaut@gmail.com','ipsum',96706954,''),
    (11,'Zoé','Roux','tallain@gmail.com','exercitationem',88602608,'1'),
    (12,'Marie','Lacombe','qfaivre@yahoo.com','quidem',18114829,'1'),
    (13,'Virginie','Laine','tgaillard@hotmail.com','nam',60680303,''),
    (14,'Suzanne','Blin','lombard.andrée@hotmail.com','aut',28123705,''),
    (15,'Dominique','Blot','zsanchez@gmail.com','quo',26784946,''),
    (16,'Jeannine','Martel','barre.monique@gmail.com','sunt',95505688,''),
    (17,'Philippine','Lefebvre','dorothée76@hotmail.com','in',57441832,''),
    (18,'Olivie','Chevalier','vcourtois@hotmail.com','repellat',73948926,''),
    (19,'Susan','Leger','andré.wagner@hotmail.com','autem',1543025,'1'),
    (20,'Aurélie','Delmas','philippe83@gmail.com','molestias',61849198,'');


-- 2  ok
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
    user_id BIGINT UNSIGNED NOT NULL UNIQUE,
    birthday DATE,
    photo BIGINT UNSIGNED NULL,
    created_at DATETIME DEFAULT NOW(),
    hometown VARCHAR(100),
    country varchar(100),
    adress varchar(255),
    FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT = 'Details of customer';

INSERT INTO `profiles` VALUES 
(1,'1987-07-02',0,'2009-01-26 14:58:55','Brunet','US','rue Payet'),
(2,'1970-03-16',0,'1993-09-11 22:47:31','David','US','303, rue Pruvost'),
(3,'1994-05-28',0,'1972-10-27 04:37:38','Bertin','GB','88, rue Pénélope Boulay'),
(4,'1970-08-15',0,'2018-10-22 15:17:29','Lenoir','IE','9, rue Leconte'),
(5,'2010-01-20',0,'2008-05-26 12:57:22','AllardVille','RU','avenue Georges'),
(6,'2021-11-08',0,'1972-03-29 03:07:52','Martel','IE','24, rue Martel'),
(7,'1998-05-11',0,'2017-04-10 18:07:21','Vasseur','ES','397, rue de Royer'),
(8,'2021-06-03',0,'1989-10-22 19:44:29','Charpentier','IT','21, rue Louis Chartier'),
(9,'1998-03-29',0,'1983-12-29 10:46:20','Bernier','DE','3, boulevard Labbe'),
(10,'1991-02-15',0,'1992-02-09 15:07:18','Benard','US','53, boulevard de Bodin'),
(11,'2019-07-01',0,'1977-09-19 02:44:16','Bigot','GB','482, chemin Sabine Dias'),
(12,'2018-01-28',0,'1993-06-24 18:05:34','Ollivier','IN','92, rue Aimée Fouquet'),
(13,'1993-06-29',0,'1986-12-11 11:13:13','Bousquet-sur-Mer','FR','774, boulevard Honoré Germain'),
(14,'1991-10-25',0,'2022-12-12 18:53:55','Bruneau','ES','717, chemin Gros'),
(15,'1992-12-29',0,'2019-10-04 23:00:20','Aubry','IT','26, rue de Herve'),
(16,'1983-09-06',0,'2004-10-16 23:58:28','Martinez','US','51, boulevard Margaud Evrard'),
(17,'2006-11-02',0,'2001-03-22 20:57:14','MaillardVille','IE','437, rue Gauthier'),
(18,'2020-02-26',0,'1976-10-31 22:25:26','Hebert','CA','83, rue Margaret Grenier'),
(19,'1974-04-26',0,'2006-09-09 04:34:03','Blanc-la-Forêt','US','33, avenue Nathalie Deschamps'),
(20,'1976-06-25',0,'1977-11-18 11:18:13','Traore','DE','21, boulevard Anne Roux');

-- 3
DROP TABLE IF EXISTS rubrics;
CREATE TABLE rubrics (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Name of rubrics'
) COMMENT = 'Products or courses';

INSERT INTO rubrics VALUES
  (NULL, 'School'),
  (NULL, 'Shop');

-- 4 ok
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Store section',
  rubrics_id BIGINT UNSIGNED NOT NULL,
  FOREIGN KEY (rubrics_id) REFERENCES rubrics(id),
  UNIQUE unique_name(name(10))
) COMMENT = 'Store section';

INSERT INTO catalogs VALUES
  (NULL, 'Yarn', 2),
  (NULL, 'Tools', 2),
  (NULL, 'Kits', 2),
  (NULL, 'Accessorise', 2),
  (NULL, 'Embroidery', 2),
  (NULL, 'Books and Magazines', 2),
  (NULL, 'School', 1),
  (NULL, 'SALE', 2);

  
-- 5
DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  brand VARCHAR(50),
  name VARCHAR(255),
  description TEXT ,
  weight_g INT,
  length_m INT,
  color VARCHAR(50),
  barcode INT UNIQUE,
  price DECIMAL (8,2), -- цена розница
  amount INT, -- количество
  catalog_id BIGINT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id),
  FOREIGN KEY (catalog_id)  REFERENCES catalogs(id)
);

INSERT INTO products
  (brand, name, description, weight_g, length_m, color, price, amount, catalog_id)
VALUES
  ('Katia', 'Alpaca Natural Colors', '84% Superfine Alpaca - 16% Pima Cotton', 50, 90, 1, 8.95, 10, 1),
  ('Katia', 'Alpaca Natural Colors', '84% Superfine Alpaca - 16% Pima Cotton', 50, 90, 2, 8.95, 10, 1),
  ('Katia', 'Alpaca Natural Colors', '84% Superfine Alpaca - 16% Pima Cotton', 50, 90, 3, 8.95, 10, 1),
  ('Katia', 'Alpaca Natural Colors', '84% Superfine Alpaca - 16% Pima Cotton', 50, 90, 5, 8.95, 10, 1),
  
  ('Katia', 'Piumino', '64% Superfine Alpaca - 36% Polyamide', 50, 125, 302, 8.50, 5, 1),
  ('Katia', 'Piumino', '64% Superfine Alpaca - 36% Polyamide', 50, 125, 305, 8.50, 5, 1),
  ('Katia', 'Piumino', '64% Superfine Alpaca - 36% Polyamide', 50, 125, 307, 8.50, 5, 1),
 
  ('Katia', 'Atenea', '42% Merino Extrafine - 40% Cotton Mako - 18% Cashmere', 25, 175, 90, 7.70, 10, 1),
  ('Katia', 'Atenea', '42% Merino Extrafine - 40% Cotton Mako - 18% Cashmere', 25, 175, 80, 7.70, 10, 1),
  ('Katia', 'Atenea', '42% Merino Extrafine - 40% Cotton Mako - 18% Cashmere', 25, 175, 89, 7.70, 10, 1),

  ('Katia', 'Cashmere 10', '40% Merino Extrafine - 25% RCS Recycled Polyamide - 25% Viscose - 10% Cashmere', 50, 120, 70, 6.95, 10, 1),
  ('Katia', 'Cashmere 10', '40% Merino Extrafine - 25% RCS Recycled Polyamide - 25% Viscose - 10% Cashmere', 50, 120, 77, 6.95, 10, 1),
  ('Katia', 'Cashmere 10', '40% Merino Extrafine - 25% RCS Recycled Polyamide - 25% Viscose - 10% Cashmere', 50, 120, 73, 6.95, 10, 1),
  
  ('Lang Yarns', 'Cashmere Dreams', '65% Cashmere 35% Silk', 25, 290, 60, 21.95, 10, 1),
  ('Lang Yarns', 'Cashmere Dreams', '65% Cashmere 35% Silk', 25, 290, 48, 21.95, 10, 1),
  ('Lang Yarns', 'Cashmere Dreams', '65% Cashmere 35% Silk', 25, 290, 94, 21.95, 10, 1);
  

-- 6
-- не уверена есть ли необходимость в данной таблице или можно обойтись users
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
  id SERIAL PRIMARY KEY,
  nickname VARCHAR(255),
  user_id BIGINT UNSIGNED NOT NULL UNIQUE,
  FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT = 'Teachers of courses';


INSERT INTO `teachers` VALUES
    (1,'strick.yoga',7),
    (2,'petiteknit',2), 
    (3,'celery.club',11),
    (4,'cozy and lazy',12),
    (5,'augustins',19);

-- 7
DROP TABLE IF EXISTS courses;
CREATE TABLE courses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) comment 'Name of course',
  teacher_id BIGINT UNSIGNED NOT NULL,
  duration INT,
  price DECIMAL (8,2),
  material_id BIGINT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (teacher_id) REFERENCES teachers(id),
  FOREIGN KEY (material_id)  REFERENCES catalogs(id)
);
  
INSERT INTO `courses` VALUES
    (1,'Reglan 10+',2,5,32.00,2,'2019-04-13 01:20:10','1979-07-04 23:02:51'),
    (2,'Hat with leavs 10+',3,8,24.00,3,'1978-10-02 06:04:59','1972-10-06 12:22:19'),
    (3,'VanGogh scarf 10+',4,6,19.00,4,'1996-01-15 06:58:11','1997-05-04 01:27:18'),
    (4,'First step with needles 10+',5,2,15.00,5,'2003-08-31 19:59:06','2022-12-31 23:19:37'),
    (5,'Japanese shoulder 10+',1,1,39.00,6,'2002-11-23 18:36:26','2013-06-30 09:30:38'),
    (6,'Mittens 10+',2,3,39.00,7,'1992-06-05 05:55:45','1992-05-28 14:06:19'),
    (7,'Gloves 10+',3,1,24.00,8,'1994-02-11 14:40:11','1985-12-30 22:18:33');

-- 8
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id BIGINT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id),
  FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT = 'Orders';


INSERT INTO `orders` VALUES 
    (1,11,'2010-04-03 18:11:22','1996-04-07 18:47:49'),
    (2,2,'1996-03-28 12:59:11','1972-04-09 05:13:39'),
    (3,2,'1993-07-25 01:46:13','2010-04-16 05:19:48'),
    (4,13,'2001-10-04 19:40:43','2018-12-05 09:31:57'),
    (5,5,'1994-10-02 18:57:35','2018-09-17 12:00:41'),
    (6,2,'1979-05-09 19:18:48','2014-01-24 17:45:47'),
    (7,12,'1993-01-04 18:06:22','2002-10-28 21:40:43'),
    (8,13,'1997-05-29 04:21:29','1989-04-23 08:04:29'),
    (9,20,'1997-07-30 03:22:13','1987-07-16 00:12:31'),
    (10,19,'2007-09-15 18:07:02','1995-02-23 06:34:21'),
    (11,13,'2020-06-28 04:53:37','2004-03-24 07:59:57'),
    (12,13,'1994-06-12 17:18:32','1982-12-30 21:17:36'),
    (13,1,'1978-11-15 07:04:52','2014-03-22 05:01:08'),
    (14,10,'1978-11-23 12:25:55','1988-09-27 20:29:23'),
    (15,15,'2008-12-31 06:40:58','2008-08-08 01:07:22'),
    (16,18,'2019-09-05 04:41:08','2011-11-21 15:36:29'),
    (17,3,'1986-08-02 21:57:57','1998-03-16 00:27:13'),
    (18,9,'2017-01-12 09:23:23','1981-01-05 02:30:50'),
    (19,4,'1987-11-16 07:13:22','1981-04-09 05:10:27'),
    (20,14,'2007-09-07 07:57:30','1999-05-27 04:00:05');


-- 9
DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
  id SERIAL PRIMARY KEY,
  order_id BIGINT UNSIGNED NOT NULL,
  product_id BIGINT UNSIGNED NOT NULL,
  total INT UNSIGNED DEFAULT 1 COMMENT 'Number of items ordered',
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
) COMMENT = 'Order list of products';

INSERT INTO `orders_products` VALUES 
    (1,19,10,5),
    (2,18,6,9),
    (3,16,3,9),
    (4,3,11,9),
    (5,14,12,10),
    (6,4,12,8),
    (7,9,10,6),
    (8,4,9,9),
    (9,2,3,7),
    (10,7,6,10),
    (11,13,8,7),
    (12,3,11,7),
    (13,4,15,8),
    (14,19,3,10),
    (15,13,11,8),
    (16,6,7,5),
    (17,13,9,2),
    (18,15,10,7),
    (19,10,2,4),
    (20,11,3,5);

-- 10
DROP TABLE IF EXISTS orders_coursess;
CREATE TABLE orders_courses (
  id SERIAL PRIMARY KEY,
  order_id BIGINT UNSIGNED NOT NULL,
  course_id BIGINT UNSIGNED NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (course_id) REFERENCES courses(id)
) COMMENT = 'Order list of courses';


INSERT INTO `orders_courses` VALUES 
    (1,1,1),
    (2,16,4),
    (3,2,3),
    (4,9,5),
    (5,3,3),
    (6,2,4),
    (7,7,1),
    (8,14,1),
    (9,13,5),
    (10,17,3);

-- 11
DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
  id SERIAL PRIMARY KEY,
  product_id BIGINT UNSIGNED NOT NULL,
  discount FLOAT UNSIGNED COMMENT 'Discount amount 0-1',
  started_at DATETIME,
  finished_at DATETIME,
  KEY index_of_product_id(product_id),
  FOREIGN KEY (product_id) REFERENCES products(id)
) COMMENT = 'Special offers';

INSERT INTO `discounts` VALUES 
    (1,1,2,'2023-01-01 00:00:01','2023-12-31 00:00:01'), -- taken OUT OF production
    (2,2,2,'2023-03-05 00:00:01','2023-12-31 00:00:00'); -- taken OUT OF production


-- 12
DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Storehouses';

INSERT INTO 
    storehouses (name) 
VALUES
  ('Local warehouse'), 
  ('Remote warehouse');

  
-- 13
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id BIGINT UNSIGNED NOT NULL,
  product_id BIGINT UNSIGNED NOT NULL,
  value INT UNSIGNED COMMENT 'Item stock in the storehouse',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (storehouse_id) REFERENCES storehouses(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
) COMMENT = 'Stock in the storehouse';

INSERT INTO `storehouses_products` VALUES 
    (1,1,1,20,'2017-11-12 14:00:41','2015-08-20 21:11:04'),
    (2,2,2,20,'2017-04-10 22:23:09','1974-08-25 18:36:17'),
    (3,1,3,30,'1976-06-21 16:49:09','1975-11-01 05:24:57'),
    (4,2,4,10,'1990-11-16 16:23:16','1977-12-06 06:46:29'),
    (5,1,5,20,'1991-01-20 05:39:27','1978-11-16 03:12:21'),
    (6,2,6,20,'1997-01-13 10:55:54','1979-09-10 06:06:31'),
    (7,1,7,30,'1971-04-10 08:40:52','2012-01-31 15:43:42'),
    (8,2,8,20,'1984-11-16 10:44:35','1987-04-16 11:47:30'),
    (9,1,9,20,'1983-04-11 23:09:48','2000-11-24 06:17:14'),
    (10,2,10,40,'2014-07-18 18:26:58','1997-11-19 19:38:34'),
    (11,1,11,0,'1982-07-15 03:48:14','1970-04-20 22:13:59'),
    (12,2,12,10,'1974-07-07 18:15:00','1987-11-25 13:35:57'),
    (13,1,13,20,'1994-04-07 01:47:37','1978-03-10 14:54:06'),
    (14,2,14,10,'2007-01-10 20:29:50','1994-10-11 15:30:47'),
    (15,1,15,30,'2001-11-29 21:38:13','1993-10-04 09:07:04'),
    (16,2,16,40,'1975-06-26 11:30:53','1976-10-12 23:12:59');


-- 14 ok
DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  from_user_id BIGINT UNSIGNED NOT NULL,
  to_product_id BIGINT UNSIGNED NOT NULL,
  comment_text text,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  KEY index_of_user_id(from_user_id),
  KEY index_of_product_id(to_product_id),
  FOREIGN KEY (from_user_id) REFERENCES users(id),
  FOREIGN KEY (to_product_id) REFERENCES products(id)
) COMMENT = 'Comments from customers';

INSERT INTO `comments` VALUES 
    (1,1,12,'Ex harum quos totam necessitatibus doloremque ipsam ipsam.','2012-10-25 06:59:43'),
    (2,11,5,'Et aut laborum est molestiae excepturi.','2015-08-04 09:19:40'),
    (3,17,9,'Aut est qui sit quia suscipit voluptatem debitis.','1970-05-30 18:24:12'),
    (4,9,1,'Architecto aut et atque et error incidunt repellendus.','2000-02-08 02:35:05'),
    (5,7,5,'Commodi aliquam ut iusto qui ullam nostrum.','2016-06-08 03:41:52'),
    (6,18,13,'Et accusantium qui rerum.','1990-05-11 03:12:20'),
    (7,4,2,'Minima possimus consectetur corrupti quasi molestiae non.','1988-04-16 11:14:48'),
    (8,13,3,'Corrupti iste aut qui aut maiores expedita.','1972-11-07 19:19:16'),
    (9,12,7,'Aut similique aut illum magni esse.','1973-02-24 03:07:29'),
    (10,7,14,'Expedita officiis dolor dolore illo.','1992-09-02 22:25:58');


-- 15
DROP TABLE IF EXISTS rating;
CREATE TABLE rating(
    id SERIAL,
    user_id BIGINT UNSIGNED NOT NULL,
    product_id BIGINT UNSIGNED NOT NULL,
    rate TINYINT,
    created_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
) COMMENT = 'Raiting from customers';
    
INSERT INTO `rating` VALUES 
    (1,19,15,5,'1981-02-27 19:23:55'),
    (2,11,5,3,'1998-11-01 10:01:37'),
    (3,10,8,5,'1970-11-30 07:56:58'),
    (4,4,9,5,'2023-01-06 04:06:35'),
    (5,15,9,4,'1989-07-29 23:22:57'),
    (6,11,15,4,'2006-11-04 17:53:19'),
    (7,10,8,5,'1980-09-21 11:34:53'),
    (8,14,7,3,'2002-02-25 10:44:51'),
    (9,9,8,4,'2013-08-06 03:19:09'),
    (10,12,11,4,'2022-06-27 14:47:44'),
    (11,15,2,3,'2000-06-22 05:24:25'),
    (12,2,9,3,'2013-01-04 18:03:32'),
    (13,1,5,3,'2014-03-15 17:07:07'),
    (14,6,11,5,'2001-02-25 04:20:26'),
    (15,6,10,4,'1994-07-07 15:28:29'),
    (16,3,9,5,'1974-12-31 00:49:57'),
    (17,18,9,5,'1977-06-01 12:22:31'),
    (18,8,16,5,'2021-04-18 03:14:53'),
    (19,17,7,5,'1971-02-04 00:26:26'),
    (20,1,10,5,'2019-03-10 11:15:12');

-- View product raiting
CREATE OR REPLACE VIEW raiting_view AS 
SELECT 
--     product_id, 
    concat(products.brand, ' ', products.name) AS product, 
    count(*), 
    avg(rate) 
FROM rating 
JOIN products ON products.id = rating.product_id 
GROUP BY rating.product_id; 

SELECT * FROM raiting_view;

-- View for price calculation (purchase price for Katia is better)
CREATE OR REPLACE VIEW products_view AS 
SELECT 
    * , 
    price * 0.75 AS wholesale_price, -- оптовая цена
    price * 0.6 AS purchase_price
    FROM products  WHERE products.brand='Lang Yarns'
UNION 
SELECT 
    * , 
    price * 0.75 AS wholesale_price, -- оптовая цена
    price * 0.5 AS purchase_price
    FROM products  WHERE products.brand='Katia';

SELECT brand, name, color, purchase_price AS 'цена закупки', wholesale_price AS 'оптовая цена', price AS 'розничная цена' FROM products_view;



-- Viewing customers who odered courses
CREATE OR REPLACE VIEW users_bought_course_view AS 
SELECT 
--     orders.user_id,
    (SELECT concat(users.firstname, ' ', users.lastname)) AS customer,
--     orders_courses.id,
    courses.name AS course
FROM orders 
JOIN users ON orders.user_id = users.id
JOIN orders_courses ON orders.id = orders_courses.order_id 
JOIN courses ON courses.id = orders_courses.course_id ;

SELECT * FROM users_bought_course_view;


-- Auto changing age for new customers if it is not real
DROP TRIGGER IF EXISTS check_customer_age_before_insert;
delimiter //
CREATE TRIGGER check_customer_age_before_insert BEFORE INSERT ON profiles
FOR EACH ROW 
BEGIN 
    IF NEW.birthday > CURRENT_DATE() THEN 
        SET NEW.birthday = CURRENT_DATE();
    END IF;
END //
delimiter ;

-- example
INSERT INTO `users` VALUES 
    (21,'Hanna','Novik','gabrielle@gmail.com','dolore',63749253,'');
INSERT INTO `profiles` VALUES 
    (21, '2087-07-02',0,'2009-01-26 14:58:55','Brisbon','US','rue Shampagne');

SELECT * FROM profiles WHERE user_id = 21;



-- Auto-updating amount of product in products table after order
DROP TRIGGER IF EXISTS auto_update_amount_products;
delimiter //
CREATE TRIGGER auto_update_amount_products AFTER INSERT ON orders_products
FOR EACH ROW 
BEGIN
    SET @total = NEW.total;
    UPDATE products SET products.amount = products.amount - @total
    WHERE products.id = NEW.product_id;
END //
delimiter ;

-- example
SELECT name, color, amount  FROM products WHERE id = 1;
INSERT INTO `orders_products` (order_id, product_id, total) VALUES 
        (11,1,3);   
SELECT name, color, amount FROM products WHERE id = 1;



-- updating amount of product in storehouses table after moving
SELECT product_id, value  FROM storehouses_products WHERE product_id = 1 ;
SELECT id, amount FROM products WHERE id = 1;

START TRANSACTION;
UPDATE products SET amount = amount + 10 WHERE products.id = 1;
UPDATE storehouses_products SET value = value - 10 WHERE product_id =1;
COMMIT;

SELECT product_id, value  FROM storehouses_products WHERE product_id = 1 ;
SELECT id, amount FROM products WHERE id = 1;