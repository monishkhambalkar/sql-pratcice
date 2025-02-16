Users Table:
+---------+----------+---------------------+----------+------------+
| user_id | username | email               | password | created_at
+---------+----------+---------------------+----------+-------------+
|    1    | john_doe | john@example.com     | ******** | 2024-11-16 10:00:00 |
|    2    | jane_doe | jane@example.com     | ******** | 2024-11-15 12:30:00 |
|    3    | alex_smith | alex@example.com   | ******** | 2024-11-14 14:45:00 |
+---------+----------+---------------------+----------+-------------+

Orders Table:
+----------+---------+---------------------+-------------+---------+
| order_id | user_id | order_date          | total_amount| status  |
+----------+---------+---------------------+-------------+---------+
|    101   |    1    | 2024-11-16 10:05:00 |    250.75   | Pending |
|    102   |    2    | 2024-11-15 12:35:00 |    120.50   | Shipped |
|    103   |    3    | 2024-11-14 15:00:00 |    500.00   | Delivered |
+----------+---------+---------------------+-------------+---------+

Products Table:
+------------+-------------------+--------+-------------+------------+
 product_id | product_name      | price  | category_id | stock_quantity|
+------------+-------------------+--------+-------------+------------+
|     1      | iPhone 14         | 999.99 |      2      |      50       
|     2      | Samsung Galaxy S21| 899.99 |      2      |      30       
|     3      | Dell XPS 13       | 1299.99|      3      |      20       
+------------+-------------------+--------+-------------+------------+

Categories Table:
+-------------+--------------------+
| category_id | category_name      |
+-------------+--------------------+
|      1      | Electronics        |
|      2      | Smartphones        |
|      3      | Laptops            |
+-------------+--------------------+

Order_Items Table:
+--------------+----------+------------+----------+--------+
| order_item_id| order_id | product_id | quantity | price  |
+--------------+----------+------------+----------+--------+
|      1       |    101   |     1      |    2     | 999.99 |
|      2       |    101   |     3      |    1     | 1299.99|
|      3       |    102   |     2      |    3     | 899.99 |
+--------------+----------+------------+----------+--------+

-- 1.Select All Users
SELECT * FROM Users;

-- 2.Find Users by Username
SELECT * FROM Users WHERE username = 'john_doe';

-- 3. List All Orders
SELECT * FROM Orders;

-- 4.Get Orders by User ID
SELECT * FROM Orders WHERE user_id = 1;

-- 5. Retrieve Products in Stock
SELECT * FROM Products WHERE stock_quantity > 0;

-- 6. List Products in a Specific Category
SELECT * FROM Products WHERE category_id = 2;

-- 7.Find Total Number of Orders
SELECT COUNT(*) AS total_orders FROM Orders;

-- 8.Calculate Total Sales Amount
SELECT SUM(total_amount) AS total_sales FROM Orders

-- 9. Find Users Who Made More Than 5 Orders
SELECT user_id, COUNT(*) as total_orders FROM Orders GROUP BY user_id having COUNT(*) > 5

-- 10. Get Order Items for a Specific Order
SELECT * FROM Order_Items WHERE order_id = 1;

-- 11. Join Users with Orders
SELECT U.user_id, U.username FROM Users 
JOIN Order O ON U.user_id = O.user_id

-- 12. Find Orders with More Than 3 Items
SELECT oi.order_id, COUNT(oi.order_item_id) AS item_count FROM Order_Items oi GROUP BY oi.order_id HAVING item_count > 3;

-- 13.Get Total Sales Per Product
SELECT product_id, SUM(quantity * price) as total_sales FROM Order_Items GROUP BY product_id

-- 14.Find Users Who Have Not Made Any Orders
SELECT U.user_id, U.username FROM Users U LEFT JOIN Orders O ON U.user_id = O.user_id where O.user_id IS NULL
SELECT U.user_id, U.username FROM Users U WHERE NOT EXISTS(SELECT 1 FROM Orders O WHERE O.user_id = U.user_id);

-- 15.Get Most Expensive Product
SELECT * FROM Products ORDER BY price DESC LIMIT 1;

-- 16.Find Products with Price Between $10 and $50
SELECT * FROM Products where price BETWEEN 10 AND 50;

-- 17.Update Product Stock Quantity
UPDATE Products SET stock_quantity = stock_quantity - 1 WHERE product_id = 1;

-- 18.Delete Orders Older Than 1 Year
DELETE FROM Orders WHERE order_date < NOW() - INTERVAL 1 YEAR 

-- 19.Add New Column to Users Table
ALTER TABLE Users ADD COLUMN last_login DATETIME

-- 20.Create Index on Orders Table
CREATE INDEX index_order_date ON Orders(order_date)


Common Tables and Columns
Users Table:
+---------+----------+---------------------+----------+------------+
| user_id | username | email               | password | created_at
+---------+----------+---------------------+----------+-------------+
|    1    | john_doe | john@example.com     | ******** | 2024-11-16 10:00:00 |
|    2    | jane_doe | jane@example.com     | ******** | 2024-11-15 12:30:00 |
|    3    | alex_smith | alex@example.com   | ******** | 2024-11-14 14:45:00 |
|    4    | alex_jhon | jhon@example.com    | ******** | 2024-11-03 14:45:00 |
+---------+----------+---------------------+----------+-------------+

Orders Table:
+----------+---------+---------------------+-------------+---------+
| order_id | user_id | order_date          | total_amount| status  |
+----------+---------+---------------------+-------------+---------+
|    101   |    1    | 2024-11-16 10:05:00 |    250.75   | Pending |
|    102   |    2    | 2024-11-15 12:35:00 |    120.50   | Shipped |
|    103   |    3    | 2024-11-14 15:00:00 |    500.00   | Delivered |
+----------+---------+---------------------+-------------+---------+
Products Table:
+------------+-------------------+--------+-------------+------------+
 product_id | product_name      | price  | category_id | stock_quantity|
+------------+-------------------+--------+-------------+------------+
|     1      | iPhone 14         | 999.99 |      2      |      50       
|     2      | Samsung Galaxy S21| 899.99 |      2      |      30       
|     3      | Dell XPS 13       | 1299.99|      3      |      20       
+------------+-------------------+--------+-------------+------------+
Categories Table:
+-------------+--------------------+
| category_id | category_name      |
+-------------+--------------------+
|      1      | Electronics        |
|      2      | Smartphones        |
|      3      | Laptops            |
+-------------+--------------------+
Order_Items Table:
+--------------+----------+------------+----------+--------+
| order_item_id| order_id | product_id | quantity | price  |
+--------------+----------+------------+----------+--------+
|      1       |    101   |     1      |    2     | 999.99 |
|      2       |    101   |     3      |    1     | 1299.99|
|      3       |    102   |     2      |    3     | 899.99 |
+--------------+----------+------------+----------+--------+
