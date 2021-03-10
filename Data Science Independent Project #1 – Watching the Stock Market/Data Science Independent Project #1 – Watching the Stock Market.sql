/* What are the distinct stocks in the table? */
SELECT DISTINCT name, symbol
FROM stocks;

/* Query all data for a single stock. Do you notice any overall trends? */
SELECT * FROM stocks
WHERE symbol = 'GM';
/* The stock has been on a slight downward trend from rougly $56 at the start of the period, to $51 at the end. 
GM announced its Q4 2020 earnings on February 10th, 2021 and easily beat Wall Street expectations, however, despite this better-than-expected performance, stock price fell immediately following the announcement.
This was because of the warning issued by the company that 2021 earnings could fall by $1.5 Billion to $2 Billion on the back of a global semiconductor chip shortage that will affect production. 
Since stock prices reflect investors sentiment about the FUTURE performance of a company, this fall in share price before actual earnings are announced for 2021 was to be expected. */

/* Which rows have a price above 100? */
SELECT * FROM stocks
WHERE price > '100';
-- Microsoft's stock price has been well above the $100 mark throughout the entire period. --

/* between 40 to 50, etc? */
SELECT * FROM stocks
WHERE price BETWEEN '40' AND '50';
/* Kohl's Corporation's stock dips just below the $50 mark at the close of trading on February 9th, 2021, and hovers a few cents above and below that mark for most of the next few days until the 18th, where it trades in the $48-$49 range.
 It rebounds quickly above $50 again from the 19th onwads and even trades as high as $56 on the 22nd. */

/* Sort the table by price. What are the minimum and maximum prices? */
SELECT * FROM stocks
ORDER BY price DESC;
-- Microsoft achieved the highest stock price of any company on the list at $244.99 on February 12th, and Bank of America Corp. had the lowest of $32.72 on the 11th. --

SELECT name, MIN(price) FROM stocks;
/* Bank of America has the lowest share price in the data at $32.72 recorded on Febrauary 11th at 12:00PM. */

SELECT name, MAX(price) FROM stocks;
/* Microsoft has the highest share price at $244.99 recorded on February 12th at 16:00PM. */  

                                                                          	/* Intermediate Challenge */

/* Explore using aggregate functions to look at key statistics about the data (e.g., min, max, average). */			

SELECT AVG(price) FROM stocks;		
    -- The average of all prices is $93.88. -- 
    
SELECT COUNT(price) FROM stocks;					
    -- There are 150 entries in the data. -- 

SELECT SUM(price) FROM stocks;


/* Group the data by stock and repeat. How do the stocks compare to each other? */

SELECT name, AVG (price) FROM stocks GROUP BY name;
/*  As predicted, Microsoft's average price is highest since it has the highest prices off all companies on the list. 
Bank of America has the lowest average price since its prices are the lowest in the table for the period. */

SELECT name, COUNT(price) FROM stocks GROUP BY name;
/* There are 150 stocks and accompanying prices in the data. */

SELECT name, SUM(price) FROM stocks GROUP BY name;
/* Bank of America's stock has the lowest sum of share prices at $1020.1, whilst Microsoft has the highest for the period, $7233.92. */ 

SELECT name, MAX(price) FROM stocks GROUP BY name;
/* This syntax finds the highest price for EACH stock in the data. Microsoft's highest share price is higher than that of the other stocks. */

SELECT name, MIN(price) FROM stocks GROUP BY name;
/* This syntax finds the lowest price for EACH stock in the data. Bank of America's lowest share price is lower than that of the other stocks. */


/* Group the data by day or hour of day. Does day of week or time of day impact prices? */

-- at closing: --

SELECT name, datetime, price FROM stocks WHERE datetime LIKE '% 16:00:00' GROUP BY name;

-- or, find the daily average of all prices for each stock (more tedious than the above) --
SELECT name, datetime, AVG(price) FROM stocks WHERE datetime LIKE '2021-02-09, %' GROUP BY name;
SELECT name, datetime, AVG(price) FROM stocks WHERE datetime LIKE '2021-02-17, %' GROUP BY name;	
SELECT name, datetime, AVG(price) FROM stocks WHERE datetime LIKE '2021-02-23, %' GROUP BY name;	


-- By hour of the day --

SELECT name, datetime, price FROM stocks WHERE datetime LIKE '% 9:00:00' GROUP BY name;
SELECT name, datetime, price FROM stocks WHERE datetime LIKE '% 12:00:00' GROUP BY name;
SELECT name, datetime, price FROM stocks WHERE datetime LIKE '% 16:00:00' GROUP BY name;

/* From the result set of the previous three lines of code, average stock prices for 3 of the 5 stocks (AMD, BAC, MSFT) falls from the beginning of trading to 12:00:00. 
GM's and KSS's prices both rise during this same period, on average. Between 12:00:00 and 16:00:00, AMD, BAC, and MSFT increase back to, or even exceed their opening trading price. 
GM and KSS continue with their upward momentum from earlier in the day during this period. */ 


/* Which of the rows have a price greater than the average of all prices in the dataset? */

SELECT * FROM stocks
WHERE price > (SELECT AVG(price) FROM stocks);
-- Only Microsoft's stock prices during the period were above the average of all prices in the dataset. -- 

                                                                          /* Advanced Challenge */

/* In addition to the built-in aggregate functions, explore ways to calculate other key statistics about the data, such as the median or variance. */

-- Median --
SELECT AVG(price) 
FROM (SELECT price
FROM stocks
ORDER BY price
LIMIT 2
OFFSET (SELECT (COUNT(*) -1) / 2 FROM stocks));

-- Variance --
SELECT (SUM(price*price) - ((SUM(price)*SUM(price))/COUNT(*))) / (COUNT(*) -1) AS [Price Variance] FROM stocks;
        

/* Let’s refactor the data into 2 tables - stock_info to store general info about the stock itself (ie. symbol, name) and stock_prices to store the collected data on price (ie. symbol, datetime, price).
Hint: You can use the SQL CREATE TABLE AS statement to create a table by copying the columns of an existing table. 
Don’t forget to also drop certain columns from the original table and rename it. */              
                                                          
CREATE TABLE stock_info AS 
SELECT symbol, name
FROM stocks;

ALTER TABLE stocks RENAME TO stock_prices;

ALTER TABLE stock_prices DROP COLUMN name;                                                           
                                                          
/* Now, we do not need to repeat both symbol and name for each row of price data. Instead, join the 2 tables in order to view more information on the stock with each row of price. */
                                                          
SELECT stock_prices.id, stock_info.symbol, stock_prices.datetime, stock_prices.price
FROM stock_info
JOIN stock_prices
ON stock_info.id = stock_prices.id;
                                                          
                                                          
/* Add more variables to the stock_info table and update the data (e.g., sector, industry, etc). */

ALTER TABLE stock_info ADD COLUMN industry TEXT;

UPDATE stock_info 
SET industry = 'Automotive'
WHERE symbol = 'GM'


UPDATE stock_info
SET industry = 'Technology'
WHERE symbol = 'MSFT';

UPDATE stock_info
SET industry = 'Banking/Finance'
WHERE symbol = 'BAC';

UPDATE stock_info
SET industry = 'Semiconductors'
WHERE symbol = 'AMD';                                                        
                                                              -- END. --
