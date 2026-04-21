CREATE TABLE Product (
    product_id BIGINT PRIMARY KEY,
    category_id BIGINT,
    status_id BIGINT,
    price DECIMAL(10,2)
);

CREATE TABLE Orders (
    order_id BIGINT PRIMARY KEY,
    order_date DATE
);
