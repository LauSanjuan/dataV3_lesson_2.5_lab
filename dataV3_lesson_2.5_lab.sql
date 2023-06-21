USE sakila;

-- 1. Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
WHERE first_name = 'Scarlett';

-- 2. How many physical copies of movies are available for rent in the store's inventory? How many unique movie titles are available?
SELECT COUNT(*) FROM sakila.inventory;
SELECT COUNT(DISTINCT film_id) FROM sakila.inventory;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MIN(length) AS 'min_duration', MAX(length) AS 'max_duration' FROM sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT AVG(length) AS 'minutes', AVG(length) / 60  AS 'hours' FROM sakila.film;

-- 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) FROM sakila. actor;

-- 6. How many days was the company operating? Assume the last rental date was their closing date. 
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) FROM sakila.rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, MONTH(rental_date) AS 'month',
CASE WEEKDAY(rental_date)
           WHEN 6 THEN 'Sunday'
           WHEN 0 THEN 'Monday'
           WHEN 1 THEN 'Tuesday'
           WHEN 2 THEN 'Wednesday'
           WHEN 3 THEN 'Thursday'
           WHEN 4 THEN 'Friday'
           WHEN 5 THEN 'Saturday'
       END AS 'weekday'
FROM sakila.rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, MONTH(rental_date) AS 'month',
CASE WEEKDAY(rental_date)
           WHEN 6 THEN 'Sunday'
           WHEN 0 THEN 'Monday'
           WHEN 1 THEN 'Tuesday'
           WHEN 2 THEN 'Wednesday'
           WHEN 3 THEN 'Thursday'
           WHEN 4 THEN 'Friday'
           WHEN 5 THEN 'Saturday'
       END AS 'weekday',
CASE WEEKDAY(rental_date)
           WHEN 6 THEN 'weekend'
           WHEN 0 THEN 'workday'
           WHEN 1 THEN 'workday'
           WHEN 2 THEN 'workday'
           WHEN 3 THEN 'workday'
           WHEN 4 THEN 'workday'
           WHEN 5 THEN 'weekend'
       END AS 'day_type'
FROM sakila.rental;

-- 9. Get release years.
SELECT DISTINCT release_year FROM sakila.film;

-- 10. Get all films with ARMAGEDDON in the title.
SELECT * FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO.
SELECT * FROM sakila.film
WHERE title LIKE '%APOLLO';

-- 12. Get 10 the longest films.
SELECT * FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- 13. How many films include Behind the Scenes content?
SELECT COUNT(*) FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%';