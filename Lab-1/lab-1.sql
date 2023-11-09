SELECT *
FROM students;

SELECT first_name, last_name
FROM students;

SELECT first_name, points
FROM students
ORDER BY points;

SELECT first_name, last_name, date_of_birth
FROM students
ORDER BY date_of_birth;

SELECT DISTINCT(hometown)
FROM students;

SELECT first_name, last_name, points
FROM students
WHERE points >= 450;

SELECT first_name, last_name, points
FROM students
WHERE points >= 400 AND points <= 500;

SELECT first_name, last_name
FROM students
WHERE hometown = 'Cork';

SELECT first_name, last_name, date_of_birth
FROM students
WHERE date_of_birth <= '1994-01-01';

SELECT first_name, last_name, date_of_birth
FROM students
WHERE strftime('%Y', '2012-10-01') - strftime('%Y', date_of_birth) - (strftime('%m-%d', '2012-10-01') < strftime('%m-%d', date_of_birth)) < 20;

SELECT first_name, last_name
FROM students
WHERE date_of_birth = '1994-12-25';

SELECT *
FROM students
WHERE first_name = 'Ciara';

SELECT *
FROM students
WHERE first_name = 'ciara';

SELECT *
FROM students
WHERE first_name = 'Barry';

SELECT *
FROM students
WHERE first_name = 'O''Kelly' or last_name = 'O''Kelly';

SELECT first_name, last_name, date_of_birth
FROM students
WHERE strftime('%Y', date_of_birth) = '1994';

-- No information provided on gender in the database --

SELECT *
FROM students
WHERE course = 'ck401' or course = 'ck402';

SELECT *
FROM students
WHERE points >= 450 and hometown = 'Cork';

SELECT *
FROM students
WHERE points >= 450 and hometown != 'Cork';

SELECT *
FROM students
WHERE last_name < 'Cuddihy'
ORDER BY last_name ASC;

SELECT *
FROM students
WHERE last_name < 'Callaghan' AND first_name < 'Harry'
ORDER BY first_name ASC, last_name ASC;

SELECT first_name, last_name
FROM students
WHERE first_name LIKE 'H%';

SELECT first_name AS 'Given Name', last_name AS 'Surname', points as 'CAO Points'
FROM students
WHERE points >= 450
ORDER BY points ASC;







