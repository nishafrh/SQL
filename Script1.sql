CREATE TABLE test (test_colomn int);

ALTER TABLE test ADD test2_column varchar(255);

ALTER TABLE public.test RENAME COLUMN test_colomn TO test_column;

DROP TABLE test;

CREATE TABLE band (band_name varchar (20));
ALTER TABLE public.band ADD band_id int NOT NULL;
ALTER TABLE public.band ALTER COLUMN band_name SET NOT NULL;
ALTER TABLE public.band DROP COLUMN band_id;
ALTER TABLE public.band DROP COLUMN band_name;
DROP TABLE band;

CREATE TABLE bands (
id_band serial NOT NULL PRIMARY KEY,
name_band varchar(20) NOT NULL
);

CREATE TABLE albums (
id_album serial PRIMARY KEY,
name_album varchar(50) NOT NULL,
release_year int,id_of_band int NOT NULL REFERENCES bands (id_band)
);

INSERT INTO bands (name_band)
VALUES ('BLACKPINK'), ('Arctic Monkeys'), ('5SOS'), ('The Rose');

SELECT * FROM bands;
SELECT * FROM bands LIMIT 2;
SELECT name_band FROM bands;
SELECT id_band AS "Band ID", name_band AS "Band Name" FROM bands;
SELECT name_band AS "Band Name" FROM bands;
SELECT name_band AS "Band Name" FROM bands LIMIT 2;
SELECT id_band AS "Band ID", name_band AS "Band Name" FROM bands ORDER BY name_band;
SELECT id_band AS "Band ID", name_band AS "Band Name" FROM bands ORDER BY name_band LIMIT 2;
SELECT id_band AS "Band ID", name_band AS "Band Name" FROM bands ORDER BY name_band ASC LIMIT 2;
SELECT id_band AS "Band ID", name_band AS "Band Name" FROM bands ORDER BY name_band DESC LIMIT 2;

INSERT INTO albums (id_of_band, name_album, release_year)
VALUES (1, 'BORN PINK', 2022), 
(1, 'THE ALBUM', 2020),
(2, 'AM', 2013),
(3, 'Calm', 2020),
(4, 'Void', NULL);

SELECT * FROM albums;
SELECT DISTINCT name_album, * FROM albums WHERE name_album LIKE '%al%';
SELECT DISTINCT name_album, * FROM albums WHERE name_album LIKE '%al%' OR name_album LIKE '%AL%';
SELECT * FROM albums WHERE name_album LIKE '%al%' OR id_of_band = 1;
SELECT * FROM albums WHERE name_album LIKE '%al%' OR name_album LIKE '%AL%' AND release_year = 2020;
SELECT * FROM ALBUMS WHERE release_year > 2020;
SELECT * FROM ALBUMS WHERE release_year >= 2020;
SELECT * FROM ALBUMS WHERE release_year BETWEEN 2015 AND 2023;
SELECT * FROM ALBUMS WHERE release_year IS NULL;

'DELETE FROM albums' 'WILL DELETE ALL ROWS'

DELETE FROM albums WHERE release_year IS NULL;

UPDATE albums SET release_year = NULL WHERE id_album = 4;

SELECT * FROM bands 
JOIN albums
ON bands.id_band = albums.id_of_band;

SELECT * FROM bands 
INNER JOIN albums
ON bands.id_band = albums.id_of_band;

SELECT * FROM bands 
LEFT JOIN albums
ON bands.id_band = albums.id_of_band;

INSERT INTO albums (name_album, release_year, id_of_band) VALUES ('Unknown', NULL, 2);
'UPDATE albums SET id_of_band = NULL WHERE name_album = 'Unknown'; -> ERROR'
DELETE FROM albums WHERE name_album = 'Unknown';

SELECT * FROM bands 
RIGHT JOIN albums
ON bands.id_band = albums.id_of_band;

SELECT * FROM albums 
RIGHT JOIN bands
ON bands.id_band = albums.id_of_band;


SELECT avg (release_year) FROM albums; 
SELECT sum (release_year) FROM albums; 

SELECT id_of_band, count (id_of_band) FROM albums
GROUP BY id_of_band ORDER BY id_of_band;

SELECT release_year, count (release_year) FROM albums
GROUP BY release_year;

SELECT name_album, count (name_album) FROM albums
GROUP BY name_album;


SELECT b.name_band AS "Band Name", count (a.id_album) AS "Number of Albums"
FROM bands AS b 
LEFT JOIN albums AS a ON a.id_of_band = b.id_band  
GROUP BY ("Band Name");

SELECT b.name_band AS Band_Name, count (a.id_of_band) AS "Number of Albums"
FROM bands AS b 
LEFT JOIN albums AS a ON a.id_of_band = b.id_band  
GROUP BY (Band_Name);

SELECT b.name_band AS Band_Name, count (a.id_of_band) AS "Number of Albums"
FROM bands AS b 
LEFT JOIN albums AS a ON a.id_of_band = b.id_band  
WHERE a.id_of_band = 2
GROUP BY (Band_Name);

SELECT b.name_band AS "Band Name", COUNT(a.id_album) AS "Number of Albums"
FROM bands AS b 
LEFT JOIN albums AS a ON a.id_of_band = b.id_band  
GROUP BY b.name_band
HAVING COUNT(a.id_album) = 2;





