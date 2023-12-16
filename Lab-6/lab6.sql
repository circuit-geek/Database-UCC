SELECT *
FROM movies;

SELECT *
FROM castings;

SELECT *
FROM actors;

SELECT id
FROM actors
WHERE id in (
    SELECT actorid 
    FROM castings
    WHERE movieid = (
        SELECT id
        FROM movies
        WHERE title = 'Big Sleep, The'
    )
);

SELECT title, director, yr
FROM movies
WHERE director = (
    SELECT director
    FROM movies
    WHERE title = 'Citizen Kane'
)
ORDER BY yr;

SELECT name
FROM actors
WHERE id in (
    SELECT actorid 
    FROM castings
    WHERE movieid = (
        SELECT id
        FROM movies
        WHERE title = 'Big Sleep, The'
    )
);

SELECT id
FROM movies
WHERE yr BETWEEN 1950 and 1959
OR id IN (
    SELECT movieid
    FROM castings
    WHERE actorid = (
        SELECT id
        FROM actors
        WHERE name = 'Elizabeth Taylor'
    )
);

SELECT title, score 
FROM movies
WHERE score > 8.5
ORDER BY score;

SELECT a1.id, COUNT(*) as movie_count
FROM actors as a1
JOIN castings as c1
ON a1.id = c1.actorid
JOIN movies as m1
ON c1.movieid = m1.id
GROUP BY a1.id
HAVING COUNT(*) > 9
ORDER BY movie_count DESC;

SELECT a1.name, COUNT(*) as movie_count
FROM actors as a1
JOIN castings as c1
ON a1.id = c1.actorid
JOIN movies as m1
ON c1.movieid = m1.id
GROUP BY a1.id
HAVING COUNT(*) > 9
ORDER BY movie_count DESC;

SELECT name
FROM actors
WHERE id in (
    SELECT actorid
    FROM castings
    WHERE movieid IN (
        SELECT id
        FROM movies
        WHERE score < 3
    )
);

SELECT title, MAX(score) as score
FROM movies
UNION
SELECT title, MIN(score)
FROM movies;

SELECT yr, title
FROM movies
WHERE director = (
    SELECT director
    FROM movies
    WHERE title = 'Citizen Kane'
    ORDER BY yr ASC
    ) AND yr < (
        SELECT MIN(yr)
        FROM movies
        WHERE director = (
            SELECT director
            FROM movies
            WHERE title = 'Citizen Kane'
        )
);

SELECT score, title
FROM movies
WHERE score > (
    SELECT MAX(score)
    FROM movies
    WHERE yr BETWEEN 1940 and 1949
);

SELECT COUNT(*) as movie_count
FROM movies
GROUP BY director
ORDER BY movie_count DESC
LIMIT 1;

SELECT director, COUNT(*) as movie_count
FROM movies
GROUP BY director
ORDER BY movie_count DESC
LIMIT 1;

SELECT title
FROM movies
WHERE director = (
    SELECT director
    FROM movies
    GROUP BY director
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

SELECT title
FROM movies
WHERE director = (
    SELECT director
    FROM movies
    WHERE title = 'Bananas'
) AND id IN (
    SELECT movieid
    FROM castings
    WHERE actorid = (
        SELECT id
        FROM actors
        WHERE name = 'Diane Keaton'
    )
);