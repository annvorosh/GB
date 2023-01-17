-- Практическое задание по теме “Хранимые процедуры и функции, триггеры"

-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

USE sample;

delimiter //
DROP FUNCTION IF EXISTS hello//
CREATE FUNCTION hello()
RETURNS text DETERMINISTIC
BEGIN
    DECLARE format_now time;
    SELECT DATE_FORMAT (now(), "%H:%i:%s") INTO format_now;
    IF "06:00:00" < format_now < "12:00:00" THEN 
        RETURN 'Доброе утро';
    ELSEIF "12:00:00" < format_now < "18:00:00" THEN
        RETURN 'Добрый день';
    ELSEIF "18:00:00" < format_now < "00:00:00" THEN
        RETURN 'Добрый вечер';
    ELSE 
--     "00:00:00" < format_now < "06:00:00" THEN
        RETURN 'Доброй ночи';
    END IF;
END//

SELECT hello()//



-- В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
-- Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
-- Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
-- При попытке присвоить полям NULL-значение необходимо отменить операцию.

USE shop//
SELECT * FROM products ORDER BY id DESC //

DROP TRIGGER IF EXISTS check_not_null_values//

CREATE TRIGGER check_not_null_values AFTER INSERT ON products
FOR EACH ROW 
BEGIN 
    DECLARE check_name varchar(255);
    DECLARE check_description varchar(255);
    SELECT name, description INTO check_name, check_description FROM products ORDER BY id DESC LIMIT 1; 
    IF check_name IS NULL AND check_description IS NULL THEN 
         SIGNAL SQLSTATE '45000' SET message_text = 'INSERT canceled';
    END IF;
END//

DELETE FROM products WHERE id > 7//

 INSERT INTO products
    (name, description, price, catalog_id, created_at)
 VALUES 
    ('AMD Ryzen 9 5950X', 'Процессор для игровых компьютеров', 19300.00, 1, now()) //

SELECT * FROM products//
    
    
INSERT INTO products
    (name, description)
VALUES 
    (NULL , 'Процессор для игровых компьютеров')//
    
-- INSERT INTO products
--     (name, description)
-- VALUES 
--     (NULL , NULL)//             -- SIGNAL SQLSTATE '45000' SET message_text = 'INSERT canceled'   
    
SELECT * FROM products//

-- (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
-- Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. 
-- Вызов функции FIBONACCI(10) должен возвращать число 55.

USE sample//


-- DROP FUNCTION IF EXISTS FIBONACCI//
-- CREATE FUNCTION FIBONACCI()
-- RETURNS int DETERMINISTIC
-- BEGIN
--     DECLARE i int DEFAULT 3; 
--     DECLARE fib int
--     
--     WHILE i 
--     SET fib = 
--     RETURN 
-- END



