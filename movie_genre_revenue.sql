/*
Revenue by Movie Genre
Calculate total revenue generated by each movie genre, 
then rank genres based on revenue.
*/

/*
1. Explore relevant tables to identify movie genre and revenue.
2. Make a note of useful columns for linking and calculating revenue by genre.
*/
select * from payment -- payment id, customer id, staff id, rental id, amount
select * from rental -- rental id, inventory id, staff id, cust id
select * from film -- film id
select * from film_category -- film id, category id
select * from category -- category id, name
select * from inventory -- inventory id, film id, store id

/*
3. Write the SQL query to calculate total revenue by genre
*/
select c.name, sum(p.amount)  -- Columns highlighting the total revenue for each movie genre
from payment p -- the first and most relevant or common table to the query
join rental r on r.rental_id = p.rental_id -- joining the column common to the previous table in each of the following steps
join inventory i on i.inventory_id = r.inventory_id
join film_category fc on fc.film_id = i.film_id
join category c on c.category_id = fc.category_id
group by c.name -- after merging tables, grouping based on movie category
order by sum(p.amount) desc; -- order by highest revenue generating genre
