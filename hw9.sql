USE northwind;
SELECT * FROM purchase_order_details;
SELECT 
	purchase_order_id,
    MIN(unit_cost) OVER (PARTITION BY purchase_order_id) AS min_unit_cost,
    MAX(unit_cost) OVER (PARTITION BY purchase_order_id) AS max_unit_cost,
    AVG(unit_cost) OVER (PARTITION BY purchase_order_id) AS avg_unit_cost
FROM 
    purchase_order_details;
    
    SELECT 
	 distinct purchase_order_id,
    MIN(unit_cost) OVER (PARTITION BY purchase_order_id) AS min_unit_cost,
    MAX(unit_cost) OVER (PARTITION BY purchase_order_id) AS max_unit_cost,
    AVG(unit_cost) OVER (PARTITION BY purchase_order_id) AS avg_unit_cost
FROM 
    purchase_order_details;
    
    SELECT 
    purchase_order_id,
    product_id,
    quantity,
    unit_cost,
    quantity * unit_cost AS product_total,
    SUM(quantity * unit_cost) OVER (PARTITION BY purchase_order_id) AS order_total
FROM 
    purchase_order_details;

SELECT 
    purchase_order_id,
    date_received,
    CASE 
        WHEN COUNT(*) OVER (PARTITION BY date_received, posted_to_inventory) > 1 THEN '>1'
        ELSE '=1'
    END AS order_count_flag
FROM 
    purchase_order_details;
