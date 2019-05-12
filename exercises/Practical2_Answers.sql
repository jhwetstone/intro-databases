## Exercises: Aggregate Queries

/*
1. What is the average length of all tracks in the Track table, in minutes? Call the column "AverageLengthInMinutes"
*/

SELECT 
	AVG(Milliseconds) / (1000  * 60) AS AverageLengthInMinutes
FROM
Track;

/* 
2. What is the average length of all tracks in the Track table in minutes, by media type id? The columns returned by your query should be MediaTypeId, AverageLengthInMinutes
*/

SELECT
	MediaTypeId,
	AVG(Milliseconds) / (1000  * 60) AS AverageLengthInMinutes
FROM
	Track
GROUP BY
	MediaTypeId;
    
/*
3. Look at the media types in the MediaType table. Do they make sense, given what you found above?
*/
SELECT
	* 
FROM
	MediaType;

/* 
4. How many rows in the Track table have "NULL" in the composer field?
*/

SELECT COUNT(*) 
FROM Track
WHERE Composer IS NULL;

/*
5. HARD: What is the percentage of rows in the Track table with "NULL" in the composer field?
    >> HINT: one thing that might come in handy is the syntax CASE WHEN <condition> THEN 1 ELSE 0 END
*/

SELECT
	SUM(CASE WHEN Composer IS NULL THEN 1 ELSE 0 END)/COUNT(*)
FROM
	Track;

/*
6. Which composer has the most albums with tracks in the Track table? 
*/ 

SELECT Composer, COUNT(DISTINCT AlbumId) AS NumAlbums
FROM Track
WHERE Composer IS NOT NULL
GROUP BY Composer
ORDER BY NumAlbums DESC
LIMIT 1;

/*
7. Calculate a histogram of number of tracks per price
*/

SELECT
	UnitPrice,
    COUNT(*)
FROM
	Track
GROUP BY
	UnitPrice;
    
/*
8. Look at the other tables in the database, and run an interesting aggregate query on one of those tables. Report your question and the results back to the group.
*/