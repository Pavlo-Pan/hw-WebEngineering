USE northwind;
# 1
SELECT product_name, 
       (SELECT SUM(quantity) 
        FROM order_details od
        WHERE od.product_id = p.id) 
			AS quantity
FROM products p;

# 1 CTE
WITH OrderQuantities AS (
    SELECT product_id, SUM(quantity) AS total_quantity
    FROM order_details
    GROUP BY product_id
)
SELECT p.product_name, COALESCE(oq.total_quantity, 0) AS quantity
FROM products p
LEFT JOIN OrderQuantities oq ON p.id = oq.product_id;

# 2
SELECT c.first_name, c.last_name, MIN(o.order_date) AS first_order_date
FROM orders o
JOIN customers c ON o.customer_id = c.id
WHERE c.last_name = 'Lee'
GROUP BY c.first_name, c.last_name;

# 3
SELECT  id, product_code, product_name, target_level, category 
FROM products p
WHERE target_level = (
    SELECT MAX(target_level) 
    FROM products 
    WHERE p.id IS NOT NULL
);