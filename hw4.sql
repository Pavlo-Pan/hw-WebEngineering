USE Pavlo_Panukhnyk;
-- Отключение безопасного режима
SET SQL_SAFE_UPDATES = 0;

-- 2. Создание таблицы для хранения данных о погоде
DROP TABLE IF EXISTS weather;
CREATE TABLE weather (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    day_temperature INT CHECK (day_temperature BETWEEN -30 AND 30),
    night_temperature INT CHECK (night_temperature BETWEEN -30 AND 30),
    wind_speed DECIMAL(3,1) CHECK (wind_speed >= 0)
);

-- 3. Заполнение таблицы данными за последние 5 дней
INSERT INTO weather (date, day_temperature, night_temperature, wind_speed)
VALUES
    (CURDATE() - INTERVAL 4 DAY, 10, 2, 1.5),
    (CURDATE() - INTERVAL 3 DAY, 12, 3, 2.0),
    (CURDATE() - INTERVAL 2 DAY, 15, 5, 3.5),
    (CURDATE() - INTERVAL 1 DAY, 8, 0, 4.0),
    (CURDATE(), 11, -1, 5.5);

-- 4. Увеличение ночной температуры на 1 градус, если скорость ветра ≤ 3 м/с
UPDATE weather
SET night_temperature = night_temperature + 1
WHERE wind_speed <= 3;

-- Включение безопасного режима обратно
SET SQL_SAFE_UPDATES = 1;

-- 5. Создание представления с дополнительными столбцами
DROP VIEW IF EXISTS weather_summary;
CREATE VIEW weather_summary AS
SELECT
    id,
    date,
    day_temperature,
    night_temperature,
    wind_speed,
    (day_temperature + night_temperature) / 2.0 AS avg_temperature,
    CASE
        WHEN wind_speed < 2 THEN 'штиль'
        WHEN wind_speed >= 2 AND wind_speed < 5 THEN 'умеренный ветер'
        ELSE 'сильный ветер'
    END AS wind_category
FROM weather;

INSERT INTO weather (date, day_temperature, night_temperature, wind_speed) VALUES     (CURDATE() - INTERVAL 4 DAY, 10, 2, 1.5),     (CURDATE() - INTERVAL 3 DAY, 12, 3, 2.0),     (CURDATE() - INTERVAL 2 DAY, 15, 5, 3.5),     (CURDATE() - INTERVAL 1 DAY, 8, 0, 4.0),     (CURDATE(), 11, -1, 5.5)
