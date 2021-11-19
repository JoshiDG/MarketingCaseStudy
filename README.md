# MarketingCaseStudy

## OBJECTIVE

Marketing teams wants to send a personalized email to all the customers of a DVD Rental company. We need to use SQL to generate the required datapoints to populate the emails.

## Email

![image](https://user-images.githubusercontent.com/92747557/142675368-80fd6045-7095-4cc2-a9f2-373512464070.png)

## Structure

From the email structure above we can extract the following structure.
- `TopCategory`
    - You have watched `TC_mnos` movies
    - That is `TC_avgm` more than the `AVERAGE`
    - That puts you in top `TC_p` percentile
    - Movie Recommendations : `T1`, `T2`, `T3`
- `SecondCategory`
    - You have watched `SC_mnos` movies
    - That is `SC_vh`% of your viewing history
    - Movie Recommendations: `S1`, `S2`, `S3`
- `TopActor`
    - You have watched `TA_mnos` movies of this actor
    - Movie Recommendations `A1`, `A2`, `A3`
 
1. _If there are any ties in top actor - we will select alphabetically_
2. _All the movie recommendations must be unique_
3. _All the movie recommendations must be unwatched_
4. _Raise flag if there is any user with no movie recommendation in any category_

## Data Exploration
![image](https://user-images.githubusercontent.com/92747557/142676603-d99f0bec-dd67-4320-9978-72a32544cd39.png)
- Table #1 - Rental
        - Rental datapoints at a customer level
        - `rental_id` - unique for each record -- primary key
        - `customer_id` - represents each individual customer -- each record of this table represents a customer renting a dvd
        - `inventory_id` - foregin key of the inventory table

##
