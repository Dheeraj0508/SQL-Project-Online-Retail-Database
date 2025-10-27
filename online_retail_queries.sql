
-- online_retail_queries.sql
-- Analytical queries for reports & interview tasks

-- 1. Top 5 selling products by quantity
SELECT p.product_id, p.product_name, SUM(oi.quantity) AS total_qty_sold
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_qty_sold DESC
LIMIT 5;

-- 2. Monthly sales (total revenue) for the last 6 months
SELECT DATE_TRUNC('month', o.order_date) AS month,
       SUM(pmt.amount) AS revenue
FROM Orders o
JOIN Payments pmt ON o.order_id = pmt.order_id
WHERE pmt.payment_status = 'Completed'
GROUP BY month
ORDER BY month DESC
LIMIT 6;

-- 3. Average order value (AOV)
SELECT AVG(total_amount) AS avg_order_value FROM Orders WHERE status = 'Completed';

-- 4. Top customers by lifetime revenue
SELECT c.customer_id, c.first_name || ' ' || c.last_name AS customer_name,
       SUM(p.amount) AS lifetime_revenue
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Payments p ON o.order_id = p.order_id
GROUP BY c.customer_id, customer_name
ORDER BY lifetime_revenue DESC
LIMIT 10;

-- 5. Repeat customers (customers with more than 1 completed order)
SELECT c.customer_id, COUNT(o.order_id) AS completed_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id
HAVING COUNT(o.order_id) > 1;

-- 6. Sales by category
SELECT cat.category_name, SUM(oi.quantity * oi.unit_price) AS revenue
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
JOIN Categories cat ON p.category_id = cat.category_id
GROUP BY cat.category_name
ORDER BY revenue DESC;

-- 7. Running total of daily revenue (window function)
SELECT
  DATE(o.order_date) AS order_day,
  SUM(p.amount) AS daily_revenue,
  SUM(SUM(p.amount)) OVER (ORDER BY DATE(o.order_date)) AS running_total
FROM Orders o
JOIN Payments p ON o.order_id = p.order_id
GROUP BY DATE(o.order_date)
ORDER BY order_day;

-- 8. Customers with highest average order value
SELECT c.customer_id, c.first_name || ' ' || c.last_name AS customer_name,
       AVG(o.total_amount) AS avg_order_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id, customer_name
ORDER BY avg_order_value DESC
LIMIT 10;
