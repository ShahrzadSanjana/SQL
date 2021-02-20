-- https://www.w3resource.com/sql-exercises/sql-wildcard-special-operators.php --

CREATE TABLE salesman (salesman_id INTEGER, name text, city text, commission decimal (4,1));

INSERT INTO salesman Value (5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

SELECT 
    *
FROM
    salesman;
    

    AlTER TABLE salesman
    modify commission DECIMAL (4, 2);
    
    
    /* 1. Write a SQL statement to display all the information of all salesmen.  */
SELECT * FROM salesman;



/* 2. Write a SQL statement to find those salesmen with all information who come from the city either Paris or Rome. */

SELECT * 
FROM salesman
Where city = 'Paris' OR city ='Rome';           

/*3. Write a query to filter those salesmen with all information who comes from any of the cities Paris and Rome.*/  

SELECT *
FROM salesman
Where city IN ('Paris', 'Rome');

/* 4. Write a query to produce a list of salesman_id, name, city and commission of each salesman who live in cities other than Paris and Rome.  */

SELECT *
FROM salesman
WHERE city NOT IN ('Paris', 'Rome');
                                                                                      
                                                                                      
/*5. Write a SQL statement to find those salesmen with all information who gets the commission within a range of 0.12 and 0.14.*/

SELECT *
FROM salesman
WHERE commission BETWEEN '0.12' AND '0.14';

/*6. Write a SQL statement to find those salesmen with all other information and name started with any letter within 'A' and 'K'.*/

SELECT *
FROM salesman
WHERE name BETWEEN 'A%' AND 'K%';


/* 7. Write a SQL statement to find those salesmen with all other information and name started with other than any latter within 'A' and 'L'.*/

SELECT *
FROM salesman
WHERE name NOT BETWEEN  'A%' AND 'L%';


/*8. Write a SQL statement to find those salesmen with all information whose name containing the 1st character is 'N' and the 4th character is 'l' and rests may be any character.  */

SELECT *
FROM salesman
WHERE name LIKE 'N__l %';

