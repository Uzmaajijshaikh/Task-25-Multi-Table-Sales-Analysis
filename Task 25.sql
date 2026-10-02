Query 1
SELECT
    COUNT(*) AS total_orders
FROM olist_orders_dataset;

Query 2
SELECT
    COUNT(*) AS total_customers
FROM olist_customers_dataset;

Query 3
SELECT
    COUNT(*) AS total_products
FROM olist_products_dataset;

Query 4
SELECT
    COUNT(*) AS total_orders,
    COUNT(c.customer_id) AS matched_customers,
    COUNT(*) - COUNT(c.customer_id) AS unmatched_customers
FROM olist_orders_dataset o
LEFT JOIN olist_customers_dataset c
    ON o.customer_id = c.customer_id;

Query 5
SELECT
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT oi.order_id) AS orders_with_items,
    COUNT(DISTINCT o.order_id) - COUNT(DISTINCT oi.order_id) AS orders_without_items
FROM olist_orders_dataset o
LEFT JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id;

Query 6
SELECT
    o.order_status,
    COUNT(*) AS orders_without_items
FROM olist_orders_dataset o
LEFT JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL
GROUP BY o.order_status
ORDER BY orders_without_items DESC;

Query 7
SELECT
    c.customer_state,
    ROUND(SUM(oi.price), 2) AS total_sales
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
    ON o.customer_id = c.customer_id
JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY total_sales DESC;

Query 8
SELECT
    COALESCE(p.product_category_name, 'Unknown') AS product_category,
    ROUND(SUM(oi.price), 2) AS total_sales
FROM olist_order_items_dataset oi
LEFT JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
GROUP BY product_category
ORDER BY total_sales DESC;

Query 9
SELECT
    oi.product_id,
    COALESCE(p.product_category_name, 'Unknown') AS product_category,
    ROUND(SUM(oi.price), 2) AS total_sales
FROM olist_order_items_dataset oi
LEFT JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
GROUP BY oi.product_id, product_category
ORDER BY total_sales DESC
LIMIT 10;

Query 10
SELECT
    strftime('%Y-%m', o.order_purchase_timestamp) AS order_month,
    ROUND(SUM(oi.price), 2) AS total_sales
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
GROUP BY order_month
ORDER BY order_month;

Query 11
SELECT
    order_status,
    COUNT(*) AS order_count
FROM olist_orders_dataset
GROUP BY order_status
ORDER BY order_count DESC;

Query 12
SELECT
    c.customer_unique_id,
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS order_count,
    ROUND(SUM(oi.price), 2) AS total_sales
FROM olist_customers_dataset c
JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id
JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_unique_id, c.customer_state
ORDER BY total_sales DESC
LIMIT 10;

Query 13
SELECT
    o.order_id,
    c.customer_unique_id,
    c.customer_state,
    o.order_status,
    DATE(o.order_purchase_timestamp) AS order_date,
    oi.product_id,
    COALESCE(p.product_category_name, 'Unknown') AS product_category,
    ROUND(oi.price, 2) AS product_sales,
    ROUND(oi.freight_value, 2) AS freight_value
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
    ON o.customer_id = c.customer_id
JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
LEFT JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
ORDER BY o.order_id, oi.order_item_id;