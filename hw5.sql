SELECT 
    AVG(unit_cost) AS avg_unit_cost,
    SUM(unit_cost) AS sum_unit_cost,
    MIN(unit_cost) AS min_unit_cost,
    MAX(unit_cost) AS max_unit_cost
FROM 
	northwind.purchase_order_details;

SELECT 
    COUNT(DISTINCT purchase_order_id) AS unique_order_count
FROM 
	northwind.purchase_order_details;


SELECT 
    purchase_order_id, 
    COUNT(product_id) AS product_count
FROM 
	northwind.purchase_order_details
GROUP BY 
	purchase_order_id
ORDER BY 
	product_count DESC;
    
SELECT 
    date_received, 
    COUNT(DISTINCT purchase_order_id) AS order_count
FROM 
	northwind.purchase_order_details
WHERE 
	quantity > 30
GROUP BY 
	date_received;
    
SELECT 
    date_received, 
    SUM(quantity * unit_cost) AS total_order_cost
FROM 
	northwind.purchase_order_details
GROUP BY 
	date_received;

SELECT 
    unit_cost, 
    AVG(quantity) AS avg_quantity, 
    MAX(quantity) AS max_quantity
FROM 
	northwind.purchase_order_details
WHERE 
	purchase_order_id <= 100
GROUP BY 
	unit_cost;
    
    SELECT 
    CASE 
        WHEN unit_cost > 20 THEN 'Expensive' 
        ELSE 'Others' 
    END AS category, 
    COUNT(*) AS product_count
FROM 
    northwind.purchase_order_details
WHERE 
    inventory_id IS NOT NULL
GROUP BY 
    category;

