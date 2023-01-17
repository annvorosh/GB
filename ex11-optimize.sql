-- 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products 
-- в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.



USE shop;

DROP TABLE IF EXISTS logs;
CREATE TABLE logs ( 
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(255),
    creating_time datetime DEFAULT now(),
    table_name varchar(255)

) comment = 'creating new entry' ENGINE = archive;

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  description TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Товарные позиции';

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);


DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');
  
  
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');
  
  
  
delimiter //

DROP TRIGGER IF EXISTS add_log_users//
CREATE TRIGGER add_log_users AFTER INSERT ON users
FOR EACH ROW 
BEGIN
--     DECLARE check_name varchar(255);
    SELECT name INTO @check_name FROM users ORDER BY id DESC LIMIT 1; 
    INSERT INTO logs 
        (name, table_name)
    VALUES 
        (@check_name, 'users');    
END//

DROP TRIGGER IF EXISTS add_log_catalogs//
CREATE TRIGGER add_log_catalogs AFTER INSERT ON catalogs
FOR EACH ROW 
BEGIN
--     DECLARE check_name varchar(255);
    SELECT name INTO @check_name FROM catalogs ORDER BY id DESC  LIMIT 1; 
    INSERT INTO logs 
        (name, table_name)
    VALUES 
        (@check_name, 'catalogs');    
END//

DROP TRIGGER IF EXISTS add_log_products//
CREATE TRIGGER add_log_products AFTER INSERT ON products
FOR EACH ROW 
BEGIN
--     DECLARE check_name varchar(255);
    SELECT name INTO @check_name FROM products ORDER BY id DESC LIMIT 1; 
    INSERT INTO logs 
        (name, table_name)
    VALUES 
        (@check_name, 'products');    
END//

delimiter ;

INSERT INTO products
    (name, description, price, catalog_id, created_at)
 VALUES 
    ('AMD Ryzen XXXXX', 'Процессор для игровых компьютеров', 29300.00, 1, now());

INSERT INTO catalogs VALUES
  (NULL, 'Вентилятор');
  
INSERT INTO users (name, birthday_at) VALUES
  ('Стефан', '2012-10-12');

SELECT * FROM logs;


-- 2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.

delimiter //

DROP PROCEDURE IF EXISTS add_1mln_entries//
CREATE PROCEDURE add_1mln_entries ()
BEGIN 
    DECLARE i int DEFAULT 0;
--     WHILE i < 1000000 do  -- Execute time (ms) 210081 max(id) = 1,000,007
    WHILE i < 1000 do
        INSERT INTO users (name)  VALUES ('');
        SET i = i + 1;
    END WHILE;        
END //

delimiter ;

CALL add_1mln_entries (); 

SELECT max(id) FROM users;


