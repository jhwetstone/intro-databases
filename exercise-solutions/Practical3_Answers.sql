## Exercises: JOINS

/*
1. Find all albums by Queen. Your result set should have the columns: "AlbumID, Title, ArtistName"
*/

SELECT
	AlbumID,
    Title,
    Name AS ArtistName
FROM
	Album
		INNER JOIN
	Artist
		ON Album.ArtistId = Artist.ArtistId
WHERE
	Artist.Name = 'Queen';
    
/* 
2.  Calculate the number of tracks per Genre in the Track table, and order the results by number of tracks descending. Your result set should have the columns: "GenreName, NumberOfTracks"
*/

SELECT
	Genre.Name AS GenreName,
    COUNT(*) AS NumberOfTracks
FROM
	Track
		LEFT OUTER JOIN
	Genre
		ON Track.GenreId = Genre.GenreId
GROUP BY
	GenreName
ORDER BY NumberOfTracks DESC;

/*
3. Are there any albums in the tracks table with tracks from more than one genre? 
	>> If there are, which albums? Your result set should have the columns "AlbumId, Title, NumGenres"
*/
SELECT
	Album.AlbumId,
    Album.Title,
    COUNT(DISTINCT GenreId) AS NumGenres
FROM
	Track
		INNER JOIN
	Album
		ON Track.AlbumId = Album.AlbumId
GROUP BY
	AlbumId,
    Album.Title
HAVING
	COUNT(DISTINCT GenreId) > 1;

/* 
4. How many Tracks are composed by the album's artist? Why is this a hard question to answer (i.e. why might your results not be completely right)? 
	HARD: Can you make your result more accurate? Hint: Use "LIKE" and google the string function CONCAT()
*/

SELECT 
	COUNT(*)  
FROM
	Track
		INNER JOIN
	Album
		ON Album.AlbumId = Track.AlbumId
        INNER JOIN
	Artist
		ON Album.ArtistId = Artist.ArtistId
WHERE
	Composer LIKE CONCAT('%',Artist.Name,'%');
	
/* 
5. Take a look at the contents of the Employees table.  Who has the most direct reports? The columns in your result set should be "EmployeeId, LastName, FirstName, Title, NumberOfReports"
	HINT: You are allowed to join a table to itself
*/
SELECT 
	mgr.EmployeeId,
    mgr.LastName,
    mgr.FirstName,
    mgr.Title,
    COUNT(*) AS NumberOfReports
FROM
	Employee emp
		INNER JOIN
	Employee mgr
		ON emp.ReportsTo = mgr.EmployeeId
GROUP BY
	mgr.EmployeeId,
    mgr.LastName,
    mgr.FirstName,
    mgr.Title
ORDER BY
	NumberOfReports DESC;

/* 
6. Using the Invoice table, calculate the Total Billed amount for each month in 2013.
	HINT: You might find the functions MONTH() and YEAR() helpful
*/

SELECT 
	MONTH(InvoiceDate) AS InvoiceMonth,
    SUM(Total) AS TotalBilled
FROM
	Invoice
WHERE
	    YEAR(InvoiceDate) = 2013
GROUP BY
	InvoiceMonth
ORDER BY
	 InvoiceMonth ASC;
     
/*
7. Using the InvoiceLine and Track tables, find the top 5 best-selling tracks of all time, by quantity sold. Return the TrackName, AlbumTitle, TotalSales, and TotalQuantity. Break ties by ordering by TrackName DESC
*/

SELECT
	T.Name AS TrackName,
    A.Title AS AlbumTitle,
    SUM(L.UnitPrice * L.Quantity) AS TotalSales,
    SUM(L.Quantity) AS TotalQuantity
FROM
	InvoiceLine L
		LEFT OUTER JOIN
	Track T
		ON L.TrackId = T.TrackId
        LEFT OUTER JOIN
	Album A
		ON T.AlbumId = A.AlbumId
GROUP BY
	TrackName, AlbumTitle
ORDER BY
	TotalQuantity DESC, TrackName DESC
LIMIT 5;

/*
8. Think of another interesting query to run over these tables using JOINS, and report back the query and your results to the rest of the group.
*/
        