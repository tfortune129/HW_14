-- 1. List all customers who live in Texas (use JOINs)
SELECT * 
FROM customer

SELECT * 
from district


SELECT *
FROM address
INNER JOIN customer
on address.address_id = customer.address_id
WHERE district = 'Texas'


-- 2. Get all payments above $6.99 with the Customer's FullName

SELECT * from customer
SELECT * from payment

SELECT first_name, last_name, amount
FROM payment
INNER JOIN customer
on customer.customer_id = payment.customer_id
WHERE amount > 6.99


-- 3. Show all customers names who have made payments over $175(use
-- subqueries)

SELECT first_name, last_name
from customer
WHERE customer_id in(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    having sum(amount) > 175
    order by sum(amount) desc
);

-- 4. List all customers that live in Nepal (use the city table)

-- SELECT first_name, last_name
-- from customer
-- inner JOIN address
-- on customer.address_id = address.address_id
-- INNER JOIN city
-- on city.country_id = country.country_id
-- WHERE country = 'Nepal'


SELECT *
from country
inner JOIN city
on country.country_id= city.country_id
WHERE country = 'Nepal'

select * from country


-- 5. Which staff member had the most transactions?
SELECT staff_id
FROM staff
INNER JOIN payment
on payment.staff_id = staff.staff_id
WHERE staff_id in(
    select staff_id
    from staff
    GROUP BY staff_id
    having count(staff_id) > 1
);


SELECT * from payment

--**

-- 6. How many movies of each rating are there?

SELECT count ()

select count(rating, rating) 
from film
inner JOIN film_category
on film.film_id = film_category.film_id
WHERE rating in(
    select film_id
    from film
    group BY rating
);

--**


-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)

SELECT distinct first_name, last_name
from customer
WHERE customer_id in(
    SELECT customer_id
    from payment
    GROUP BY customer_id
    having sum(amount) > 6.99
    order by last_name asc
);

SELECT * 
from payment
where amount > 6.99


-- 8. How many free rentals did our stores give away?

select * from film
where rental_rate < 1


SELECT count(title)
FROM film
INNER JOIN inventory
on film.film_id = inventory.film_id
WHERE rental_rate = 0







-- -- Week 5 - Monday Questions

-- -- 1. How many actors are there with the last name ‘Wahlberg’?

-- SELECT COUNT(last_name)
-- FROM actor
-- WHERE last_name = 'Wahlberg';

-- -- 2. How many payments were made between $3.99 and $5.99?

-- SELECT COUNT(amount)
-- FROM payment
-- WHERE amount BETWEEN 3.99 AND 5.99;


-- -- 3. What film does the store have the most of? (search in inventory)
-- SELECT COUNT(film_id), film_id
-- FROM inventory
-- GROUP BY film_id
-- ORDER BY count DESC



-- -- 4. How many customers have the last name ‘William’?

-- SELECT COUNT(last_name)
-- FROM customer
-- WHERE last_name = 'William';



-- -- 5. What store employee (get the id) sold the most rentals?
-- SELECT count(*), staff_id
-- FROM payment
-- GROUP BY staff_id
-- ORDER BY count DESC 

-- SELECT first_name, last_name
-- from staff
-- WHERE staff_id = 2



-- -- 6. How many different district names are there?
-- SELECT COUNT(district)
-- FROM address



-- -- 7. What film has the most actors in it? (use film_actor table and get film_id)

-- SELECT count(*), film_id
-- from film_actor
-- GROUP BY film_id
-- ORDER BY COUNT DESC

-- SELECT title
-- from film
-- WHERE film_id = 508



-- -- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- SELECT COUNT(last_name)
-- from customer
-- WHERE last_name like '%es';




-- -- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- -- with ids between 380 and 430? (use group by and having > 250)

-- SELECT COUNT(amount), amount
-- from payment
-- WHERE customer_id BETWEEN 380 and 430
-- GROUP BY amount
-- HAVING COUNT(amount) > 250

-- --where always come first and having comes last



-- -- 10. Within the film table, how many rating categories are there? And what rating has the most
-- -- movies total?

-- SELECT COUNT(distinct rating)
-- from film


-- SELECT count(rating), rating
-- from film
-- GROUP BY rating
-- Order BY COUNT DESC

