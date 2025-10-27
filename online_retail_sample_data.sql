
-- sample data inserts (Customers, Categories, Products)
INSERT INTO Customers (first_name, last_name, email, phone, country) VALUES
('Amit', 'Kumar', 'amit.kumar@example.com', '9123456780', 'India'),
('Priya', 'Sharma', 'priya.sharma@example.com', '9123456781', 'India'),
('John', 'Doe', 'john.doe@example.com', '441234567890', 'UK'),
('Maria', 'Garcia', 'maria.garcia@example.com', '34912345678', 'Spain'),
('Chen', 'Wei', 'chen.wei@example.com', '8613800138000', 'China');

INSERT INTO Categories (category_name) VALUES
('Electronics'),
('Books'),
('Home & Kitchen'),
('Clothing'),
('Sports & Outdoors');

INSERT INTO Products (product_name, category_id, sku, price) VALUES
('Wireless Mouse', 1, 'ELEC-MOU-001', 12.99),
('USB-C Charger 30W', 1, 'ELEC-CHR-030', 19.50),
('Data Structures Book', 2, 'BOOK-DS-101', 29.99),
('Non-stick Frying Pan', 3, 'HK-FRY-009', 24.75),
('Men T-Shirt', 4, 'CLTH-TSH-XL', 9.99),
('Yoga Mat', 5, 'SPRT-YOG-01', 15.00);

-- sample orders and order items (small set to test queries)
INSERT INTO Orders (customer_id, order_date, status, total_amount) VALUES
(1, '2025-09-01 10:15:00', 'Completed', 42.48),
(2, '2025-09-02 14:40:00', 'Completed', 29.99),
(3, '2025-09-03 09:05:00', 'Completed', 55.49),
(1, '2025-09-05 18:20:00', 'Completed', 34.50),
(4, '2025-09-06 11:00:00', 'Cancelled', 0.00);

-- order items (note: ensure product_id values match created products above)
INSERT INTO OrderItems (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 12.99),
(1, 3, 1, 29.99),
(2, 3, 1, 29.99),
(3, 2, 1, 19.50),
(3, 4, 1, 24.75),
(4, 6, 2, 15.00);
    
INSERT INTO Payments (order_id, payment_date, amount, payment_method, payment_status) VALUES
(1, '2025-09-01 10:20:00', 42.48, 'Credit Card', 'Completed'),
(2, '2025-09-02 14:45:00', 29.99, 'UPI', 'Completed'),
(3, '2025-09-03 09:10:00', 44.25, 'Credit Card', 'Completed'),
(4, '2025-09-05 18:25:00', 30.00, 'Debit Card', 'Completed');
