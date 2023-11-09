SELECT *
FROM movies;

SELECT 'Number of Films' AS category, COUNT(*) AS count
FROM movies
UNION
SELECT 'Number of Actors' AS category, COUNT(*) AS count
FROM actors;

select count(DISTINCT title) as 'Films released in 1975' 
FROM movies 
where yr = 1975;

select movieid 
from actors join castings
ON actors.id = castings.actorid
WHERE actors.name = 'Clint Eastwood';

SELECT title, yr
FROM movies JOIN castings JOIN actors
ON movies.id = castings.movieid
AND castings.actorid = actors.id
WHERE actors.name = 'Clint Eastwood'
ORDER BY yr;

SELECT actors.name
FROM actors
JOIN castings ON actors.id = castings.actorid
JOIN movies ON castings.movieid = movies.id
WHERE movies.title = 'Citizen Kane';

SELECT actors.name
FROM actors JOIN castings
ON actors.id = castings.actorid
JOIN movies 
ON castings.movieid = movies.id
WHERE movies.title = 'Vertigo' OR movies.title = 'Rear Window';

SELECT movies.title
FROM movies
WHERE movies.director = 28;

SELECT movies.title
FROM movies
WHERE movies.director = (
    SELECT movies.director
    FROM movies
    WHERE movies.title = 'Godfather, The'
);

SELECT m1.title, m1.yr, m2.title, m2.yr
FROM movies as m1 
JOIN movies as m2
ON m1.title = m2.title
WHERE m1.id < m2.id;

SELECT title
FROM movies
WHERE title LIKE '% II%' or title LIKE '% III%' or title LIKE '% IV%' or title LIKE '% V%';

SELECT m1.title, m2.title
FROM movies as m1 JOIN movies as m2
ON m1.title || ' II' = m2.title
WHERE m1.id < m2.id;

SELECT m1.title, m2.title, m1.director, m2.director
FROM movies as m1 JOIN movies as m2
ON m1.director = m2.director
WHERE m1.score > 8 and m2.score < 3;

SELECT m1.title, m1.yr
FROM actors AS a1
JOIN castings AS c1 ON a1.id = c1.actorid
JOIN movies AS m1 ON c1.movieid = m1.id
WHERE a1.name = 'Clint Eastwood'
AND m1.id IN (
    SELECT c2.movieid
    FROM actors AS a2
    JOIN castings AS c2 ON a2.id = c2.actorid
    WHERE a2.name = 'Richard Burton'
);

SELECT DISTINCT a2.name
FROM actors as a1
JOIN castings as c1 ON a1.id = c1.actorid
JOIN movies as m1 ON c1.movieid = m1.id
JOIN castings as c2 ON m1.id = c2.movieid
JOIN actors as a2 ON c2.actorid = a2.id
WHERE a1.name = 'Al Pacino' AND a2.name != 'Al Pacino';

SELECT DISTINCT a1.name
FROM movies AS m1
JOIN castings AS c1 ON m1.id = c1.movieid
JOIN actors AS a1 ON c1.actorid = a1.id
WHERE m1.title = 'Big Sleep, The'
AND a1.id IN (
    SELECT c2.actorid
    FROM movies AS m2
    JOIN castings AS c2 ON m2.id = c2.movieid
    WHERE m2.title = 'Casablanca'
);

SELECT DISTINCT a1.name
FROM movies AS m1
JOIN castings AS c1 ON m1.id = c1.movieid
JOIN actors AS a1 ON c1.actorid = a1.id
WHERE m1.yr BETWEEN 1950 and 1959
AND a1.id IN (
    SELECT c2.actorid
    FROM movies AS m2
    JOIN castings AS c2 ON m2.id = c2.movieid
    WHERE m2.yr BETWEEN 1980 and 1989
);

SELECT SUBSTR(title,1,1) as first_letter, count(title), yr
FROM movies
WHERE movies.yr BETWEEN 1960 and 1969
GROUP BY first_letter;

SELECT a.name AS actor_name, m.title AS movie_title
FROM actors AS a
JOIN castings AS c ON a.id = c.actorid
JOIN movies AS m ON c.movieid = m.id
GROUP BY a.name, m.title
HAVING COUNT(m.title) >= 10;






