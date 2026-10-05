USE sales_project;
select * from nikhil;
-- Total transactions
SELECT COUNT(*) AS Total_Transactions
FROM nikhil;
-- Total brands
SELECT COUNT(DISTINCT Brand) AS Total_Brands
FROM nikhil;
-- List of brands
SELECT DISTINCT Brand AS Mobile_Brand
FROM nikhil;
-- Total cities
SELECT COUNT(DISTINCT City) AS Total_Cities
FROM nikhil;
-- Total payment methods
SELECT COUNT(DISTINCT `Payment Method`) AS Payment_Method_Count
FROM nikhil;
-- List of payment methods
SELECT DISTINCT `Payment Method`
FROM nikhil;
-- Table structure
DESCRIBE nikhil;
-- =========================================================
-- 2. BASIC BUSINESS METRICS
-- =========================================================

-- Total revenue
SELECT
    ROUND(SUM(`Units*price`), 2) AS Total_Revenue
FROM nikhil;
-- Total units sold
SELECT
    SUM(`Units Sold`) AS Total_Units_Sold
FROM nikhil;
-- Average customer rating
SELECT
    ROUND(AVG(`Customer Ratings`), 2) AS Average_Customer_Rating
FROM nikhil;
-- Average customer age
SELECT
    ROUND(AVG(`Customer Age`), 2) AS Average_Customer_Age
FROM nikhil;
-- Average selling price
SELECT
    ROUND(AVG(`Price Per Unit`), 2) AS Average_Price
FROM nikhil;
-- =========================================================
-- 3. REVENUE ANALYSIS BY BRAND
-- =========================================================

-- Revenue by brand
SELECT
    Brand,
    ROUND(SUM(`Units*price`), 2) AS Revenue
FROM nikhil
GROUP BY Brand
ORDER BY Revenue DESC;
-- Units sold by brand
SELECT
    Brand,
    SUM(`Units Sold`) AS Units_Sold
FROM nikhil
GROUP BY Brand
ORDER BY Units_Sold DESC;
-- Transactions by brand
SELECT
    Brand,
    COUNT(*) AS Transactions
FROM nikhil
GROUP BY Brand
ORDER BY Transactions DESC;
-- =========================================================
-- 4. REVENUE ANALYSIS BY CITY
-- =========================================================

-- Revenue by city
SELECT
    City,
    ROUND(SUM(`Units*price`), 2) AS Revenue
FROM nikhil
GROUP BY City
ORDER BY Revenue DESC;
-- Units sold by city
SELECT
    City,
    SUM(`Units Sold`) AS Units_Sold
FROM nikhil
GROUP BY City
ORDER BY Units_Sold DESC;
-- Transactions by city
SELECT
    City,
    COUNT(*) AS Transactions
FROM nikhil
GROUP BY City
ORDER BY Transactions DESC;
-- =========================================================
-- 5. TOP 5 CITIES
-- =========================================================

SELECT
    City,
    ROUND(SUM(`Units*price`), 2) AS Revenue
FROM nikhil
GROUP BY City
ORDER BY Revenue DESC
LIMIT 5;
-- =========================================================
-- 6. PAYMENT METHOD ANALYSIS
-- =========================================================

-- Revenue by payment method
SELECT
    `Payment Method`,
    ROUND(SUM(`Units*price`), 2) AS Revenue
FROM nikhil
GROUP BY `Payment Method`
ORDER BY Revenue DESC;
-- Transactions by payment method
SELECT
    `Payment Method`,
    COUNT(*) AS Transactions
FROM nikhil
GROUP BY `Payment Method`
ORDER BY Transactions DESC;

-- Units sold by payment method
SELECT
    `Payment Method`,
    SUM(`Units Sold`) AS Units_Sold
FROM nikhil
GROUP BY `Payment Method`
ORDER BY Units_Sold DESC;
-- =========================================================
-- 7. MOBILE MODEL ANALYSIS
-- =========================================================

-- Revenue by mobile model
SELECT
    `Mobile Model`,
    ROUND(SUM(`Units*price`), 2) AS Revenue
FROM nikhil
GROUP BY `Mobile Model`
ORDER BY Revenue DESC;
-- Top 5 mobile models by revenue
SELECT
    `Mobile Model`,
    ROUND(SUM(`Units*price`), 2) AS Revenue
FROM nikhil
GROUP BY `Mobile Model`
ORDER BY Revenue DESC
LIMIT 5;
-- Units sold by mobile model
SELECT
    `Mobile Model`,
    SUM(`Units Sold`) AS Units_Sold
FROM nikhil
GROUP BY `Mobile Model`
ORDER BY Units_Sold DESC
LIMIT 5;

-- =========================================================
-- 8. APPLE ANALYSIS
-- =========================================================

-- Total Apple revenue
SELECT
    ROUND(SUM(`Units*price`), 2) AS Apple_Revenue
FROM nikhil
WHERE Brand = 'Apple';

-- Apple revenue by city
SELECT
    City,
    ROUND(SUM(`Units*price`), 2) AS Revenue
FROM nikhil
WHERE Brand = 'Apple'
GROUP BY City
ORDER BY Revenue DESC;

-- Apple units sold by city
SELECT
    City,
    SUM(`Units Sold`) AS Units_Sold
FROM nikhil
WHERE Brand = 'Apple'
GROUP BY City
ORDER BY Units_Sold DESC;

-- Apple sales in Delhi
SELECT *
FROM nikhil
WHERE Brand = 'Apple'
  AND City = 'Delhi';
-- =========================================================
-- 9. BRAND COMPARISON
-- =========================================================

-- Apple vs Samsung
SELECT
    Brand,
    ROUND(SUM(`Units*price`), 2) AS Revenue
FROM nikhil
WHERE Brand IN ('Apple', 'Samsung')
GROUP BY Brand
ORDER BY Revenue DESC;
-- Apple and Samsung transaction count
SELECT
    Brand,
    COUNT(*) AS Transactions
FROM nikhil
WHERE Brand IN ('Apple', 'Samsung')
GROUP BY Brand
ORDER BY Transactions DESC;
-- =========================================================
-- 10. SALES TREND ANALYSIS
-- =========================================================

-- Revenue by year
SELECT
    Year,
    ROUND(SUM(`Units*price`), 2) AS Revenue
FROM nikhil
GROUP BY Year
ORDER BY Year;

-- Revenue by year and month
SELECT
    Year,
    Month,
    ROUND(SUM(`Units*price`), 2) AS Revenue
FROM nikhil
GROUP BY Year, Month
ORDER BY Year, Month;

-- Units sold by year
SELECT
    Year,
    SUM(`Units Sold`) AS Units_Sold
FROM nikhil
GROUP BY Year
ORDER BY Year;
-- =========================================================
-- 11. AGE GROUP ANALYSIS
-- =========================================================

-- Revenue by age group
SELECT
    `Age group`,
    ROUND(SUM(`Units*price`), 2) AS Revenue
FROM nikhil
GROUP BY `Age group`
ORDER BY Revenue DESC;
-- Units sold by age group
SELECT
    `Age group`,
    SUM(`Units Sold`) AS Units_Sold
FROM nikhil
GROUP BY `Age group`
ORDER BY Units_Sold DESC;

-- Transactions by age group
SELECT
    `Age group`,
    COUNT(*) AS Transactions
FROM nikhil
GROUP BY `Age group`
ORDER BY Transactions DESC;
-- =========================================================
-- 12. CUSTOMER RATING ANALYSIS
-- =========================================================

-- Average rating by brand
SELECT
    Brand,
    ROUND(AVG(`Customer Ratings`), 2) AS Average_Rating
FROM nikhil
GROUP BY Brand
ORDER BY Average_Rating DESC;
-- Average rating by city
SELECT
    City,
    ROUND(AVG(`Customer Ratings`), 2) AS Average_Rating
FROM nikhil
GROUP BY City
ORDER BY Average_Rating DESC;
-- =========================================================
-- 13. HIGH-VALUE TRANSACTIONS
-- =========================================================

-- Highest-value transaction
-- Lowest-value transaction
SELECT *
FROM nikhil
ORDER BY `Units*price` ASC
LIMIT 1;
-- Top 10 highest-value transactions
SELECT
    `Transaction ID`,
    Brand,
    `Mobile Model`,
    City,
    `Units Sold`,
    `Price Per Unit`,
    `Units*price` AS Revenue
FROM nikhil
ORDER BY Revenue DESC
LIMIT 10;
-- =========================================================
-- 14. HIGH-VALUE BRANDS
-- =========================================================

-- Brands generating more than 150 million revenue
SELECT
    Brand,
    ROUND(SUM(`Units*price`), 2) AS Revenue
FROM nikhil
GROUP BY Brand
HAVING Revenue > 150000000
ORDER BY Revenue DESC;
-- =========================================================
-- 15. BRAND + CITY ANALYSIS
-- =========================================================

-- Revenue by brand and city
SELECT
    Brand,
    City,
    ROUND(SUM(`Units*price`), 2) AS Revenue
FROM nikhil
GROUP BY Brand, City
ORDER BY Revenue DESC;
-- Top 10 brand-city combinations
SELECT
    Brand,
    City,
    ROUND(SUM(`Units*price`), 2) AS Revenue
FROM nikhil
GROUP BY Brand, City
ORDER BY Revenue DESC
LIMIT 10;
-- =========================================================
-- 16. PAYMENT METHOD + BRAND
-- =========================================================

SELECT
    Brand,
    `Payment Method`,
    ROUND(SUM(`Units*price`), 2) AS Revenue
FROM nikhil
GROUP BY Brand, `Payment Method`
ORDER BY Revenue DESC;
-- =========================================================
-- 17. CITY + AGE GROUP
-- =========================================================

SELECT
    City,
    `Age group`,
    ROUND(SUM(`Units*price`), 2) AS Revenue
FROM nikhil
GROUP BY City, `Age group`
ORDER BY Revenue DESC;
-- =========================================================
-- 18. BUSINESS SUMMARY
-- =========================================================

SELECT
    COUNT(*) AS Total_Transactions,
    SUM(`Units Sold`) AS Total_Units_Sold,
    ROUND(SUM(`Units*price`), 2) AS Total_Revenue,
    ROUND(AVG(`Customer Ratings`), 2) AS Average_Rating,
    COUNT(DISTINCT Brand) AS Total_Brands,
    COUNT(DISTINCT City) AS Total_Cities
FROM nikhil;
