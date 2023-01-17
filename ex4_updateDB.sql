USE vk;

-- ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке

SELECT DISTINCT firstname FROM users ORDER BY firstname;

-- iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
-- Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)

-- SELECT * FROM profile; # смотрим таблицу
ALTER TABLE profile ADD is_active int UNSIGNED DEFAULT TRUE; # добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
-- SELECT * FROM profile WHERE birthday > DATE_ADD(NOW(), INTERVAL -18 YEAR); # смотрим кому нет 18
UPDATE profile SET is_active = 0 WHERE birthday > DATE_ADD(NOW(), INTERVAL -18 YEAR); # обновляем значение
SELECT * FROM profile; # смотрим результат

-- iv. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)

-- SELECT body FROM messages; # смотрим сколько всего сообщений
-- SELECT body FROM messages WHERE created_at < "2000-05-31 06:39:21"; # смотрим сколько сообщений до 31 мая 2000 года 
SELECT body FROM messages WHERE created_at > NOW(); # смотрим сообщения из будущего 
DELETE FROM messages WHERE created_at > NOW(); # удаляем сообщения из будущего
SELECT body FROM messages; # смотрим оставшиеся

-- v. Написать название темы курсового проекта (в комментарии)

# База данных магазина с сообществом клиентов, объединенных одним увлечением (Рукоделие)

