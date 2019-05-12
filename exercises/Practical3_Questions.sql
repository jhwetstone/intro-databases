## Exercises: JOINS

/*
1. Find all albums by Queen. Your result set should have the columns: "AlbumID, Title, ArtistName"
*/





    
/* 
2.  Calculate the number of tracks per Genre in the Track table, and order the results by number of tracks descending. Your result set should have the columns: "GenreName, NumberOfTracks"
*/





/*
3. Are there any albums in the tracks table with tracks from more than one genre? 
	>> If there are, which albums? Your result set should have the columns "AlbumId, Title, NumGenres"
*/




/* 
4. How many Tracks are composed by the album's artist? Why is this a hard question to answer (i.e. why might your results not be completely right)? 
	HARD: Can you make your result more accurate? Hint: Use "LIKE" and google the string function CONCAT()
*/




	
/* 
5. Take a look at the contents of the Employees table.  Who has the most direct reports? The columns in your result set should be "EmployeeId, LastName, FirstName, Title, NumberOfReports"
	HINT: You are allowed to join a table to itself
*/





/* 
6. Using the Invoice table, calculate the Total Billed amount for each month in 2013.
	HINT: You might find the functions MONTH() and YEAR() helpful
*/




     
/*
7. Using the InvoiceLine and Track tables, find the top 5 best-selling tracks of all time, by quantity sold. Return the TrackName, AlbumTitle, TotalSales, and TotalQuantity. Break ties by ordering by TrackName DESC
*/






/*
8. Think of another interesting query to run over these tables using JOINS, and report back the query and your results to the rest of the group.
*/
        