SELECT * FROM northwind.orders;
SELECT * FROM northwind.purchase_orders;

SELECT 
	id, employee_id
FROM 
	northwind.orders
UNION
SELECT 
	id, created_by 
		AS 
			employee_id
FROM 
	northwind.purchase_orders;

SELECT 
	id, 
    employee_id, 
    'orders' 
		AS 
			source_table
FROM 
	northwind.orders
WHERE 
	employee_id 
		IS NOT NULL

UNION

SELECT 
	id, 
    created_by 	
		AS 
			employee_id, 
            'purchase_orders' 
				AS 
					source_table
FROM 
	northwind.purchase_orders
WHERE 
	created_by 
		IS NOT NULL;

SELECT
    customer_id,
    ship_name
FROM northwind.orders
WHERE payment_type IS NOT NULL;

SELECT
    customer_id,
    ship_name,
    COUNT(*) AS invoice_count
FROM northwind.orders
WHERE payment_type IS NOT NULL
GROUP BY customer_id, ship_name
ORDER BY invoice_count DESC;

