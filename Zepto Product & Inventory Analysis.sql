Create Database Zepto;

use zepto;

-- Data
select * from zepto;

-- Count of rows
select count(*) from zepto;

-- null values 
SELECT * FROM zepto 
WHERE Category IS NULL 
   OR name IS NULL 
   OR mrp IS NULL 
   OR discountPercent IS NULL 
   OR availableQuantity IS NULL 
   OR discountedSellingPrice IS NULL 
   OR weightInGms IS NULL 
   OR outOfStock IS NULL 
   OR quantity IS NULL;

-- different product Categories 
select distinct category
from zepto
order by category;

-- products in stock vs out of stock 
select outofstock, count(outofstock)
from zepto
group by outofstock;

-- product names present multiple times
select name, count(name) as "Number of SKU's"
from zepto
group by name
having count(name)>1
order by count(name) desc;


-- data cleaning 
-- products with price = 0
select * from zepto
where mrp= 0 or discountedsellingprice = 0;

delete from zepto
where mrp = 0;

-- convert paise to rupees
Update zepto
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;

select mrp,discountedSellingPrice from zepto;

-- Q1. Find the top 10 best-value products based on the discount percentage.
 select distinct name, mrp, discountPercent
 From zepto
 order by discountPercent desc
 limit 10;
 
 -- Q2. What are the Products with high Mrp but out of stock.
 Select distinct name,mrp
 from zepto 
 where outOfStock = "TRUE" and mrp > 300
 order by mrp desc;
 
 -- Q3. Find all products whose available stock is below the average stock of all products.
SELECT name, availableQuantity
FROM zepto
WHERE availableQuantity < (SELECT AVG(availableQuantity) FROM zepto)
ORDER BY availableQuantity asc;

-- Q4. Find the highest-priced product in each category
SELECT name, category, mrp
FROM (
    SELECT 
        name,
        category,
        mrp,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY mrp DESC) AS rn
    FROM zepto
) AS ranked
WHERE rn = 1;

-- Q5.Calculate Estimated Revenue for each Category
Select category,
sum(discountedSellingPrice * availableQuantity) as total_revenue
from zepto
group by category 
order by total_revenue;

-- Q6.Find all products  where mrp is greater than 500 and discount is less than 10%.
select distinct name, mrp, discountPercent
from zepto
where mrp > 500 AND discountPercent < 10
order by mrp desc, discountPercent desc;

-- Q7. Identify the top 5 categories offering the highest average discount percentage
select category,
Round(Avg(discountPercent),2) As avg_discount
from zepto 
group by category 
order by avg_discount desc
limit 5;

-- Q8. Find the price per gram for products above 100g and sort by best value.
select name, weightInGms,discountedSellingPrice,
Round(discountedSellingPrice/weightInGms,2) As Price_per_gram
from zepto 
where weightInGms >= 100
order by price_per_gram;

-- Q9. Group the products into categories like low, Medium, Bulk.
Select Distinct name, weightInGms,
Case when weightInGms < 1000 then 'Low'
     when weightInGms < 5000 then 'Medium'
     else 'Bulk'
     End as weight_category
from zepto;

-- Q10. What is the total Inventory Weight per Category
Select category,
SUM(weightInGms * availableQuantity) as total_weight
from zepto
Group by category
order by total_weight;

