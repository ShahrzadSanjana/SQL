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


