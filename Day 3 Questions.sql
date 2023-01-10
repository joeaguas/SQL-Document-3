-- Question 1: List all customers who live in Texas (use JOINs)
select first_name, last_name, district
from customer
full join address
on customer.address_id = address.address_id
where district = 'Texas';
-- 5 customers live in Texas

-- Question 2: Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name, amount
from customer
inner join payment
on customer.customer_id = payment.customer_id 
where amount > 6.99;

-- Question 3: Show all customers names who have made payments over $175(use subqueries) 
select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
)
-- there is 135

-- Question 4: List all customers that live in Nepal (use the city table)
select first_name, last_name, country
from customer
inner join address
on customer.address_id = address.address_id
inner join city
on address.city_id = city.city_id 
inner join country
on city.country_id = country.country_id 
where country.country_id = 66;
-- One customer: Kevin Schuler

-- Question 5: Which staff member had the most transactions? 
select first_name, last_name, count(payment.staff_id)
from staff
inner join payment
on payment.staff_id = staff.staff_id
group by staff.first_name, staff.last_name;
-- Jon Stephens had the most transactions at 7304

-- Question 6: How many movies of each rating are there? 
select count(rating), rating  
from film
group by rating;
-- G:178, PG:194, PG-13:223, R:195, NC-17:209, NULL: 0

-- Question 7: Show all customers who have made a single payment above $6.99 (Use Subqueries)
select first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	group by customer_id, amount
	having amount > 6.99
	order by amount desc
);
-- lots of them

-- Question 8: How many free rentals did our stores give away?
select 
from rental
where rental_id in (
	select rental_id
	from payment
	group by rental_id, amount
	having amount = 0
);
-- None