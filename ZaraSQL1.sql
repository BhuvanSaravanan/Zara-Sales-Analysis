select * 
from updated_zara


--Data Cleaning and Data Preparation 

--checking for duplicate values in rows
select Product_ID, count(Product_ID) as CountProductID
from updated_zara
group by  Product_ID
having  count(Product_ID) > 1

--checking for null values 

SELECT
    SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS ProductID_null_count,
    SUM(CASE WHEN Product_Position IS NULL THEN 1 ELSE 0 END) AS ProductPosition_null_count,
    SUM(CASE WHEN Promotion IS NULL THEN 1 ELSE 0 END) AS Promotion_null_count,
    SUM(CASE WHEN Product_Category IS NULL THEN 1 ELSE 0 END) AS ProductCategory_null_count,
    SUM(CASE WHEN Seasonal IS NULL THEN 1 ELSE 0 END) AS Seasonal_null_count,
    SUM(CASE WHEN Sales_Volume IS NULL THEN 1 ELSE 0 END) AS SalesVolume_null_count,
    SUM(CASE WHEN Brand IS NULL THEN 1 ELSE 0 END) AS Brand_null_count,
    SUM(CASE WHEN URL IS NULL THEN 1 ELSE 0 END) AS URL_null_count,
    SUM(CASE WHEN SKU IS NULL THEN 1 ELSE 0 END) AS SKU_null_count,
    SUM(CASE WHEN Name IS NULL THEN 1 ELSE 0 END) AS Name_null_count,
    SUM(CASE WHEN Description IS NULL THEN 1 ELSE 0 END) AS Description_null_count,
    SUM(CASE WHEN Price IS NULL THEN 1 ELSE 0 END) AS Price_null_count,
    SUM(CASE WHEN Currency IS NULL THEN 1 ELSE 0 END) AS Currency_null_count,
    SUM(CASE WHEN Scraped_at IS NULL THEN 1 ELSE 0 END) AS Scraped_at_null_count,
    SUM(CASE WHEN Terms IS NULL THEN 1 ELSE 0 END) AS Terms_null_count,
    SUM(CASE WHEN Section IS NULL THEN 1 ELSE 0 END) AS Section_null_count
FROM 
    updated_zara;

-- Update NULL values in the Name column
UPDATE updated_zara
SET Name = 'Product unavailable'-- Replace with a meaningful default value
WHERE Name IS NULL;


-- Update NULL values in the Description column
UPDATE updated_zara
SET Description = 'No description available' -- Replace with a meaningful default value
WHERE Description IS NULL;

-- Summary Statistics 

-- Total Sales Volume? 

select sum(sales_volume) as TotalSalesVolume
from updated_zara

-- Average Price?
select avg(price) as AvgPrice
from updated_zara

-- Best Selling Products by Sales_Volume?

select top 5 name, price, sales_volume 
from updated_zara
order by Sales_Volume desc;

--Promotional Analysis 

select promotion, count(Product_ID)
from updated_zara
group by promotion
 
 -- Seasonal Analysis
 select seasonal, count(product_ID)
 from updated_zara
 group by Seasonal

 -- Product Analysis 
 select section, count(Product_ID) as CountOfProducts 
 from updated_zara
 group by section

 -- Insights DeepDive

-- 1. What percentage of customers prefer products on promotion compared to those not on promotion? (Promotion)
SELECT Promotion, COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () AS Percentage
FROM updated_zara
GROUP BY Promotion;

-- 2. How do customer preferences vary by section (e.g., Women’s, Men’s)? (Section)
SELECT Section, SUM(Sales_Volume) AS TotalSales
FROM updated_zara
GROUP BY Section
ORDER BY TotalSales DESC;


-- 3. Do products with higher visibility (ProductPosition) correlate with higher sales? (Product Position Vs Sales)
SELECT Product_Position, AVG(Sales_Volume) AS AverageSales
FROM updated_zara
GROUP BY Product_Position
ORDER BY Product_Position;

-- 4. What percentage of products are purchased during seasonal periods (Seasonal = TRUE)? (Seasonal)
SELECT Seasonal, COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () AS Percentage
FROM updated_zara
GROUP BY Seasonal;


-- 5. Which product attributes (e.g., price, terms,) influence repeat purchases? (Terms vs Prices vs Sales)

SELECT terms, Price, COUNT(*) AS RepeatPurchases
FROM updated_zara
WHERE Sales_Volume > 1
GROUP BY terms, Price
ORDER BY RepeatPurchases DESC;

-- 6. How do sales volumes compare for high-priced vs. low-priced products? (Prices vs Sales)
SELECT CASE 
         WHEN Price < 50 THEN 'Low'
         WHEN Price BETWEEN 50 AND 200 THEN 'Medium'
         ELSE 'High'
       END AS PriceRange, SUM(Sales_Volume) AS TotalSales
FROM updated_zara
GROUP BY CASE 
           WHEN Price < 50 THEN 'Low'
           WHEN Price BETWEEN 50 AND 200 THEN 'Medium'
           ELSE 'High'
         END;

-- 7. Which products have the highest and lowest sales volumes overall? (Sales)
SELECT Name, Sales_Volume
FROM updated_zara
ORDER BY Sales_Volume DESC;

-- 8. What is the revenue contribution of each section (Section) and product category? (Section vs Revenue)
SELECT Section, Product_Category, SUM(Price * Sales_Volume) AS TotalRevenue
FROM updated_zara
GROUP BY Section, Product_Category
ORDER BY TotalRevenue DESC;

-- 9. Do products on promotion outperform those that aren’t on promotion in terms of revenue? (Promotion vs Revenue)
SELECT Promotion, SUM(Price * Sales_Volume) AS TotalRevenue
FROM updated_zara
GROUP BY Promotion;


-- 10. Which sections or categories have the highest number of underperforming products (low sales volume)?
SELECT Section, Product_Category, COUNT(*) AS UnderperformingProducts
FROM updated_zara
WHERE Sales_Volume < (SELECT AVG(Sales_Volume) FROM updated_zara)
GROUP BY Section, Product_Category
ORDER BY UnderperformingProducts DESC;

-- 11. Do seasonal products (Seasonal = TRUE) have higher average sales compared to non-seasonal ones?
SELECT Seasonal, AVG(Sales_Volume) AS AverageSales
FROM updated_zara
GROUP BY Seasonal;

-- 12. What is the average sales volume by ProductPosition, and does higher visibility lead to better performance?
SELECT Product_Position, AVG(Sales_Volume) AS AverageSales
FROM updated_zara
GROUP BY Product_Position
ORDER BY Product_Position;

-- 13. What percentage of products fall into each price tier (low, medium, high)?
SELECT 
  CASE 
    WHEN Price < 50 THEN 'Low'
    WHEN Price BETWEEN 50 AND 200 THEN 'Medium'
    ELSE 'High'
  END AS PriceTier,
  COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () AS Percentage
FROM updated_zara
GROUP BY CASE 
           WHEN Price < 50 THEN 'Low'
           WHEN Price BETWEEN 50 AND 200 THEN 'Medium'
           ELSE 'High'
         END;

-- 14. How does the combination of product position and promotion impact total sales volume? (Product_Position, Promotion, Sales)
select Product_Position, Promotion, sum(Sales_Volume)
from updated_zara
group by Product_Position, Promotion



-- 15. What is the average price of products on promotion across different sections? (Promotion, Section, Price)
select section, Promotion,avg(price)
from updated_zara
group by section, Promotion

-- 16. How do sales and total revenue volumes vary across seasonal products with different terms and conditions?  (Sales, Seasonal, Terms)
select Seasonal, terms, sum(Sales_Volume)
from updated_zara
group by Seasonal, terms

select Seasonal, terms, sum(price * Sales_Volume)
from updated_zara
group by Seasonal, terms
--- 17. How do sales volumes and total revenue differ across sections and seasons? (Sales, Section, Terms)

select Seasonal, section, sum(Sales_Volume)
from updated_zara
group by Seasonal, section

select Seasonal, section, sum(price * Sales_Volume)
from updated_zara
group by Seasonal, section

-- 18. What is the average price and revnue of products in different sections and product positions? (Product Position, Section, Price)


select Product_Position, section, avg(price) as AvgPrice
from updated_zara
group by Product_Position, section
order by sum(price * Sales_Volume) desc

select Product_Position, section, sum(price * Sales_Volume) as TotalRevenue
from updated_zara
group by Product_Position, section
order by sum(price * Sales_Volume) desc