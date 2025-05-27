-- Структура таблиці
DESCRIBE user;

-- Перевірка індексів у таблиці user
SHOW INDEXES FROM user;

-- Вибрати всіх юзерів
SELECT * FROM user;


-- Отримати список користувачів, які не підтверджені
SELECT username, email
FROM user
WHERE is_verified = 0;

-- Знайти користувачів з вагою більше 80 кг
SELECT id, username, weight
FROM user
WHERE weight > 80
ORDER BY weight DESC;

-- Отримати список користувачів з хворобами
SELECT u.username, i.title AS illness_title
FROM user u
JOIN users_illnesses ui ON u.id = ui.user_id
JOIN illness i ON ui.illness_id = i.id;

-- Отримати список користувачів з обладнанням
SELECT u.username, e.name FROM user u INNER JOIN users_equipments ue ON u.id = ue.user_id INNER JOIN equipment e ON ue.equipment_id = e.id;


-- Отримати топ-5 тренувань за кількістю користувачів
SELECT t.name, COUNT(ut.user_id) as user_count FROM trainings t
LEFT JOIN user_training ut ON t.id = ut.training_id GROUP BY t.id ORDER BY user_count DESC LIMIT 5;

-- Запит на користувачів без тренувань
SELECT * FROM user u LEFT JOIN user_training ut ON u.id = ut.user_id WHERE ut.user_id IS TRUE;

-- Користувачі з понад 3-ма тренуваннями
SELECT user_id, COUNT(*) as trainings_count FROM user_training GROUP BY user_id HAVING trainings_count > 3;

-- Тренування з середнім рейтингом > 4
SELECT t.name, AVG(r.rating) as avg_rating FROM trainings t INNER JOIN training_rating r ON t.id = r.training_id GROUP BY t.id HAVING avg_rating > 4;

-- Вибрати юзера де id2
SELECT * FROM user WHERE id = 2;

-- Оновити емаил юзера з id
UPDATE user SET email = 'xxxxxxxxxx@gmail.com' WHERE id = 2;

-- Додати новий запис в таблицю
INSERT INTO user (id, email, photo, username, first_name, last_name, roles, gender, onboard, is_verified, created_at) VALUES (NULL, 'zzzzzzzzzzzzzzz@ghostdrive.com',
                  '', 'A', REPEAT('A', 500), 'Vazhl', '[\"ROLE_USER\"]',
                 '0', '0', '1', '2025-02-04 14:12:42');

-- тримати записи за останній тиждень
SELECT * FROM user WHERE created_at > NOW() - INTERVAL 7 DAY;

-- Видалити юзера з id3
DELETE FROM user WHERE id = 419;

-- Negative Test [HY000][1364] Field 'email' and ........doesn't have a default value
INSERT INTO user (id) VALUES (NULL);








