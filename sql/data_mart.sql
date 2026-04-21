CREATE TABLE dm_sales_channel_daily (
    sales_date DATE,
    product_id BIGINT,
    branch_id BIGINT,
    partner_id BIGINT,
    order_channel VARCHAR(50),
    orders_count INT,
    products_count INT,
    revenue DECIMAL(12,2)
);

INSERT INTO dm_sales_channel_daily
SELECT
    DATE(o.order_date),
    op.product_id,
    o.branch_id,
    o.partner_id,
    o.order_channel,
    COUNT(DISTINCT o.order_id),
    SUM(op.quantity),
    SUM(p.price * op.quantity)
FROM Order o
JOIN Order_Product op ON o.order_id = op.order_id
JOIN Product p ON op.product_id = p.product_id
GROUP BY
    DATE(o.order_date),
    op.product_id,
    o.branch_id,
    o.partner_id,
