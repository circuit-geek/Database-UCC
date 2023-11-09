SELECT *
FROM countries;

SELECT name, population
FROM countries
WHERE region = 'Europe'
ORDER BY population DESC;

SELECT DISTINCT(region)
FROM countries
ORDER BY region ASC;

SELECT region, name
FROM countries
ORDER BY region, name;

SELECT name
FROM countries
WHERE gdp IS NULL;

SELECT name, region
FROM countries
WHERE region LIKE '%Asia%';

SELECT name, region
FROM countries
WHERE name like '%South%' or '%North%';

SELECT name
FROM countries
WHERE name like '%stan';

SELECT name
FROM countries
WHERE name like '%x%' or name like '%y%' or name like '%z%';

SELECT name, population, gdp
FROM countries
WHERE (gdp/population) >= 25000;

--- --- --- --- --- --- Data Manipulation Queries --- --- --- --- --- ---

SELECT *
FROM students;

UPDATE students
SET points = points + 50
WHERE first_name = 'Aoife';

UPDATE students
SET date_of_birth = '2000-01-01', hometown = 'Tahiti'
WHERE id_number = '112836467';

INSERT INTO students
VALUES('112899734', 'Grianne', 'Goggin', '2001-12-21', 'Chennai', 'ck407', 900);

INSERT INTO students(id_number, first_name, last_name)
VALUES('112876321', 'Hugh', 'Hegarty');

UPDATE students
SET date_of_birth = '1974-02-05', hometown = 'Mysuru', course = 'ck405', points = 1000
WHERE id_number = '112876321';

INSERT INTO students
VALUES 
('123908675', 'Anirudh', 'Srikanth', '2001-02-28', 'Bengaluru', 'ck410', 290),
('123908575', 'Mohit', 'Vaka', '2001-02-09', 'Hyderabad', 'ck412', 250),
('123908475', 'Kritika', 'KS', '2000-11-15', 'Bengaluru', 'ck410', 240),
('123908375', 'Priyadarshini', 'Subbaraj', '2001-07-05', 'Chennai', 'ck405', 295);

DELETE
FROM students
WHERE points <= 300;

INSERT INTO students(id_number)
VALUES('112876321'); --- (Unique Constraint Failed) ---

INSERT INTO students
VALUES('123100646','Grianne','Goggin','2001-12-21','Chennai','ck407',900);









