-- Full Table Scan (O(n))

-- Index Lookup (O(log n))

-- orders(order_id, user_id, total_amount, status, created_at)

-- SELECT *
-- FROM orders
-- WHERE user_id = 101;

-- Without Index

-- MySQL scans all rows in orders

-- Slow when table has lakhs/millions of rows



CREATE INDEX idex_order_user_id ON orders(user_id);

-- how to check if indexs is used or not 
show indexs from orders;


CREATE INDEX idx_email on user(email);


-- Index Creation
-- CREATE INDEX idx_users_email ON users(email);
-- How Index is Stored (B-Tree)

-- Index Structure (Conceptual)
--            [ m@gmail.com ]
--           /               \
--  [ a@gmail.com ]     [ z@gmail.com ]
--         |                   |
--      (PK=1)              (PK=999999)

-- Step 1: Search index tree
-- Step 2: Locate 'abc@gmail.com'
-- Step 3: Get user_id = 101
-- Step 4: Jump to row with PK = 101