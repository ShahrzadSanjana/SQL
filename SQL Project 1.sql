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

        