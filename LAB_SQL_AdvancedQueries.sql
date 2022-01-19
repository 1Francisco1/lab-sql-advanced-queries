-- 1.List each pair of actors that have worked together.
select a.actor_id, b.actor_id , a.film_id from film_actor a
join film_actor b on a.actor_id < b.actor_id
and a.film_id = b.film_id;


-- 2.For each film, list actor that has acted in more films.
select film_id, actor_id from (
select b.film_id, a.actor_id, row_number() over(partition by a.film_id order by max desc) as is_max from film_actor a
join (select a.film_id , max(abc) as max from film_actor a
join (select actor_id, count(film_id) as abc from film_actor
group by actor_id
order by count(film_id) desc) b on a.actor_id = b.actor_id
group by a.film_id) b on a.film_id = b.film_id) sub2
where is_max = 1;


select a.film_id , max(abc) from film_actor a
join (select actor_id, count(film_id) as abc from film_actor
group by actor_id
order by count(film_id) desc) b on a.actor_id = b.actor_id
group by a.film_id;

select actor_id, count(film_id) from film_actor
group by actor_id
order by count(film_id) desc;

