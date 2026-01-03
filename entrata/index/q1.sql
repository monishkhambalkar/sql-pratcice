--create index user_id
create index inx_user_id on user(user_id);

-- Create composite index (order_id, status)
create index idx_order_id_status on order(order_id, status);

-- Check index usage using EXPLAIN
EXPLAIN INDEX inx_user_id ON user;

-- Drop index
DROP INDEX inx_user_id FROM user;

-- Index on created_at
CREATE INDEX idx_order_created_at ON order(created_at);

-- Create FULL-TEXT Index for Product Search

/*mobile case red waterproof
    on columns:
    product_name
    product_description
*/

ALTER TABLE Product
ADD FULLTEXT index_fulltext_product(product_name, product_description);


-- Composite Index
-- A composite index is a database index created on more than one column together to make queries faster when those columns are used together in WHERE, JOIN, or ORDER BY.
/*So it works best when queries use:
    email
    email + status
    ❌ But not efficient when filtering only by status.
    search by multiple columns  create index index_user_email_status ON users (email, status)
    SELECT *
    FROM appointments
    WHERE doctor_id = 101 AND date = '2026-01-02';
 */

 --- Full-Text Index

 /*

    A Full-Text Index is used to search text efficiently inside large text columns, like articles, descriptions, comments, or notes — much better than using LIKE '%word%'.

    CREATE FULLTEXT INDEX idx_content 
    ON articles(title, content);

    SELECT *
    FROM products
    WHERE MATCH(name, description)
    AGAINST ('wireless mouse');


    SELECT * FROM PRODCUCT
    WHERE MATCH(name, content);
    AGAINTS ('wileess mouse');

 */

-- index type and their usage

Best Index Type                     Use Case
BTREE INDEX                         search by email , id, name it for == query (where email = "monish@gmail.com")
Composite Index                     search by multiple columns  create index index_user_email_status ON users (email, status)
Full-Text Index                     fast search text in side the large text column descriptions, comments, (LIKE '%word%')



