## Exercises: Querying a table

USE Chinook;

/* 
1. Select the top 10 rows (all columns) from the Track table
*/

SELECT *
FROM Track
LIMIT 10;

/* 
2. Select the top 10 rows from the Track table, but only the attributes
	"Name", "Composer", "Milliseconds"
*/

SELECT 
	Name,
	Composer,
    Milliseconds
FROM 
	Track 
LIMIT 10;

/* 
3. What are the 5 longest tracks stored in the Track table, by "Milliseconds"?
4. What are the 5 largest tracks stored in the Track table, by "Bytes"?
5. What about the 5 shortest / smallest tracks?
*/

SELECT 
	*
FROM
	Track
ORDER BY Milliseconds DESC
LIMIT 5;

SELECT 
	*
FROM
	Track
ORDER BY Bytes DESC
LIMIT 5;

SELECT 
	*
FROM
	Track
ORDER BY Milliseconds ASC
LIMIT 5;

SELECT 
	*
FROM
	Track
ORDER BY Bytes ASC
LIMIT 5;

/*
6. Who composed the song with the name "Overdose"?
*/

SELECT * 
FROM Track
WHERE Name = 'Overdose';


/* 
7. What are the different (unique) MediaTypeIds found in the Track table? 
*/

SELECT
	DISTINCT MediaTypeId
FROM 
	Track;

/* 
8. Find all tracks composed by 'U2' that are between 100,000 and 300,000 ms 
*/

SELECT * FROM Track 
WHERE Composer = 'U2' 
AND Milliseconds BETWEEN 100000 AND 300000;

/* 
9. Find all tracks that have the word "Angel" in the title 
*/

SELECT * FROM Track
WHERE Name LIKE '%Angel%';

/* 
10. Find all tracks composed by either Ludwig van Beethoven, Woflgang Amadeus Mozart, or Johann Sebastian Bach 
*/

SELECT * 
FROM Track
WHERE Composer IN ('Ludwig van Beethoven','Wolfgang Amadeus Mozart','Johann Sebastian Bach');

/* 
11. For each track by Beethoven, calculate the Price per millisecond and return it as a new column called "PricePerMillisecond" 
*/

SELECT *, UnitPrice / Milliseconds AS PricePerMillisecond
FROM Track
WHERE Composer = 'Ludwig van Beethoven';

/* 
12. Find the least expensive track in terms of price per millisecond, and return the PricePerMillisecond 
*/

SELECT 
	*, 
	CAST(UnitPrice AS DECIMAL(30,15)) / Milliseconds AS PricePerMillisecond
FROM Track
ORDER BY PricePerMillisecond
LIMIT 1;
