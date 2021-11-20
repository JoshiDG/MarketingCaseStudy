
-- 
-- testing if the relationship is indeed many to one
SELECT 
	inventory_id,
	COUNT(rental_id) AS counta
FROM
	mkcs.rental r
GROUP BY
	inventory_id
ORDER BY
	counta DESC 

SELECT
	rental_id ,
	count(inventory_id) AS counta
FROM
	mkcs.rental r
GROUP BY
	rental_id 
ORDER BY
	counta DESC
	
SELECT 
	r.inventory_id
FROM
	mkcs.rental r
WHERE 
	NOT EXISTS (
		SELECT
			*
		FROM
			mkcs.inventory i
		WHERE
			r.inventory_id = i.inventory_id
	);
-- left joining the two tables 
DROP TABLE IF EXISTS tempt;
CREATE TEMP TABLE tempt AS (
	SELECT
		r.customer_id,
		r.inventory_id,
		i.film_id,
		f.title AS ftitle,
		c.name AS cname,
		a.actor_id AS actorid,
		a.first_name AS actorfn,
		a.last_name AS actorln
	FROM
		mkcs.rental r
	LEFT JOIN mkcs.inventory i ON
		r.inventory_id = i.inventory_id
	LEFT JOIN mkcs.film f ON 
		f.film_id  = i.film_id 
	LEFT JOIN mkcs.film_category fc ON
		f.film_id = fc.film_id 
	LEFT JOIN mkcs.category c ON
		fc.category_id = c.category_id 
	LEFT JOIN mkcs.film_actor fa  ON 
		f.film_id = fa.film_id 
	LEFT JOIN mkcs.actor a  ON 
		fa.actor_id = a.actor_id 
);

DROP TABLE IF EXISTS mkcs.atable;
CREATE TABLE mkcs.atable AS(SELECT * FROM tempt);

SELECT count(DISTINCT film_id) FROM mkcs.film