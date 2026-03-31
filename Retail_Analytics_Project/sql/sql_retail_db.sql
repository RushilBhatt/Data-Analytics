-- ==========================================================
-- 1. SETUP DIMENSIONS
-- ==========================================================

-- Create Customer Dimension (Internal keys remain Auto-Increment)
CREATE TABLE IF NOT EXISTS dim_customer (
    customer_key INT AUTO_INCREMENT PRIMARY KEY,
    customer_id VARCHAR(20),
    customer_name VARCHAR(200),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(20)
);

-- Create Product Dimension
CREATE TABLE IF NOT EXISTS dim_product (
    product_key INT AUTO_INCREMENT PRIMARY KEY,
    product_id VARCHAR(20),
    product_name VARCHAR(200),
    category VARCHAR(50),
    sub_category VARCHAR(50)
);

-- Create Date Dimension (MANUAL INT PRIMARY KEY)
CREATE TABLE IF NOT EXISTS dim_date (
    date_key INT PRIMARY KEY, -- No longer Auto-Increment
    full_date DATE UNIQUE,
    year INT,
    month INT,
    month_name VARCHAR(20),
    quarter INT,
    day INT,
    day_name VARCHAR(20)
);

-- ==========================================================
-- 2. POPULATE DATE DIMENSION (2014 - 2020)
-- ==========================================================

DELIMITER //
CREATE PROCEDURE FillDateDimension()
BEGIN
    DECLARE current_date_val DATE DEFAULT '2014-01-01';
    DECLARE end_date_val DATE DEFAULT '2020-12-31';

    -- Clean start
    TRUNCATE TABLE dim_date; 

    WHILE current_date_val <= end_date_val DO
        INSERT INTO dim_date (
            date_key, 
            full_date, 
            year, 
            month, 
            month_name, 
            quarter, 
            day, 
            day_name
        )
        VALUES (
            -- Creates YYYYMMDD integer format
            YEAR(current_date_val) * 10000 + MONTH(current_date_val) * 100 + DAY(current_date_val), 
            current_date_val, 
            YEAR(current_date_val), 
            MONTH(current_date_val), 
            MONTHNAME(current_date_val), 
            QUARTER(current_date_val), 
            DAY(current_date_val), 
            DAYNAME(current_date_val)
        );
        SET current_date_val = DATE_ADD(current_date_val, INTERVAL 1 DAY);
    END WHILE;
END //
DELIMITER ;

CALL FillDateDimension();
DROP PROCEDURE FillDateDimension;

-- ==========================================================
-- 3. SETUP FACT TABLE
-- ==========================================================

CREATE TABLE IF NOT EXISTS fact_sales (
    sales_key INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(30),
    order_date_key INT,
    ship_date_key INT,
    customer_key INT,
    product_key INT,
    ship_mode VARCHAR(50),
    sales DECIMAL(15,4),
    quantity INT,
    discount DECIMAL(10,4),
    profit DECIMAL(15,4),
    FOREIGN KEY (order_date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (ship_date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key)
);

-- ==========================================================
-- 4. DATA MIGRATION (STAGING -> STAR SCHEMA)
-- ==========================================================

-- Populate dim_customer
INSERT INTO dim_customer (customer_id, customer_name, segment, country, city, state, postal_code, region)
SELECT DISTINCT customer_id, customer_name, segment, country, city, state, postal_code, region
FROM stg_superstore;

-- Populate dim_product
INSERT INTO dim_product (product_id, product_name, category, sub_category)
SELECT DISTINCT product_id, product_name, category, sub_category
FROM stg_superstore;

-- Populate fact_sales
INSERT INTO fact_sales (
    order_id, order_date_key, ship_date_key, customer_key, product_key, ship_mode, sales, quantity, discount, profit
)
SELECT
    s.order_id,
    d1.date_key,
    d2.date_key,
    c.customer_key,
    p.product_key,
    s.ship_mode,
    CAST(s.sales AS DECIMAL(15,4)),
    s.quantity,
    CAST(s.discount AS DECIMAL(10,4)),
    CAST(s.profit AS DECIMAL(15,4))
FROM stg_superstore s
JOIN dim_date d1 ON s.order_date = d1.full_date
JOIN dim_date d2 ON s.ship_date = d2.full_date
JOIN dim_customer c ON s.customer_id = c.customer_id
JOIN dim_product p ON s.product_id = p.product_id;

-- Answering business questions -> High Performing Products

SELECT product_id, 
product_name, SUM(SALES) AS'Total Sales', SUM(profit) AS 'Total Profit'
FROM dim_product
INNER JOIN fact_sales ON dim_product.product_key = fact_sales.product_key
GROUP BY product_id, product_name
ORDER BY SUM(Profit) DESC
LIMIT 5;

-- Loss-Making Categories

SELECT category, SUM(profit) AS 'Total Profit'
FROM dim_product 
INNER JOIN fact_sales ON dim_product.product_key = fact_sales.product_key
GROUP BY category
HAVING SUM(profit) < 0;
-- Follow up: Since no categories show loss , drill down to sub-categories

SELECT sub_category, SUM(profit) AS 'Total Profit'
FROM dim_product
INNER JOIN fact_sales ON dim_product.product_key = fact_sales.product_key
GROUP BY sub_category
HAVING SUM(profit) < 0;

-- Follow up: Further check on products 

SELECT product_name, SUM(profit) AS 'Total Profit'
FROM dim_product
INNER JOIN fact_sales ON dim_product.product_key = fact_sales.product_key
GROUP BY product_name
HAVING SUM(profit) < 0;
--  “At the aggregated category level, all categories are profitable. However, sub-category and product-level 

-- analysis reveals localized losses, indicating pricing or discount inefficiencies.”

-- Regional Performance
SELECT region, SUM(sales) AS 'Total Sales', SUM(profit) AS 'Total Profit'
FROM dim_customer
INNER JOIN fact_sales ON dim_customer.customer_key = fact_sales.customer_key
GROUP BY region;

-- Segment Profitibility
SELECT segment, SUM(profit) AS 'Total Sales'
FROM dim_customer
INNER JOIN fact_sales ON dim_customer.customer_key = fact_sales.customer_key
GROUP BY segment;

-- Discount Strategy Impact
SELECT ROUND(discount,2) AS 'Discount', SUM(profit) AS 'Total Profit'
FROM fact_sales
GROUP BY discount
ORDER BY discount;

-- Identified discount thresholds where profitibiliy declines.
-- Discount >= 30 % result in negative profits

-- Product Targeting Optimizations

SELECT segment, category,SUM(profit) AS 'Total Profit'
FROM dim_customer
INNER JOIN fact_sales ON dim_customer.customer_key = fact_sales.customer_key
INNER JOIN dim_product ON fact_sales.product_key = dim_product.product_key
GROUP BY segment, category
ORDER BY SUM(profit);

-- Identified which segment generates profit per category

-- step 8 --> select to export fact sales joined with dimension for Excel analysis 

SELECT order_id AS 'Order ID',full_date AS 'Order Date',year AS 'Year',month AS 'Month',quarter AS 'Quarter',region AS 'Region',segment AS 'Segment',category as 'Category',sub_category AS 'Sub Category',sales AS 'Sales',quantity AS 'Quantity',discount AS 'Discount',profit AS 'Profit'
FROM fact_sales
INNER JOIN dim_customer ON fact_sales.customer_key = dim_customer.customer_key
INNER JOIN dim_product ON fact_sales.product_key = dim_product.product_key
INNER JOIN dim_date ON fact_sales.order_date_key = dim_date.date_key;