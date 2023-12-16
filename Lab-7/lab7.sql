SELECT *
FROM countries;

SELECT *
FROM cities;

SELECT *
FROM country_languages;

SELECT name, population
FROM cities
ORDER BY population DESC
LIMIT 20;

SELECT c.name AS country_name, COUNT(cities.id) AS city_count
FROM countries AS c
JOIN cities 
ON c.code = cities.country_code
WHERE cities.population > 1000000 
GROUP BY c.name;

SELECT name, indep_year
FROM countries
WHERE indep_year > (
    SELECT indep_year
    FROM countries
    WHERE name = 'India'
);

SELECT l.language AS language_spoken, c.name AS country_name
FROM countries AS c
JOIN country_languages AS l
ON c.code = l.country_code
WHERE l.percentage > 25;

SELECT name, life_expectancy, gnp
FROM countries
WHERE life_expectancy IS NOT NULL
ORDER BY gnp, life_expectancy ASC
LIMIT 20;

SELECT c.name, c.surface_area, c.continent
FROM countries as c
WHERE c.surface_area >= 0.1 *(
    SELECT SUM(surface_area)
    FROM countries
    WHERE continent = c.continent
);

SELECT head_of_state, MAX(surface_area) AS max_surface_area
FROM countries
WHERE head_of_state IS NOT NULL
GROUP BY head_of_state
ORDER BY surface_area DESC
LIMIT 1;

SELECT continent, name, MAX(population)
FROM countries
GROUP BY continent
UNION
SELECT continent, name, MIN(population)
FROM countries
GROUP BY continent;

SELECT c.name, MAX(cities.population)*100.0/c.population as population_percentage
FROM countries as c 
JOIN cities 
ON c.code = cities.country_code
WHERE c.continent = 'Europe'
GROUP BY c.name
ORDER BY population_percentage DESC;

SELECT c.name, c.population as population, l.language
FROM countries AS c
JOIN country_languages as l
ON c.code = l.country_code
WHERE l.language NOT IN ('English', 'Spanish', 'Chinese', 'Arabic', 'Hindi')
AND l.percentage < 25
ORDER BY population DESC;

SELECT language
FROM (
    SELECT language, COUNT(DISTINCT c.continent) AS continent_count
    FROM country_languages AS cl
    JOIN countries AS c ON cl.country_code = c.code
    WHERE cl.percentage >= 50
    GROUP BY language
) AS language_counts
WHERE continent_count >= 2;



