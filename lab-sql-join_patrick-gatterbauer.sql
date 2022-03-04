# 1. List the number of films per `category`.
USE sakila;

SELECT 
	category.category_id, category.name, COUNT(film.film_id) as film_num 
FROM 
	film
LEFT JOIN
	category
ON
	category.category_id = film.film_id
GROUP BY
	category.category_id, category.name;
    
# 2. Display the first and the last names, as well as the address, of each staff member.

SELECT 
	staff.first_name, staff.last_name, address.address
FROM 
	staff
LEFT JOIN
	address
ON
	staff.address_id = address.address_id
ORDER BY
	staff.first_name, staff.last_name, address.address;
    
# 3. Display the total amount rung up by each staff member in August 2005.

SELECT 
	staff.staff_id, COUNT(payment.amount) as amount_total
FROM 
	staff
LEFT JOIN
	payment
ON
	staff.staff_id = payment.staff_id
HAVING
	 DATEPART(payment.payment_date, MY_DATETIME) = 08;
     

# 4. List all films and the number of actors who are listed for each film.
SELECT 
	film.film_id, film.title, COUNT(film_actor.actor_id) as num_actors 
FROM 
	film
LEFT JOIN
	film_actor
ON
	film.film_id = film_actor.film_id
GROUP BY
	film.film_id, film.title;

# 5. Using the `payment` and the `customer` tables as well as the JOIN command, 
# list the total amount paid by each customer. List the customers alphabetically by their last names.

SELECT 
	customer.customer_id, 
    customer.first_name, 
    customer.last_name, 
    SUM(payment.amount) as total_payment 
FROM 
	customer
LEFT JOIN
	payment
ON
	customer.customer_id = payment.customer_id
GROUP BY
	customer.customer_id, customer.first_name, customer.last_name
ORDER BY
	customer.last_name ASC;