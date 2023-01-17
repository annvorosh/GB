DROP DATABASE IF EXISTS example;
CREATE DATABASE example;

USE example;
DROP TABLE IF EXISTS users;
CREATE TABLE users(
    id int(8) UNSIGNED,
    name char(20)
) COMMENT = "клиенты";

DESCRIBE users;
