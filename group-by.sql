-- Find a count of how many tracks there are per genre. Display the genre name with the count.

SELECT COUNT(*), g.name
FROM track t
JOIN genre g
ON t.genre_id = g.genre_id
GROUP BY g.name;

-- Find a count of how many tracks are the “Pop” genre and how many tracks are the “Rock” genre.

SELECT COUNT(*), g.name
FROM track t
JOIN genre g
ON t.genre_id = g.genre_id
WHERE g.name = 'Pop' OR g.name = 'Rock'
GROUP BY g.name;

-- Find a list of all artists and how many albums they have.

SELECT a.name AS "Artist Name", COUNT(*) AS "# of albums"
FROM album al
JOIN artist a
ON al.artist_id = a.artist_id
GROUP BY a.name
ORDER BY a.name; -- Xtra sauce to make the result look better