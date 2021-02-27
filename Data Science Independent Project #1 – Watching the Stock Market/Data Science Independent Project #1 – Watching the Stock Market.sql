/* What are the distinct stocks in the table? */
SELECT DISTINCT name, symbol
FROM stocks;

/* Query all data for a single stock. Do you notice any overall trends? */
SELECT * FROM stocks
WHERE symbol = 'GM';
/* The stock has been on a slight downward trend from rougly $56 at the start of the period, to $51 at the end. 
GM announced its Q4 2020 earnings on February 10th, 2021 and easily beat Wall Street expectations, however, despite this better-than-expected performance, stock price fell immediately following the announcement.
This was because of the warning issued by the company that 2021 earnings could fall by $1.5 Billion to $2 Billion on the back of a global semiconductor chip shortage that will affect production. 
Since stock prices reflect investors sentiment about the FUTURE performance of a company, this fall in share price before actual earnings are announced for 2021 were to be expected. */

/* Which rows have a price above 100? */
SELECT * FROM stocks
WHERE price > '100';
-- Microsoft's stock has a price that has been well above the $100 mark for the entire period. --

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

SELECT name, MAX(price) FROM stocks;


                                                                          	/* Intermediate Challenge */

/* Explore using aggregate functions to look at key statistics about the data (e.g., min, max, average). */			

SELECT AVG(price) FROM stocks;		
    -- The average of all prices is $93.88. -- 
    
SELECT COUNT(price) FROM stocks;					
    -- There are 150 entries in the 'stocks' table. -- 

SELECT SUM(price) FROM stocks;


/* Group the data by stock and repeat. How do the stocks compare to each other? */
SELECT name, AVG (price) FROM stocks GROUP BY name;
/*  As predicted, Microsoft's average price is highest since it has the highest prices off al companies on the list. 
Bank of America has the lowest average price since its prices are the lowest in the table/. */
SELECT name, COUNT(price) FROM stocks GROUP BY name;
SELECT name, SUM(price) FROM stocks GROUP BY name;
SELECT name, MAX(price) FROM stocks GROUP BY name;
SELECT name, MIN(price) FROM stocks GROUP BY name;


/* Group the data by day or hour of day. Does day of week or time of day impact prices? */

-- at closing: --
SELECT name, price FROM stocks WHERE datetime LIKE '% 16:00:00' GROUP BY name; 
-- This SQL statement selects the daily closing price for each of the five stocks 

