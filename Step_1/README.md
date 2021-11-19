# Step 1 - Finding `TopCategory` and `SecondCategory`

In this stop the objective is to find `TopCategory` and `SecondCategory` for each `CustomerID` and insert these 3 values into the result table

## Analysis Table

An intermediate analysis table will be required to identify the `TopCategory` and `SecondCategory` values

## Join Journey

We will start with mapping the join journey to find the values for `TopCategory` and `SecondCategory`.

Join journey will flow as following : 
- `rental` for `customer_id`
- join with `inventory` table over `inventory_id` 
- join with `film_category` table over `film_id`
- join with `film` table over `film_id`
- join with `category` table over `category_id`
- join with `actor`table over `film_id`
- join with `actor` table over `actor_id`

### Rental<>Inventory

#### Hypothesis 1

Each inventory item can be rented out multiple times so this should be Many to one relationship
**Testing:** 

``` sql
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
```

Using the above query it can be confirmed that there are multiple `rental_id` for each `inventory_id` but there is only 1 inventory id for each `rental_id`

#### Hypothesis 2

All the `inventory_id` values in `rental` table will exists in `inventory` table and vice versa
**Testing**

```sql
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


```