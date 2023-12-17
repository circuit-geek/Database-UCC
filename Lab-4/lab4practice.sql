SELECT *
FROM persons;

SELECT *
FROM likes;

SELECT first_name
FROM persons
WHERE first_name LIKE 'A%';

SELECT first_name
FROM persons
WHERE first_name LIKE '%A';

SELECT first_name
FROM persons
WHERE first_name LIKE '%A%';

SELECT first_name
FROM persons
WHERE LENGTH(first_name) = 5;

SELECT first_name
FROM persons
WHERE street LIKE '%street%';

SELECT DISTINCT food
FROM likes
WHERE food LIKE '% %';

SELECT DISTINCT food
FROM likes
WHERE food LIKE '%te%';

SELECT l.food
FROM persons as p 
JOIN likes as l 
ON p.person_id = l.person_id
WHERE p.first_name = 'Aoife';

SELECT food
FROM likes
WHERE person_id = (
    SELECT person_id 
    FROM persons
    WHERE first_name = 'Aoife'
);

SELECT p.first_name, l.food 
FROM persons AS p 
JOIN likes AS l 
ON p.person_id = l.person_id
WHERE p.county = 'Cork'; 

SELECT DISTINCT food
FROM likes
WHERE person_id IN (
    SELECT person_id 
    FROM persons
    WHERE gender = 'F'
);

SELECT first_name, last_name
FROM persons
WHERE person_id IN (
    SELECT person_id
    FROM likes
    WHERE food = 'Pizza'
);

SELECT DISTINCT town
FROM persons
WHERE person_id IN (
    SELECT person_id
    FROM likes
    WHERE food = 'Beer'
);

SELECT *
FROM likes as l1 CROSS JOIN likes as l2 
ON l1.person_id = l2.person_id; 

SELECT *
FROM likes as l1 CROSS JOIN likes as l2 
ON l1.person_id = l2.person_id
WHERE l1.food = l2.food;

SELECT person_id
FROM likes
WHERE food = 'Pizza' AND food = 'Nutella';

SELECT person_id
FROM likes
WHERE food = 'Pizza' OR food = 'Nutella';

SELECT first_name, last_name
FROM persons
WHERE county = 'Cork'
AND person_id IN (
    SELECT person_id
    FROM likes
    WHERE food = 'Beer'
);

SELECT first_name, last_name
FROM persons
WHERE person_id IN (
    SELECT person_id
    FROM likes
    WHERE food = 'Pizza' AND food = 'Nutella'
);

SELECT first_name, last_name
FROM persons
WHERE person_id IN (
    SELECT person_id
    FROM likes
    WHERE food = 'Pizza' OR food = 'Nutella'
);

SELECT *
FROM persons as p1 CROSS JOIN persons as p2;

SELECT *
FROM persons as p1 CROSS JOIN persons as p2
WHERE p1.person_id = p2.person_id;

SELECT p1.first_name, p1.last_name
FROM persons as p1 
JOIN persons as p2
ON p1.birth_date = p2.birth_date
WHERE p1.person_id < p2.person_id;

SELECT p1.first_name, p1.last_name
FROM persons as p1 
JOIN persons as p2
ON strftime('%m-%d', p1.birth_date) = strftime('%m-%d', p2.birth_date)
WHERE p1.person_id < p2.person_id;

SELECT food, COUNT(*) as food_count
FROM likes
GROUP BY food
ORDER BY food_count DESC;

SELECT first_name, last_name
FROM persons
EXCEPT
SELECT first_name, last_name
FROM persons
WHERE person_id IN (
    SELECT person_id
    FROM likes
    WHERE food = 'Beer'
);

SELECT p1.first_name, p1.last_name, COUNT(l1.food) as food_count
FROM persons as p1
JOIN likes as l1
ON p1.person_id = l1.person_id
WHERE l1.food IN ('Pizza', 'Nutella', 'Beer')
GROUP BY p1.first_name
HAVING food_count > 1;

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
