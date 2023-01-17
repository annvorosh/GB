USE vk;


-- 1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
-- который больше всех общался с выбранным пользователем (написал ему сообщений).

SET @user_id = 10;

SELECT count(*), from_user_id  FROM messages WHERE to_user_id = @user_id GROUP BY from_user_id LIMIT 1;

-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..

-- SELECT 
--     user_id,
--     timestampdiff(YEAR, birthday, now()) AS age
-- FROM profile HAVING age < 10;


SELECT 
    count(*) AS teens_likes
    FROM likes WHERE user_id IN (
        SELECT 
            user_id
        FROM profile where timestampdiff(YEAR, birthday, now()) < 10);

-- 3. Определить кто больше поставил лайков (всего): мужчины или женщины.
    
SELECT count(*) AS 'likes from m/f' FROM likes WHERE user_id IN (SELECT user_id FROM profile WHERE gender = 'm') 
UNION 
SELECT count(*) FROM likes WHERE user_id IN (SELECT user_id FROM profile WHERE gender = 'f');

