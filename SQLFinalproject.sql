create database retail;
use retail;
SELECT
o.order_id,
p.product_name,
oi.quantity,
oi.list_price,
oi.discount
FROM orders o
INNER JOIN orderitems1 oi
ON o.order_id=oi.order_id
INNER JOIN products p
ON oi.product_id=p.product_id;

SELECT
o.store_id,
SUM(oi.quantity*oi.list_price) AS TotalSales
FROM orders o
JOIN orderitems1 oi
ON o.order_id=oi.order_id
GROUP BY o.store_id;

SELECT
p.product_name,
SUM(oi.quantity) AS TotalSold
FROM products p
JOIN orderitems1 oi
ON p.product_id=oi.product_id
GROUP BY p.product_name
ORDER BY TotalSold DESC
LIMIT 5;

SELECT
c.customer_id,
c.first_name,
COUNT(DISTINCT o.order_id) AS TotalOrders,
SUM(oi.quantity) AS TotalItems,
SUM(oi.quantity*oi.list_price) AS Revenue
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN orderitems1 oi
ON o.order_id=oi.order_id
GROUP BY c.customer_id,c.first_name;

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    SUM(oi.quantity * oi.list_price * (1-oi.discount)) AS total_spend,
CASE
WHEN SUM(oi.quantity * oi.list_price * (1-oi.discount)) < 1000
THEN 'Low'
WHEN SUM(oi.quantity * oi.list_price * (1-oi.discount))
BETWEEN 1000 AND 5000
THEN 'Medium'
ELSE 'High'
END AS spending_segment
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN orderitems1 oi
ON o.order_id=oi.order_id
GROUP BY c.customer_id, customer_name;


SELECT
s.staff_id,
s.first_name,
SUM(oi.quantity*oi.list_price) AS Revenue
FROM staffs s
JOIN orders o
ON s.staff_id=o.staff_id
JOIN orderitems1 oi
ON o.order_id=oi.order_id
GROUP BY s.staff_id,s.first_name;

SELECT
p.product_name,
s.store_id,
s.quantity
FROM stocks s
JOIN products p
ON s.product_id=p.product_id
WHERE s.quantity<10;

SELECT * FROM customer_segments;
-- SELECT COUNT(*) FROM customer_segments;
-- SELECT COUNT(*) AS Total_Rows
-- FROM customer_segments;
SELECT * FROM customer_segments
LIMIT 1445;

SELECT * FROM customer_segments
LIMIT 10;



