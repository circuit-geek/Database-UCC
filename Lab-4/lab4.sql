SELECT *
FROM persons;

SELECT *
FROM likes;

SELECT first_name
FROM persons
WHERE first_name like 'A%';

SELECT first_name
FROM persons
WHERE first_name like '%A';

SELECT first_name
FROM persons
WHERE first_name like '%A%';

SELECT first_name
FROM persons
WHERE LENGTH(first_name) = 5;

SELECT first_name, street
FROM persons
WHERE street like '%Street%';

SELECT food
FROM likes
WHERE food LIKE '% %';

SELECT food
FROM likes
WHERE food like '%te%';

SELECT *
FROM persons CROSS JOIN likes;

SELECT *
FROM persons JOIN likes
    ON persons.person_id = likes.person_id;

SELECT persons.first_name, likes.food
FROM persons JOIN likes
    ON persons.person_id = likes.person_id
    WHERE first_name = 'Aoife';


SELECT persons.first_name, persons.county, likes.food
FROM persons JOIN likes
    ON persons.person_id = likes.person_id
    WHERE county = 'Cork';

SELECT DISTINCT likes.food, persons.gender
FROM persons JOIN likes
ON persons.person_id = likes.person_id
WHERE gender = 'F';

SELECT persons.first_name, likes.food
FROM persons JOIN likes
ON persons.person_id = likes.person_id
WHERE food = 'Pizza';

SELECT DISTINCT persons.town, likes.food
FROM persons JOIN likes
ON persons.person_id = likes.person_id
WHERE food = 'Beer';

SELECT l1.person_id, l1.food, l2.person_id, l2.food
FROM likes as l1
JOIN likes as l2
ON l1.person_id = l2.person_id;

SELECT l1.person_id, l1.food, l2.person_id, l2.food
FROM likes as l1
JOIN likes as l2
ON l1.person_id = l2.person_id
WHERE l1.food = l2.food;

SELECT person_id
FROM likes 
WHERE food = 'Pizza' AND food = 'Nutella';

SELECT person_id 
FROM likes
WHERE food = 'Pizza' OR food = 'Nutella';

SELECT first_name, last_name
FROM persons JOIN likes
ON persons.person_id = likes.person_id
WHERE persons.town = 'Cork' AND likes.food = 'Beer';

SELECT first_name, last_name, l1.food, l2.food
FROM persons as p
JOIN likes as l1 
ON p.person_id = l1.person_id 
AND l1.food = 'Pizza'
JOIN likes as l2 
ON p.person_id = l2.person_id 
AND l2.food = 'Nutella';

SELECT first_name, last_name
FROM persons JOIN likes
ON persons.person_id = likes.person_id
WHERE likes.food = 'Pizza' OR likes.food = 'Nutella';

SELECT 
    p1.person_id, p1.first_name, p1.last_name, p1.birth_date, p1.county, p1.gender, p1.town, p1.street, 
    p2.person_id, p2.first_name, p2.last_name, p2.birth_date, p2.county, p2.gender, p2.town, p2.street
FROM persons as p1 CROSS JOIN persons as p2;

SELECT 
    p1.person_id, p1.first_name, p1.last_name, p1.birth_date, p1.county, p1.gender, p1.town, p1.street, 
    p2.person_id, p2.first_name, p2.last_name, p2.birth_date, p2.county, p2.gender, p2.town, p2.street
FROM persons as p1 CROSS JOIN persons as p2
ON p1.person_id = p2.person_id;

SELECT p1.person_id, p2.person_id, p1.birth_date, p2.birth_date
FROM persons as p1 JOIN persons as p2
ON p1.birth_date = p2.birth_date
AND p1.person_id < p2.person_id;

SELECT p1.person_id, p2.person_id, p1.birth_date, p2.birth_date
FROM persons as p1 JOIN persons as p2
ON strftime('%m-%d',p1.birth_date) = strftime('%m-%d',p2.birth_date) 
AND p1.person_id < p2.person_id;

SELECT count(person_id), food
FROM likes
GROUP BY food;

SELECT first_name
FROM persons
EXCEPT
SELECT first_name
FROM persons as p JOIN likes as l
ON p.person_id = l.person_id
WHERE l.food = 'Beer';

SELECT count(l.food) as food_count, first_name
FROM persons as p JOIN likes as l
ON p.person_id = l.person_id
WHERE l.food IN ('Pizza', 'Beer', 'Nutella')
GROUP BY p.first_name
HAVING food_count >= 2;

SELECT DISTINCT l1.person_id, l2.person_id, l1.food
FROM likes as l1 JOIN likes as l2
ON l1.food = l2.food
WHERE l1.person_id < l2.person_id;

SELECT county, count(food)
FROM persons JOIN likes 
ON persons.person_id = likes.person_id
GROUP BY county;

SELECT county, COUNT(persons.person_id) AS count_of_beer_lovers
FROM persons JOIN likes 
ON persons.person_id = likes.person_id
WHERE likes.food = 'Beer'
GROUP BY county
ORDER BY count_of_beer_lovers DESC;

SELECT first_name, MAX(birth_date)
FROM persons;

SELECT first_name, birth_date
FROM persons
WHERE birth_date = (
    SELECT MAX(birth_date)
    FROM persons
);









