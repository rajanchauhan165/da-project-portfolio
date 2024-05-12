-- 1. senior most employee based on job title. 
SELECT * FROM employee ORDER BY levels DESC;

-- 2. which countries have the most invoices
SELECT i.billing_country AS Billing_Country, COUNT(i.invoice_id) AS Number_Of_Invoice
FROM invoice i
GROUP BY Billing_Country
ORDER BY Number_Of_Invoice DESC
;

-- 3. top 3 values of total invoice
SELECT i.invoice_id as Invoice_ID, ROUND(i.total,1) as Total
FROM invoice i 
ORDER BY Total DESC
LIMIT 3
;

-- 4. Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals.
SELECT i.billing_city as City, ROUND(SUM(i.total),2) as Invoice_Total
FROM invoice i 
GROUP BY City
ORDER BY Invoice_Total DESC LIMIT 1;

-- 5. Write a query that returns the person who has spent the most money.
SELECT c.customer_id AS ID, CONCAT(c.first_name, " ", c.last_name) AS Name, ROUND(SUM(i.total),2) AS Amount
FROM customer c INNER JOIN invoice i ON c.customer_id=i.customer_id
GROUP BY Name
ORDER BY Amount DESC LIMIT 1;

-- Set 2
-- 1. Write query to return the email, first name, last name, & Genre of all Rock Music listeners. Return your list ordered alphabetically.
SELECT c.first_name AS First_Name, c.last_name AS Last_Name, c.email AS Email, g.name AS Genre FROM genre g 
INNER JOIN track t ON t.genre_id=g.genre_id 
INNER JOIN invoice_line i ON t.track_id=i.track_id 
INNER JOIN invoice ON invoice.invoice_id=i.invoice_id 
INNER JOIN customer c ON c.customer_id=invoice.customer_id 
WHERE g.name LIKE "%rock%" GROUP BY First_Name ORDER BY Email;

-- 2. artists who have written the most rock music in our dataset
SELECT a.name AS Artist, COUNT(t.track_id) AS Number_Of_Rock_Musics 
FROM artist a 
INNER JOIN album ON a.artist_id=album.artist_id
INNER JOIN track t ON t.album_id=album.album_id
INNER JOIN genre g ON t.genre_id=g.genre_id
GROUP BY Artist
ORDER BY Number_Of_Rock_Musics DESC LIMIT 5
;

-- 3. Return all the track names that have a song length longer than the average song length. 
SELECT track.name AS Tracks_Longer_Than_Avg, track.milliseconds AS Duration 
FROM track 
WHERE (track.milliseconds) > (SELECT AVG(track.milliseconds) FROM track);

-- Set 3
-- 1. how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent 






