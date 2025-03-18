-- 1. Подключение к базе данных и выбор всех строк из таблицы suppliers
USE 
	northwind;
SELECT 
	* 
FROM 
	suppliers;

-- 2. Выбор id, order_id и вычисляемого столбца category из order_details двумя способами

-- Способ 1: Использование IF
SELECT 
	id, 
    order_id, 
       IF
       (unit_price > 10, 'Expensive', 'Cheap') AS category
FROM
	order_details;

-- Способ 2: Использование CASE
SELECT 
	id, 
	order_id, 
       CASE 
           WHEN unit_price > 10 THEN 'Expensive' 
           ELSE 'Cheap' 
       END AS category
FROM 
	order_details;

-- 3. Вывести строки, где purchase_order_id не указано, и добавить total_price (quantity * unit_price)
SELECT 
	*, 
	(quantity * unit_cost) AS total_price
FROM 
	purchase_order_details
WHERE 
	purchase_order_id IS NULL;

-- 4. Вывести один столбец с именем и фамилией сотрудников, начиная со второй строки, всего три строки
SELECT 
	CONCAT(first_name, ' ', last_name) AS full_name
FROM 
	employees
LIMIT 3 OFFSET 1;

-- 6. Вывести уникальные имена компаний из customers, отсортированные по убыванию
SELECT DISTINCT
    company,
    CONCAT(first_name, ' ', last_name) AS full_name,
    job_title
FROM
    customers
ORDER BY company DESC;

-- 5. Вывести год и месяц из order_date в формате 'год-месяц'
SELECT 
	CONCAT(YEAR(order_date),'-', MONTH(order_date)) AS order_year_month
FROM 
	orders;
    
    
