USE project2;

-- 1. Total Sales
SELECT SUM(sales_amount) AS total_sales
FROM fact_sales;

-- 2. Total Transactions
SELECT COUNT(*) AS total_transactions
FROM fact_sales;

-- 3. Total Units Sold
SELECT SUM(quantity) AS total_units_sold
FROM fact_sales;

-- 4. Sales by Payment Method
SELECT payment_method,
       SUM(sales_amount) AS total_sales
FROM fact_sales
GROUP BY payment_method
ORDER BY total_sales DESC;

-- 5. Sales by Product
SELECT p.product_name,
       SUM(f.sales_amount) AS total_sales
FROM fact_sales f
JOIN dim_product p
ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;

-- 6. Sales by Category
SELECT p.category,
       SUM(f.sales_amount) AS total_sales
FROM fact_sales f
JOIN dim_product p
ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

-- 7. Sales by Customer
SELECT c.customer_name,
       SUM(f.sales_amount) AS total_sales
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC;

-- 8. Sales by Customer Segment
SELECT c.customer_segment,
       SUM(f.sales_amount) AS total_sales
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_segment
ORDER BY total_sales DESC;

-- 9. Sales by State
SELECT c.state,
       SUM(f.sales_amount) AS total_sales
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.state
ORDER BY total_sales DESC;

-- 10. Monthly Sales Trend
SELECT d.month_name,
       SUM(f.sales_amount) AS total_sales
FROM fact_sales f
JOIN dim_date d
ON f.date_id = d.date_id
GROUP BY d.month_name;

-- 11. Total Sales using CTE
WITH total_sales AS (
    SELECT SUM(sales_amount) AS total_sale
    FROM fact_sales
)
SELECT *
FROM total_sales;


-- 12. Transactions Above Average Sales
WITH average_sales AS (
    SELECT AVG(sales_amount) AS average_sales
    FROM fact_sales
)
SELECT f.sales_amount
FROM fact_sales f
CROSS JOIN average_sales a
WHERE f.sales_amount > a.average_sales;


-- 13. Products Above Average Product Sales
WITH total_sales_by_product AS (
    SELECT product_id,
           SUM(sales_amount) AS total_sales
    FROM fact_sales
    GROUP BY product_id
)
SELECT product_id,
       total_sales
FROM total_sales_by_product
WHERE total_sales > (
    SELECT AVG(total_sales)
    FROM total_sales_by_product
);


-- 14. Highest-Selling Category
WITH total_sales_by_category AS (
    SELECT p.category,
           SUM(f.sales_amount) AS total_sales
    FROM fact_sales f
    JOIN dim_product p
    ON f.product_id = p.product_id
    GROUP BY p.category
)
SELECT category,
       total_sales AS highest_sale
FROM total_sales_by_category
ORDER BY highest_sale DESC
LIMIT 1;


-- 15. Top 5 Customers by Revenue
WITH customer_revenue AS (
    SELECT c.customer_name,
           SUM(f.sales_amount) AS total_sales
    FROM fact_sales f
    JOIN dim_customer c
    ON f.customer_id = c.customer_id
    GROUP BY c.customer_name
)
SELECT *
FROM customer_revenue
ORDER BY total_sales DESC
LIMIT 5;