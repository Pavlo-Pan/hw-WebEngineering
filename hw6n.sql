SELECT 
    id, 
    employee_id
FROM 
    northwind.orders
UNION
SELECT 
    id, 
    created_by AS employee_id
FROM 
    northwind.purchase_orders;

SELECT 
    id, 
    employee_id, 
    'orders' AS source_table
FROM 
    northwind.orders
WHERE 
    employee_id IS NOT NULL
UNION
SELECT 
    id, 
    created_by AS employee_id, 
    'purchase_orders' AS source_table
FROM 
    northwind.purchase_orders
WHERE 
    created_by IS NOT NULL;

SELECT 
    od.*, 
    po.payment_method
FROM 
    northwind.order_details od
JOIN 
    northwind.purchase_orders po 
    ON od.order_id = po.id
WHERE 
    po.payment_method IS NOT NULL;

SELECT 
i.*,
    c.last_name AS customer_last_name
FROM 
    northwind.orders o
JOIN 
    northwind.invoices i 
    ON o.id = i.order_id
JOIN 
    northwind.customers c 
    ON o.customer_id = c.id;

SELECT 
    o.customer_id, 
    c.last_name AS customer_last_name, 
    COUNT(i.id) AS invoice_count
FROM 
    northwind.orders o
JOIN 
    northwind.invoices i 
    ON o.id = i.order_id
JOIN 
    northwind.customers c 
    ON o.customer_id = c.id
GROUP BY 
    o.customer_id, c.last_name
ORDER BY 
    invoice_count DESC;
