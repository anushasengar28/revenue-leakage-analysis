CREATE DATABASE project3;

ALTER TABLE `sample - superstore`RENAME TO orders;
SELECT * FROM ORDERS LIMIT 10;
SELECT COUNT(*) FROM ORDERS;
SELECT COUNT(*) AS TOTAL_ROWS,
 COUNT(profit) AS profit_count,
  COUNT(discount) AS discount_count
FROM orders;
SELECT sum(SALES) AS TOTAL_SALES,
SUM(PROFIT) AS TOTAL_PROFIT,
ROUND(SUM(profit)/SUM(sales)*100,2) AS profit_margin
FROM orders;

SELECT *
FROM orders
WHERE profit < 0;

SELECT CATEGORY, COUNT(*) AS TOTAL_LOSS_ORDERS FROM ORDERS WHERE PROFIT<0 GROUP BY CATEGORY order by TOTAL_LOSS_ORDERS DESC;
SELECT 
  category,
  COUNT(*) AS loss_orders,
  SUM(profit) AS total_loss
FROM orders
WHERE profit < 0
GROUP BY category
ORDER BY total_loss ASC;



SELECT 
  CASE 
    WHEN discount <= 0.2 THEN '0-20%'
    WHEN discount <= 0.5 THEN '20-50%'
    ELSE '50%+'
  END AS discount_range,
  COUNT(*) AS orders,
  ROUND(SUM(profit),2) AS total_profit
FROM orders
GROUP BY discount_range
ORDER BY discount_range;


SELECT 
  category,
  CASE 
    WHEN discount <= 0.2 THEN '0-20%'
    WHEN discount <= 0.5 THEN '20-50%'
    ELSE '50%+'
  END AS discount_range,
  ROUND(SUM(profit),2) AS total_profit
FROM orders
GROUP BY category, discount_range
ORDER BY category, discount_range;


SELECT 
  customer_name,
  ROUND(SUM(profit),2) AS total_profit
FROM orders
GROUP BY customer_name
ORDER BY total_profit ASC
LIMIT 10;

SELECT 
  `Customer Name`,
  ROUND(SUM(profit),2) AS total_profit
FROM orders
GROUP BY `Customer Name`
ORDER BY total_profit ASC
LIMIT 10;