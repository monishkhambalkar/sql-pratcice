--create index user_id
create index inx_user_id on user(user_id);

-- Create composite index (order_id, status)
create index idx_order_id_status on order(order_id, status);

-- Check index usage using EXPLAIN
EXPLAIN INDEX inx_user_id ON user;

-- Drop index
DROP INDEX inx_user_id

-- Index on created_at
created index idx_order_created_at on order(created_at);

