# MarketingCaseStudy

**OBJECTIVE:** Marketing teams wants to send a personalized email to all the customers of a DVD Rental company. We need to use SQL to generate the required datapoints to populate the emails. 

![image](https://user-images.githubusercontent.com/92747557/142675368-80fd6045-7095-4cc2-a9f2-373512464070.png)

From the email structure above we can extract the following structure.
**Structure:**
- `TopCategory`
    - You have watched `A` filmes
    - That is `B` more than the `AVERAGE`
    - That puts you in top `C` percentile
    - Movie Recommendations : `T1`, `T2`, `T3`
- `SecondCategory`
    - You have watched `D` filmes
    - That is `E`% of your viewing history
    - Movie Recommendations: `S1`, `S2`, `S3`
- `TopActor`
    - You have watched `F` films of this actor
    - Movie Recommendations `A1`, `A2`, `A3`
 
_1. If there are any ties in top actor - we will select alphabetically_

_2. All the movie recommendations must be unique_

_3. All the movie recommendations must be unwatched_

_4. Raise flag if there is any user with no movie recommendation in any category_
