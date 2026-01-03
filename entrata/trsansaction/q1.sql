/*

START TRANSACTION


COMMIT


ROLLBACK 






START TRANSACTION;

INSERT INTO orders VALUES (1, 101, 500);

INSERT INTO order_items VALUES (1, 10, 2);

UPDATE products 
SET stock = stock - 2 
WHERE product_id = 10 AND stock >= 2;

INSERT INTO payments VALUES (1, 1, 'SUCCESS');

COMMIT;






*/