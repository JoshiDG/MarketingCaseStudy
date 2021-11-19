
-- testing if the relationship is indeed many to one
SELECT 
	inventory_id,
	COUNT(customer_id)
FROM
	mkcs.rental r
GROUP BY
	inventory_id
ORDER BY
	inventory_id