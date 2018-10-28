use sakila;

select * from columns(sakila);

-- 1a
select first_name, last_name
from actor;

-- 1b
select concat(first_name, ' ', last_name)  AS 'Actor Name'
from actor;

-- 2a
select actor_id, first_name, last_name
from actor
where first_name like '%Joe%';

-- 2b
select last_name
from actor
where last_name like '%GEN%';

-- 2c
select last_name, first_name
from actor
where last_name like '%LI%';

-- 2d
select country_id, country
from country
where country in ('Afghanistan', 'Bangladesh', 'China');

-- 3a
alter table actor
add 'Description' blob;

-- 3b
LMAO

-- 4a
select last_name, count(first_name) AS 'total'
from actor
group by last_name;

-- 4b
select last_name, count(first_name)
from actor
group by last_name
having count(first_name)>=2;

-- 4C
update actor
set first_name= "HARPO"
where first_name = "GROUCHO" AND last_name = "WILLIAMS";

-- 4d
update actor
set first_name=
case 
	when first_name= "HARPO" 
    then "GROUCHO"
end;

-- 5a

show create table address;

-- 6a
select first_name, last_name, address
from staff as st
join address as ad
on (st.address_id=ad.address_id);

-- 6b
select first_name, last_name, sum(amount)
from staff as st
join payment as pm
on (st.staff_id=pm.staff_id)
where month(payment_date)= 08 and year(payment_date) = 2005
group by st.staff_id;

-- 6c
select title, count(actor_id)
from film as fl
join film_actor as fa
on (fl.film_id = fa.film_id)
group by title;

-- 6d
select title, count(inventory_id)
from film as fl
join inventory as inv
on (fl.film_id = inv.film_id)
where title="Hunchback Impossible"
group by title;

-- 6e
select first_name, last_name, sum(amount)
from customer as ct
join payment as pay
on (ct.customer_id= pay.customer_id)
group by first_name
order by last_name asc;

-- 7a
select fl.title, fl.language_id, ln.name
from film fl, language ln
where ln.name like "English"
and fl.title like "Q%"
or ln.name like "English"
and fl.title like "K%";

-- 7b
select fl.title, ac.first_name, ac.last_name
from film fl, actor ac
where fl.title like "Alone Trip";

-- 7c
select c.first_name, c.last_name, c.email, ad.city_id, cn.country
from customer c, address ad, country cn
where cn.country like "Canada";

-- 7d
select c.name, f.title
from category c, film f
where c.name like "Family";


-- 7e
select fl.title, fl.rental_duration
from film fl
order by fl.rental_duration desc;

-- 7f
select sl.ID, sl.city, sl.country, ss.store, ss.total_sales
from staff_list sl, sales_by_store ss;

-- 7g

select sl.ID, sl.city, sl.country, ss.store
from staff_list sl, sales_by_store ss;


-- 7h
select category, total_sales
from sales_by_film_category
order by total_sales desc
limit 5;

-- 8a
create view Top_Sales AS
select category, total_sales
from sales_by_film_category
where total_sales = (select total_sales from sales_by_film_category);

-- 8b

-- 8c










