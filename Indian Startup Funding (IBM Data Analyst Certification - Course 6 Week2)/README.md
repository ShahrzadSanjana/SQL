# Indian Startup Funding 

-- 1. Write SQL query to find AmountinUSD, where City location equals “Bengaluru”
```sql 
SELECT AmountinUSD, CityLocation
FROM indian_startup_funding
WHERE CityLocation = "Bengaluru";
```

-- 2. Write SQL query to sort the table by startup name DESC
```sql 
SELECT *
FROM indian_startup_funding
ORDER BY StartupName DESC;
```

-- 3. Write SQL query to find AmountinUSD, where City location equals “Bengaluru” and AmountinUSD>380000
```sql SELECT AmountinUSD, CityLocation
FROM indian_startup_funding
WHERE CityLocation = "Bengaluru" AND AmountinUSD>"380000";
```

-- 4. Write SQL query to get all CityLocations that has an AmountinUSD >380000
```sql
SELECT CityLocation, AmountinUSD
FROM indian_startup_funding
WHERE AmountinUSD > "380000"
ORDER BY CityLocation ASC;
```

-- 5. Write SQL query to get only unique CityLocations that has an AmountinUSD >380000
```sql
SELECT DISTINCT(CityLocation)
FROM indian_startup_funding
WHERE AmountinUSD > "380000"
ORDER BY CityLocation ASC;
```
-- 6. Write SQL query to get all StartupNames where AmountinUSD<380000
```sql SELECT StartupName, AmountinUSD
FROM indian_startup_funding
WHERE AmountinUSD > "380000"
ORDER BY StartupName ASC;
```

--7. Write SQL query to sort the output from the previous question DESC
```sql
SELECT StartupName, AmountinUSD
FROM indian_startup_funding
WHERE AmountinUSD > "380000"
ORDER BY StartupName ASC, AmountinUSD ASC;
```

/* 8. Write SQL query to get the funding AmountinUSD for each IndustryVertical that starts with 
letter “A” and sort the output DESC by the AmountinUSD */
```sql
SELECT IndustryVertical, SUM(AmountinUSD)
FROM indian_startup_funding
WHERE IndustryVertical LIKE "A%"
GROUP BY IndustryVertical
ORDER BY AmountinUSD DESC;

or,

SELECT SUM(AmountinUSD)
FROM indian_startup_funding
WHERE IndustryVertical = "Automobile";
```
-- 9. Write SQL query to count all the start_ups in the Education field
```sql
SELECT IndustryVertical, COUNT(DISTINCT(StartupName))
FROM indian_startup_funding
WHERE IndustryVertical = "Education";
```

-- 10. Write SQL query to count all the start_Ups in the E-Commerce field
```sql
SELECT IndustryVertical, COUNT(DISTINCT(StartupName))
FROM indian_startup_funding
WHERE IndustryVertical LIKE "E-_ommerce";
```

-- 11. Write SQL query to count all the start_Ups in the E-Commerce field, where city location equals “Bengaluru”
```sql
SELECT IndustryVertical, COUNT(DISTINCT(StartupName))
FROM indian_startup_funding
WHERE IndustryVertical LIKE "E-_ommerce" AND CityLocation LIKE "Bengaluru%";
```
