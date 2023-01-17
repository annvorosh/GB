USE vk;


-- 1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
-- который больше всех общался с выбранным пользователем (написал ему сообщений).

SET @user_id = 10; -- заданный пользователь
 
SELECT 
concat(firstname, ' ', lastname) AS sender, count(*) AS 'number of messages'
FROM users AS u
JOIN messages AS m ON u.id = m.from_user_id AND m.to_user_id = @user_id
GROUP BY m.from_user_id
LIMIT 1;

-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..

SELECT count(*) AS 'количество лайков юзеров младше 10 лет'
FROM likes AS l
JOIN profile AS p ON l.user_id = p.user_id AND timestampdiff(YEAR, p.birthday, now()) < 10;

-- 3. Определить кто больше поставил лайков (всего): мужчины или женщины.

SELECT count(*), p.gender 
FROM likes AS l
JOIN profile AS p ON l.user_id = p.user_id 
GROUP BY p.gender ;

