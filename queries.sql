-- 2. Select only the Names of all the Bands
USE
    DigiMusic;
    
SELECT NAME
    'Band Name'
FROM
    bands;

-- 3. Select the Oldest Album
SELECT
    a.name,
    a.release_year,
    a.band_id
FROM
    albums a
WHERE
    release_year IS NOT NULL
ORDER BY
    release_year
LIMIT 1;

-- 4. Get all Bands that have Albums
SELECT DISTINCT
    b.name 'Band Name'
FROM
    bands b
JOIN albums a ON
    a.band_id = b.id;

 -- 5. Get all Bands that have No Albums

SELECT DISTINCT
    b.name 'Band Name'
FROM
    bands b
LEFT JOIN albums a ON
    a.band_id = b.id
GROUP BY
    b.id
HAVING
    COUNT(a.id) = 0;

-- 6. Get the Longest Album
SELECT
    a.name 'Name',
    a.release_year 'Release Year',
    ROUND(SUM(s.length),2) Duration
FROM
    albums a
JOIN songs s ON
    s.album_id = a.id
GROUP BY
    a.id
ORDER BY
    Duration
DESC
LIMIT 1;


-- 11. Select the longest Song off each Album
SELECT
    a.name 'Album',
    a.release_year 'Release Year',
    MAX(s.length) Duration
FROM
    albums a
JOIN songs s ON
    s.album_id = a.id
GROUP BY
    a.id;

 -- 12. Get the number of Songs for each Band
 SELECT
    b.name Band,
    COUNT(s.id) 'Number of Songs'
FROM
    bands b
JOIN albums a ON
    a.band_id = b.id
JOIN songs s ON
    s.album_id = a.id
GROUP BY
    b.id;