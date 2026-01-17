CREATE DATABASE superstore_db;
USE superstore_db;
DESCRIBE superstore;
SELECT COUNT(*) FROM superstore;
SELECT * FROM superstore LIMIT 10;

SELECT
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS sales_nulls,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS profit_nulls,
    SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) AS discount_nulls
FROM superstore;

SELECT `Order ID`,COUNT(*) 
FROM superstore
GROUP BY `Order ID`
HAVING COUNT(*) > 1;

SELECT
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore;

SELECT
    SUM(Profit) / SUM(Sales) AS profit_margin
FROM superstore;

SELECT AVG(Discount) AS avg_discount
FROM superstore;

SELECT
    Region,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY Region
ORDER BY total_profit DESC;

SELECT
    Category,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY Category
ORDER BY total_profit DESC;
SELECT
    `Sub-Category`,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY `Sub-Category`
HAVING SUM(Profit) < 0
ORDER BY total_profit;

SELECT
    MIN(Profit) AS min_profit,
    MAX(Profit) AS max_profit
FROM superstore;
SELECT
    `Sub-Category`,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY `Sub-Category`
ORDER BY total_profit;

SELECT
    `Sub-Category`,
    COUNT(*) AS loss_orders,
    ROUND(SUM(Profit), 2) AS loss_amount
FROM superstore
WHERE Profit < 0
GROUP BY `Sub-Category`
ORDER BY loss_amount;

SELECT
    `Order ID`,
    `Sub-Category`,
    Profit
FROM superstore
ORDER BY Profit
LIMIT 10;

SELECT
    Discount,
    AVG(Profit) AS avg_profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;

SELECT
    YEAR(`Order Date`) AS year,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY YEAR(`Order Date`)
ORDER BY year;

CREATE VIEW vw_region_performance AS
SELECT
    Region,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY Region;

CREATE VIEW vw_category_profit AS
SELECT
    Category,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY Category;

CREATE VIEW vw_loss_products AS
SELECT
    `Sub-Category`,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY `Sub-Category`
HAVING SUM(Profit) < 0;
SELECT * FROM vw_region_performance;
SELECT * FROM vw_category_profit;
SELECT * FROM vw_loss_products;
select user();
show databases;
select database();










