-- Create a view called rock that selects all the tracks where the genre is Rock.
CREATE VIEW rock AS
SELECT * FROM track 
WHERE genre_id IN (
    SELECT genre_id FROM genre 
    WHERE name = 'Rock'
);
-- Create a view called classical_count that gets a count of all the tracks from the playlist called Classical.

CREATE VIEW classical_count AS   -- Subquery method
SELECT COUNT(*) FROM track
WHERE track_id IN (
  SELECT track_id FROM playlist_track
	WHERE playlist_id IN (
      SELECT playlist_id FROM playlist
      WHERE name = 'Classical'
    )
  );


CREATE VIEW classical_count AS   -- Join method
SELECT COUNT(*) FROM track t
JOIN playlist_track pt
ON t.track_id = pt.track_id
JOIN playlist p
ON pt.playlist_id = p.playlist_id
WHERE p.name = 'Classical';

