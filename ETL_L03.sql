DROP DATABASE IF EXISTS my_database;
CREATE DATABASE my_database;
USE my_database;


CREATE TABLE Рекламодатели (
    `Unique ID` INT PRIMARY KEY,
    `Name` VARCHAR(100)
);

CREATE TABLE Кампании (
    `Unique ID` INT PRIMARY KEY,
    `camp_name` VARCHAR(100),
    `advertiser_id` INT,
    FOREIGN KEY (`advertiser_id`) REFERENCES Рекламодатели(`Unique ID`)
);

CREATE TABLE Продажи (
    `Unique ID` INT PRIMARY KEY,
    `advert_id` INT,
    `camp_id` INT,
    FOREIGN KEY (`advert_id`) REFERENCES Кампании(`Unique ID`),
    FOREIGN KEY (`camp_id`) REFERENCES Кампании(`Unique ID`)
);



INSERT INTO Рекламодатели (`Unique ID`, `Name`)
VALUES
    (1, 'Рекламодатель А'),
    (2, 'Рекламодатель Б'),
    (3, 'Рекламодатель В');

INSERT INTO Кампании (`Unique ID`, `camp_name`, `advertiser_id`)
VALUES
    (101, 'Кампания X', 1),
    (102, 'Кампания Y', 1),
    (103, 'Кампания Z', 2);

INSERT INTO Продажи (`Unique ID`, `advert_id`, `camp_id`)
VALUES
    (1001, 101, 101),
    (1002, 101, 101),
    (1003, 102, 102);

SELECT
    R.`Unique ID`,
    R.`Name`,
    COUNT(DISTINCT C.`Unique ID`) AS TotalCampaigns,
    COUNT(DISTINCT S.`Unique ID`) AS TotalSales
FROM
    Рекламодатели R
LEFT JOIN
    Кампании C ON R.`Unique ID` = C.`advertiser_id`
LEFT JOIN
    Продажи S ON C.`Unique ID` = S.`camp_id`
GROUP BY
    R.`Unique ID`, R.`Name`
