                                              /* https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial */
                                              
/* This tutorial looks at how SELECT within SELECT statementsare used in performing more complex queries. */


/* 1) List each country name where the population is larger than that of 'Russia'. 
world(name, continent, area, population, gdp) */

SELECT name FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Russia');


/* 2) Show the countries in Europe with a per capita GDP greater than 'United Kingdom'. HINT: The per capita GDP is the gdp/population */

SELECT name
FROM world
WHERE continent = 'Europe' AND gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom');


/* 3) List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country. */

SELECT name, continent 
FROM world 
WHERE continent IN (SELECT continent FROM world WHERE name = 'Argentina' OR name = 'Australia')
ORDER BY name;

/* 4) Which country has a population that is more than Canada but less than Poland? Show the name and the population. */

SELECT name, population
FROM world
WHERE population < (SELECT population FROM world WHERE name = 'Poland') AND population > (SELECT population FROM world WHERE name = 'Canada');


/* 5) Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany. */

SELECT name, CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name = 'Germany'),0),'%')
FROM world
WHERE continent = 'Europe';


/* 6) Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values) */

SELECT name
FROM world
WHERE gdp > (SELECT MAX (gdp) FROM world WHERE continent = 'EUROPE' AND gdp IS NOT NULL);


/* 7) Find the largest country (by area) in each continent, show the continent, the name and the area */

SELECT continent, name, area FROM world as x
WHERE area >= ALL
(SELECT area FROM world as y
WHERE x.continent=y.continent
AND area>0);




                                                /* https://sqlzoo.net/wiki/Using_nested_SELECT */

/* 1) List each country in the same continent as 'Brazil'. */

SELECT name 
FROM world
WHERE continent IN (SELECT continent FROM world WHERE name = 'Brazil');


/* 2) List each country and its continent in the same continent as 'Brazil' or 'Mexico'. */

SELECT name, continent
FROM world
WHERE continent IN (SELECT continent FROM world WHERE name = 'Brazil' OR name = 'Mexico');


/* 3) Show the population of China as a multiple of the population of the United Kingdom */

SELECT name, population/(SELECT population FROM world
WHERE name='United Kingdom') AS multiple_of_UK_population
FROM world
WHERE name = 'China';


/* 4) Show each country that has a population greater than the population of ALL countries in Europe. Note that we mean greater than every single country in Europe; not the combined population of Europe.*/

SELECT name, population
FROM world 
WHERE population > ALL (SELECT population FROM world WHERE continent = 'Europe');
