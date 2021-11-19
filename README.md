# MarketingCaseStudy

## OBJECTIVE

Marketing teams wants to send a personalized email to all the customers of a DVD Rental company. We need to use SQL to generate the required datapoints to populate the emails.

![image](https://user-images.githubusercontent.com/92747557/142675368-80fd6045-7095-4cc2-a9f2-373512464070.png)

## Structure

From the email  above we can extract the following structure.

- `TopCategory`
  - You have watched `TC_mnos` movies
  - That is `TC_avgd` more than the average
  - That puts you in top `TC_p` percentile
  - Movie Recommendations : `T1`, `T2`, `T3`
- `SecondCategory`
  - You have watched `SC_mnos` movies
  - That is `SC_pvh`% of your viewing history
  - Movie Recommendations: `S1`, `S2`, `S3`
- `TopActor`
  - You have watched `TA_mnos` movies of this actor
  - Movie Recommendations `A1`, `A2`, `A3`

## Requirments

Based on the structure above we can identify the following requirments

1. Identify top 2 categories `TopCategory` and `SecondCategory` for each customer
2. Identify top 3 movies for each of the top two categories (`TopCategory`:`T1`, `T2`, `T3`) and (`SecondCategory`:`S1`, `S2`, `S3`)
   1. The movies must not have been watched by the customer before
   2. All the movie recommendations must be unique
   3. Any customer with no recommendations must be flagged
3. Insights for `TopCategory`
   1. Total number of movies watched in the category  `TC_mnos`
   2. Number of movies watched more than average `TC_avgd`_
   3. Percentile of movie watchers in top category `TC_p`
4. Insights for `SecondCategory`
   1. Total number of movies watched in the category `SC_mnos`
   2. What percent of total viewing history is from this category `SC_pvh`
5. Identify the top actor `TopActorID` `TopActorFN`, `TopActorLN`
   1. Identify top 3 movie recommendations for this actor `A1`, `A2`, `A3`
   2. All movies recommendations must be unique and must be unwatched by the customer
   3. Any customer with no recommendations must be flagged



## Data Exploration

![image](https://user-images.githubusercontent.com/92747557/142676603-d99f0bec-dd67-4320-9978-72a32544cd39.png)

- Table #1 - Rental
  - Rental datapoints at a customer level
  - `rental_id` - unique for each record -- primary key
  - `customer_id` - represents each individual customer -- each record of this table represents a customer renting a dvd
  - `inventory_id` - foregin key of the inventory table
- Table # 2 - 

## Approch to the Problem

Looking at the Structure section we can identify the columns we need to have in our final table
|`customer_id`|`TopCategory`|`TC_mnos`|`TC_avgd`|`TC_p`|`T1`|`T2`|`T3`|`SecondCategory`|`SC_mnos`|`SC_pvh`|`S1`|`S2`|`S3`|`TopActorID`| `TopActorFN` | `TopActorLN` |`TA_mnos`|`A1`|`A2`|`A3`|
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| x | x | x | x | x | x | x | x | x | x | x | x | x | x | x | x | x | x | x | x | x |

