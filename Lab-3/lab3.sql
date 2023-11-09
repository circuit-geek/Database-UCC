SELECT *
FROM countries;

SELECT name, max(area)
FROM countries;

SELECT name, population
FROM countries
WHERE region = 'Africa';

SELECT name, max(population)
FROM countries
WHERE region = 'Africa';

SELECT sum(gdp)
FROM countries
WHERE region = 'Europe';

SELECT name, population
FROM countries
WHERE gdp is NULL;

SELECT region, avg(gdp)
FROM countries
GROUP BY region;

SELECT name
FROM countries
WHERE name like '%' || region || '%';

SELECT region, min(gdp/population), max(gdp/population)
FROM countries
GROUP BY region;

SELECT region, sum(population), COUNT(name)
FROM countries
WHERE region IN ('Europe', 'Africa', 'Middle East')
GROUP BY region;

SELECT sum(population), sum(area), sum(gdp)
FROM countries
WHERE name IN ('France', 'Germany', 'Spain');

SELECT region, count(name)
FROM countries
WHERE population > 100000000
GROUP BY region;

SELECT SUBSTR(name, 1, 1) AS first_letter, MIN(name), MAX(name)
FROM countries
GROUP BY first_letter;

SELECT name, region, population
FROM countries
ORDER BY region, population DESC;

SELECT count(name), region, sum(area)/sum(population) AS population_density
FROM countries
WHERE population > 100000000
GROUP BY region;

SELECT name, region
FROM countries
WHERE region =  (
    SELECT region
    FROM countries
    WHERE name = 'Jordan'
);

SELECT count(name) AS No_of_countries_same_as_jordan
FROM countries
WHERE region = (
    SELECT region
    FROM countries
    WHERE name = 'Jordan'
);

SELECT name, region
FROM countries
WHERE region = (
    SELECT region
    FROM countries
    WHERE name = 'Spain'
) AND area > (
    SELECT area
    FROM countries
    WHERE name = 'Spain'
);

SELECT c.name, region
FROM countries c 
WHERE area >= 0.1 * (
    SELECT sum(area)
    FROM countries
    WHERE region = c.region
);

WITH PopulationBands AS (
  SELECT
    name,
    population,
    area,
    (population / 100000000) AS population_band
  FROM countries
)
SELECT
  population_band * 100000000 AS population_band_lower,
  (population_band + 1) * 100000000 AS population_band_upper,
  COUNT(name) AS number_of_countries,
  MIN(area) AS min_area,
  MAX(area) AS max_area
FROM PopulationBands
GROUP BY population_band
ORDER BY population_band DESC;

SELECT name, region, min(population)
FROM countries
WHERE region = (
    SELECT region
    FROM countries
    WHERE name = 'China'
)
GROUP BY region;

SELECT name, max(population)
FROM countries;

SELECT name, population
FROM countries
WHERE population = (
    SELECT max(population)
    FROM countries
);

SELECT name, gdp/population AS per_capita_gdp
FROM countries
WHERE per_capita_gdp >= (
    SELECT gdp/population
    FROM countries
    WHERE name = 'China'
);

--- QNo 14 and QNo 19 Doubt---




