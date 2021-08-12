-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.

SELECT * FROM invoice
JOIN invoice_line
ON invoice.invoice_id = invoice_line.invoice_id
WHERE invoice_line.unit_price > .99;

-- Get the invoice_date, customer first_name and last_name, and total from all invoices.

SELECT i.invoice_date, c.first_name, c.last_name, i.total
FROM invoice i
JOIN customer c
ON i.customer_id = c.customer_id;

-- Get the customer first_name and last_name and the support rep’s first_name and last_name from all customers.
-- Support reps are on the employee table.

SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer c
Join employee e
ON c.support_rep_id = e.employee_id;

-- Get the album title and the artist name from all albums.

SELECT al.title, ar.name
FROM album al
JOIN artist ar
ON al.artist_id = ar.artist_id;

-- Get all playlist_track track_ids where the playlist name is Music.

SELECT pt.track_id, pl.name
FROM playlist_track pt
JOIN playlist pl
ON pt.playlist_id = pl.playlist_id
WHERE pl.name = 'Music';

-- Get all track name`s for `playlist_id.

SELECT tr.name, pl.playlist_id
FROM track tr
JOIN playlist_track pl
ON tr.track_id = pl.track_id
WHERE pl.playlist_id = 1;

-- Get all track name`s and the playlist `name that they’re on ( 2 joins ).

SELECT tr.name "Track name", pl.name "Playlist"
FROM track tr
JOIN playlist_track plt
ON tr.track_id = plt.track_id
JOIN playlist pl
ON plt.playlist_id = pl.playlist_id;

-- Get all track name`s and album `title`s that are the genre `Alternative & Punk ( 2 joins ).

SELECT tr.name, al.title
FROM track tr
JOIN genre g
ON tr.genre_id = g.genre_id
JOIN album al
ON tr.album_id = al.album_id
WHERE g.name = 'Alternative & Punk';