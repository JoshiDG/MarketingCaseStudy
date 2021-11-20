# Step 1 - Creating the analysis table

In this step the objective is to crete an analysis table over with all the relevent datapoints over which the airthmatic operations can be performed.

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
------
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

#### Joining

Because all the records of the two tables are overlappig we can use left join and inner join interchangebly. Running left join on the table to extract the relevent columns (`customer_id`, `inventory_id`, `film_id`)

The output now looks like
|`customer_id`|`inventory_id`|`film_id`|
| ----------- | ----------- | ----------- | 
| x | x | x |

### output <> `film`

We need to find the corresponding film `titles` as `ftitles` for each `film_id` to include in our result table
Both hypothesis 1 and 2 are tested for these 2 tables and no discrepencies are found. We will add this column to our output.

The output now looks like

|`customer_id`|`inventory_id`|`film_id`|`ftitle`|
| ----------- | ----------- | ----------- | ----------- |
| x | x | x | x |

### output <> `film_category` <> `category`

By left joining these 2 tables we can find the corresponding category names of each film. 

|`customer_id`|`inventory_id`|`film_id`|`ftitle`|`cname`|
| ----------- | ----------- | ----------- | ----------- | ----------- |
| x | x | x | x | x |

We can check that all the values of `ftitle` are unique; So there is no need to keep `film_id`.

The output now looks like

|`customer_id`|`inventory_id`|`ftitle`|`cname`|
| ----------- | ----------- | ----------- | ----------- |
| x | x | x | x |

### output <> `film_actor` <> `actor`

By joining with these we can find the `actor_ID`, `ActorFN`, and `ActorLN` values

The output now looks like 

|`customer_id`|`inventory_id`|`ftitle`|`cname`|`actorid`|`actorfn`|`actorln`|
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| x | x | x | x | x | x |

### Analysis table 

We now have all the information we need to populate the result table. We will input these datapoints form temporary table to out analysis table `atable`

The analysis table now looks like

|`customer_id`|`inventory_id`|`ftitle`|`cname`|`actorid`|`actorfn`|`actorln`|
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| x | x | x | x | x | x |