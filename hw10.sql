use northwind;

select * from order_details;

SELECT 
    product_id,
    inventory_id,
    LAG(inventory_id) OVER (PARTITION BY product_id ORDER BY quantity DESC) AS prev_inventory_id,
    inventory_id AS current_inventory_id,
    LEAD(inventory_id) OVER (PARTITION BY product_id ORDER BY quantity DESC) AS next_inventory_id
FROM 
    order_details;

SELECT DISTINCT 
    order_id,
    FIRST_VALUE(unit_price) OVER (PARTITION BY order_id ORDER BY unit_price DESC) AS max_unit_price,
    FIRST_VALUE(unit_price) OVER (PARTITION BY order_id ORDER BY unit_price ASC) AS min_unit_price
FROM 
    order_details;

SELECT 
    order_id,
    unit_price,
    unit_price - FIRST_VALUE(unit_price) OVER (PARTITION BY order_id ORDER BY unit_price ASC) AS diff_from_min
FROM 
    order_details;
    
    SELECT 
    *,
    RANK() OVER (ORDER BY quantity DESC) AS quantity_rank
FROM 
    order_details;

WITH ranked_orders AS (
    SELECT 
        *,
        RANK() OVER (ORDER BY quantity DESC) AS quantity_rank
    FROM 
        order_details
)
SELECT 
    *
FROM 
    ranked_orders
WHERE 
    quantity_rank <= 10;
