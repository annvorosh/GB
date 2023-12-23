/*ETL: автоматизация подготовки данных (семинары)
Урок 4. Партицирование данных по дате. Динамическое партицирование

1. Создайте таблицу movies с полями movies_type, director, year_of_issue, length_in_minutes, rate.*/

DROP DATABASE IF EXISTS my_database;
CREATE DATABASE my_database;
USE my_database;

CREATE TABLE movies (
    movie_type VARCHAR(100),
    director VARCHAR(100),
    year_of_issue INT,
    length_in_minutes INT,
    rate DECIMAL(3,1)
);

/*2. Сделайте таблицы для горизонтального партицирования по году выпуска (до 1990, 1990 -2000, 2000- 2010, 2010-2020, после 2020).*/

-- Таблица для фильмов выпущенных до 1990 года

CREATE TABLE movies_before_1990 (
    movie_type VARCHAR(100),
    director VARCHAR(100),
    year_of_issue INT,
    length_in_minutes INT,
    rate DECIMAL(3,1)
);

-- Таблица для фильмов выпущенных с 1990 по 2000 год
CREATE TABLE movies_1990_to_2000 (
    movie_type VARCHAR(100),
    director VARCHAR(100),
    year_of_issue INT,
    length_in_minutes INT,
    rate DECIMAL(3,1)
);

-- Таблица для фильмов выпущенных с 2000 по 2010 год
CREATE TABLE movies_2000_to_2010 (
    movie_type VARCHAR(100),
    director VARCHAR(100),
    year_of_issue INT,
    length_in_minutes INT,
    rate DECIMAL(3,1)
);

-- Таблица для фильмов выпущенных с 2010 по 2020 год
CREATE TABLE movies_2010_to_2020 (
    movie_type VARCHAR(100),
    director VARCHAR(100),
    year_of_issue INT,
    length_in_minutes INT,
    rate DECIMAL(3,1)
);

-- Таблица для фильмов выпущенных после 2020 года
CREATE TABLE movies_after_2020 (
    movie_type VARCHAR(100),
    director VARCHAR(100),
    year_of_issue INT,
    length_in_minutes INT,
    rate DECIMAL(3,1)
);


/*3. Сделайте таблицы для горизонтального партицирования по длине фильма (до 40 минута, от 40 до 90 минут, от 90 до 130 минут, более 130 минут).*/

-- Таблица для фильмов продолжительностью до 40 минут
CREATE TABLE movies_under_40_minutes (
    movie_type VARCHAR(100),
    director VARCHAR(100),
    year_of_issue INT,
    length_in_minutes INT,
    rate DECIMAL(3,1)
);

-- Таблица для фильмов продолжительностью от 40 до 90 минут
CREATE TABLE movies_40_to_90_minutes (
    movie_type VARCHAR(100),
    director VARCHAR(100),
    year_of_issue INT,
    length_in_minutes INT,
    rate DECIMAL(3,1)
);

-- Таблица для фильмов продолжительностью от 90 до 130 минут
CREATE TABLE movies_90_to_130_minutes (
    movie_type VARCHAR(100),
    director VARCHAR(100),
    year_of_issue INT,
    length_in_minutes INT,
    rate DECIMAL(3,1)
);

-- Таблица для фильмов продолжительностью более 130 минут
CREATE TABLE movies_over_130_minutes (
    movie_type VARCHAR(100),
    director VARCHAR(100),
    year_of_issue INT,
    length_in_minutes INT,
    rate DECIMAL(3,1)
);


/*4. Сделайте таблицы для горизонтального партицирования по рейтингу фильма (ниже 5, от 5 до 8, от 8до 10).*/

-- Таблица для фильмов с рейтингом ниже 5
CREATE TABLE movies_below_5_rating (
    movie_type VARCHAR(100),
    director VARCHAR(100),
    year_of_issue INT,
    length_in_minutes INT,
    rate DECIMAL(3,1)
);

-- Таблица для фильмов с рейтингом от 5 до 8
CREATE TABLE movies_5_to_8_rating (
    movie_type VARCHAR(100),
    director VARCHAR(100),
    year_of_issue INT,
    length_in_minutes INT,
    rate DECIMAL(3,1)
);

-- Таблица для фильмов с рейтингом от 8 до 10
CREATE TABLE movies_8_to_10_rating (
    movie_type VARCHAR(100),
    director VARCHAR(100),
    year_of_issue INT,
    length_in_minutes INT,
    rate DECIMAL(3,1)
);


/*5. Создайте правила добавления данных для каждой таблицы.*/

-- Таблицы по году выпуска:

-- Триггеры для таблицы movies_before_1990
DELIMITER //

CREATE TRIGGER insert_movies_before_1990
BEFORE INSERT ON movies
FOR EACH ROW
BEGIN
    IF NEW.year_of_issue < 1990 THEN
        INSERT INTO movies_before_1990 (movie_type, director, year_of_issue, length_in_minutes, rate)
        VALUES (NEW.movie_type, NEW.director, NEW.year_of_issue, NEW.length_in_minutes, NEW.rate);
    END IF;
END;
//

DELIMITER ;

-- Триггеры для таблицы movies_1990_to_2000
DELIMITER //

CREATE TRIGGER insert_movies_1990_to_2000
BEFORE INSERT ON movies
FOR EACH ROW
BEGIN
    IF NEW.year_of_issue >= 1990 AND NEW.year_of_issue <= 2000 THEN
        INSERT INTO movies_1990_to_2000 (movie_type, director, year_of_issue, length_in_minutes, rate)
        VALUES (NEW.movie_type, NEW.director, NEW.year_of_issue, NEW.length_in_minutes, NEW.rate);
    END IF;
END;
//

DELIMITER ;

-- Триггеры для таблицы movies_2000_to_2010
DELIMITER //

CREATE TRIGGER insert_movies_2000_to_2010
BEFORE INSERT ON movies
FOR EACH ROW
BEGIN
    IF NEW.year_of_issue >= 2000 AND NEW.year_of_issue <= 2010 THEN
        INSERT INTO movies_2000_to_2010 (movie_type, director, year_of_issue, length_in_minutes, rate)
        VALUES (NEW.movie_type, NEW.director, NEW.year_of_issue, NEW.length_in_minutes, NEW.rate);
    END IF;
END;
//

DELIMITER ;

-- Триггеры для таблицы movies_2010_to_2020
DELIMITER //

CREATE TRIGGER insert_movies_2010_to_2020
BEFORE INSERT ON movies
FOR EACH ROW
BEGIN
    IF NEW.year_of_issue >= 2010 AND NEW.year_of_issue <= 2020 THEN
        INSERT INTO movies_2010_to_2020 (movie_type, director, year_of_issue, length_in_minutes, rate)
        VALUES (NEW.movie_type, NEW.director, NEW.year_of_issue, NEW.length_in_minutes, NEW.rate);
    END IF;
END;
//

DELIMITER ;

-- Триггеры для таблицы movies_after_2020
DELIMITER //

CREATE TRIGGER insert_movies_after_2020
BEFORE INSERT ON movies
FOR EACH ROW
BEGIN
    IF NEW.year_of_issue > 2020 THEN
        INSERT INTO movies_after_2020 (movie_type, director, year_of_issue, length_in_minutes, rate)
        VALUES (NEW.movie_type, NEW.director, NEW.year_of_issue, NEW.length_in_minutes, NEW.rate);
    END IF;
END;
//

DELIMITER ;

-- Триггеры для таблицы movies_under_40_minutes
DELIMITER //

CREATE TRIGGER insert_movies_under_40_minutes
BEFORE INSERT ON movies
FOR EACH ROW
BEGIN
    IF NEW.length_in_minutes < 40 THEN
        INSERT INTO movies_under_40_minutes (movie_type, director, year_of_issue, length_in_minutes, rate)
        VALUES (NEW.movie_type, NEW.director, NEW.year_of_issue, NEW.length_in_minutes, NEW.rate);
    END IF;
END;
//

DELIMITER ;

-- Триггеры для таблицы movies_40_to_90_minutes
DELIMITER //

CREATE TRIGGER insert_movies_40_to_90_minutes
BEFORE INSERT ON movies
FOR EACH ROW
BEGIN
    IF NEW.length_in_minutes >= 40 AND NEW.length_in_minutes <= 90 THEN
        INSERT INTO movies_40_to_90_minutes (movie_type, director, year_of_issue, length_in_minutes, rate)
        VALUES (NEW.movie_type, NEW.director, NEW.year_of_issue, NEW.length_in_minutes, NEW.rate);
    END IF;
END;
//

DELIMITER ;

-- Триггеры для таблицы movies_90_to_130_minutes
DELIMITER //

CREATE TRIGGER insert_movies_90_to_130_minutes
BEFORE INSERT ON movies
FOR EACH ROW
BEGIN
    IF NEW.length_in_minutes > 90 AND NEW.length_in_minutes <= 130 THEN
        INSERT INTO movies_90_to_130_minutes (movie_type, director, year_of_issue, length_in_minutes, rate)
        VALUES (NEW.movie_type, NEW.director, NEW.year_of_issue, NEW.length_in_minutes, NEW.rate);
    END IF;
END;
//

DELIMITER ;

-- Триггеры для таблицы movies_over_130_minutes
DELIMITER //

CREATE TRIGGER insert_movies_over_130_minutes
BEFORE INSERT ON movies
FOR EACH ROW
BEGIN
    IF NEW.length_in_minutes > 130 THEN
        INSERT INTO movies_over_130_minutes (movie_type, director, year_of_issue, length_in_minutes, rate)
        VALUES (NEW.movie_type, NEW.director, NEW.year_of_issue, NEW.length_in_minutes, NEW.rate);
    END IF;
END;
//

DELIMITER ;

-- Триггеры для таблицы movies_below_5_rating
DELIMITER //

CREATE TRIGGER insert_movies_below_5_rating
BEFORE INSERT ON movies
FOR EACH ROW
BEGIN
    IF NEW.rate < 5 THEN
        INSERT INTO movies_below_5_rating (movie_type, director, year_of_issue, length_in_minutes, rate)
        VALUES (NEW.movie_type, NEW.director, NEW.year_of_issue, NEW.length_in_minutes, NEW.rate);
    END IF;
END;
//

DELIMITER ;

-- Триггеры для таблицы movies_5_to_8_rating
DELIMITER //

CREATE TRIGGER insert_movies_5_to_8_rating
BEFORE INSERT ON movies
FOR EACH ROW
BEGIN
    IF NEW.rate >= 5 AND NEW.rate < 8 THEN
        INSERT INTO movies_5_to_8_rating (movie_type, director, year_of_issue, length_in_minutes, rate)
        VALUES (NEW.movie_type, NEW.director, NEW.year_of_issue, NEW.length_in_minutes, NEW.rate);
    END IF;
END;
//

DELIMITER ;

-- Триггеры для таблицы movies_8_to_10_rating
DELIMITER //

CREATE TRIGGER insert_movies_8_to_10_rating
BEFORE INSERT ON movies
FOR EACH ROW
BEGIN
    IF NEW.rate >= 8 AND NEW.rate <= 10 THEN
        INSERT INTO movies_8_to_10_rating (movie_type, director, year_of_issue, length_in_minutes, rate)
        VALUES (NEW.movie_type, NEW.director, NEW.year_of_issue, NEW.length_in_minutes, NEW.rate);
    END IF;
END;
//

DELIMITER ;


/*6. Добавьте фильмы так, чтобы в каждой таблице было не менее 3 фильмов.*/

-- Добавление фильмов в основную таблицу 'movies'
INSERT INTO movies (movie_type, director, year_of_issue, length_in_minutes, rate)
VALUES
    ('Action', 'Running', 1985, 10, 1),
    ('Comedy', 'Alone home', 1989, 35, 8),
    ('Drama', 'Love', 1987, 120, 3),
    ('Thriller', 'Killer', 1995, 150, 8),
    ('Action', 'Formula', 1998, 130, 2),
    ('Comedy', 'Funk pop', 1992, 85, 6),
    ('Drama', 'Mr. Frank', 2008, 125, 9),
    ('Comedy', 'Bethowen', 2003, 95, 7),
    ('Action', 'Robinson Cruso', 2005, 19, 8),
    ('Romance', 'Igloo', 2012, 115, 7),
    ('Drama', 'Titanic', 2016, 140, 8),
    ('Action', 'Tour de France', 2019, 125, 9),
    ('Science Fiction', 'Apocalipsis', 2021, 105, 7),
    ('Thriller', 'Mia', 2022, 70, 8),
    ('Comedy', 'Elki', 2023, 75, 6);


/*7. Добавьте пару фильмов с рейтингом выше 10.*/

INSERT INTO movies (movie_type, director, year_of_issue, length_in_minutes, rate)
VALUES
    ('Drama', 'Stanley Kubrick', 1968, 149, 11.5),
    ('Comedy', 'Billy Wilder', 1959, 54, 10.2);

/*8. Сделайте выбор из всех таблиц, в том числе из основной.*/

-- Выборка из основной таблицы
SELECT * FROM movies;

-- Выборка из таблиц по году выпуска
SELECT * FROM movies_before_1990;
SELECT * FROM movies_1990_to_2000;
SELECT * FROM movies_2000_to_2010;
SELECT * FROM movies_2010_to_2020;
SELECT * FROM movies_after_2020;

-- Выборка из таблиц по длине фильма
SELECT * FROM movies_under_40_minutes;
SELECT * FROM movies_40_to_90_minutes;
SELECT * FROM movies_90_to_130_minutes;
SELECT * FROM movies_over_130_minutes;

-- Выборка из таблиц по рейтингу фильма
SELECT * FROM movies_below_5_rating;
SELECT * FROM movies_5_to_8_rating;
SELECT * FROM movies_8_to_10_rating;

/*9. Сделайте выбор только из основной таблицы.*/

SELECT * FROM movies;
