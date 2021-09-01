                                        /* 'Using Null' questions from SQLZoo.net https://sqlzoo.net/wiki/Using_Null */


/* 1) List the teachers who have NULL for their department. */                                        

SELECT name
FROM teacher 
WHERE dept IS NULL;


/* 2) Note the INNER JOIN misses the teachers with no department and the departments with no teacher. */

SELECT teacher.name, dept.name
FROM teacher 
INNER JOIN dept ON teacher.dept = dept.id
WHERE teacher.dept IS NOT NULL; 


/* 3) Use a different JOIN so that all teachers are listed. */

SELECT teacher.name, dept.name
FROM teacher 
FULL JOIN dept ON teacher.dept = dept.id
WHERE teacher.name IS NOT NULL; 


/* 4) Use a different JOIN so that all departments are listed. */

SELECT teacher.name, dept.name
FROM teacher
RIGHT JOIN dept ON teacher.dept=dept.id
WHERE dept.name IS NOT NULL;


/* 5) Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266' */

SELECT name, COALESCE (mobile, '07986 444 2266')
FROM teacher;


/* 6) */



/* 7) Use COUNT to show the number of teachers and the number of mobile phones. */

SELECT COUNT(name) AS No_of_teachers, COUNT(mobile) AS No_of_phone_numbers
FROM teacher
WHERE name IS NOT NULL OR mobile IS NOT NULL;


/* 8) Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed. */

SELECT dept.name, COUNT(teacher.dept)
FROM teacher
RIGHT JOIN dept
ON teacher.dept=dept.id
GROUP BY dept.name
;
 

/* 9) Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise. */

SELECT name, 
CASE WHEN dept= 1 THEN 'Sci'
WHEN dept = 2 THEN 'Sci'
ELSE 'Art'
END AS dept
FROM teacher;


/* 10) Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise. */

SELECT name, 
CASE WHEN dept= 1 THEN 'Sci' 
WHEN dept = 2 THEN 'Sci'
WHEN dept = 3 THEN 'Art'
ELSE 'None'  
END AS dept
FROM teacher; 
