DROP TABLE IF EXISTS nike;

CREATE TABLE nike(
    sku_id SERIAL PRIMARY KEY,
    product_name VARCHAR(120),
    product_id VARCHAR(150) NOT NULL,
    listing_price NUMERIC(8,2),
    sale_price NUMERIC(8,2),
    discount INTEGER,
    brand VARCHAR(120),
    description TEXT,
    rating NUMERIC(2,1),
    reviews INTEGER
);

COPY nike(
    product_name,
    product_id,
    listing_price,
    sale_price,
    discount,
    brand,
    description,
    rating,
    reviews
)
FROM 'C:\\temp\\nike_shoes_sales.csv'
DELIMITER ','
CSV HEADER;

-------------------data exploration-------------------

--count of rows
SELECT COUNT(*) FROM nike;

 --sample data 
 SELECT * FROM nike
 LIMIT 10;

 --null values 
 SELECT * FROM nike
 WHERE product_name IS NULL
 OR 
product_id IS NULL
 OR 
 listing_price IS NULL
 OR 
 sale_price IS NULL
 OR 
 discount IS NULL
 OR 
 brand IS NULL
 OR 
 description IS NULL
 OR 
 rating IS NULL
 OR 
 reviews IS NULL;

 --Replace Null with custome text
 UPDATE nike
 SET description = 'No description available'
 WHERE description IS NULL;

 --null values (Checking again)
 SELECT * FROM nike
 WHERE product_name IS NULL
 OR 
product_id IS NULL
 OR 
 listing_price IS NULL
 OR 
 sale_price IS NULL
 OR 
 discount IS NULL
 OR 
 brand IS NULL
 OR 
 description IS NULL
 OR 
 rating IS NULL
 OR 
 reviews IS NULL;

 --different product product name of nike shoes
 SELECT DISTINCT product_name
 FROM nike
 ORDER BY product_name;

 --products by their sale_price and counts
SELECT sale_price, COUNT (sku_id)
FROM nike
GROUP BY sale_price;

--product names present multiple times
SELECT product_name, COUNT(sku_id) as "Number of SKUs"
FROM nike
GROUP BY product_name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT (sku_id) DESC;


-------------------DATA CLEANING-------------------

--products with price = 0
SELECT * FROM nike
WHERE listing_price = 0;

DELETE FROM nike
WHERE listing_price = 0;

-- 426 product deleted for having 0 listing price.

--Calculate discount amount
SELECT product_name,
listing_price,
sale_price,
(listing_price - sale_price) AS calculated_discount
FROM nike;

-- Calculate discount percentage
--(formula: ((listing_price - sale_price)/listing_price) * 100)

SELECT product_name,
listing_price,
sale_price,
ROUND (
((listing_price - sale_price)/listing_price) * 100,2)
AS discount
FROM nike;

-------------------Business_Questions-------------------
--Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT product_name, sale_price, ROUND (
((listing_price - sale_price)/listing_price) * 100,2)
AS discount
FROM nike
ORDER BY discount DESC
LIMIT 10;

--Q2. What are the products with high sales price but low rating.
SELECT DISTINCT product_name, sale_price, rating
FROM nike
WHERE rating < 3.5 AND sale_price > 1000
ORDER BY sale_price DESC;

--Q3. Calculate Estimated revenue using reviews for each product name.
SELECT product_name,
SUM(sale_price * reviews) AS total_revenue
FROM nike
GROUP BY product_name
ORDER BY total_revenue DESC; 

--Q4. Find all products where listing price is greater than 15000 and discount is less than 30%.
SELECT DISTINCT listing_price, ROUND (
((listing_price - sale_price)/listing_price) * 100,2)
AS discount
FROM nike
WHERE listing_price > 15000 AND ROUND (
((listing_price - sale_price)/listing_price) * 100,2) < 30
ORDER BY listing_price DESC, discount DESC;

--Q5. Identify the top 5 product name offering the highest average discount percentage.
SELECT product_name, 
ROUND( AVG(
((listing_price - sale_price)/listing_price) * 100),2) AS avg_discount
FROM nike
GROUP BY product_name
ORDER BY avg_discount DESC
LIMIT 5;

--Q6. Group the products into categories like low, medium, bulk.
SELECT DISTINCT product_name, sale_price, 
CASE 
WHEN sale_price < 6000 THEN 'Low price'
WHEN sale_price BETWEEN 6000 AND 10000 THEN 'Medium Price'
ELSE 'Premium'
END AS price_category
FROM nike;



