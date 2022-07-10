


/*

STEPS:
    Naive forecasting for 'distance per dollar'
    distance per dollar = distance_to_travel/monetary_cost
 
    Steps:
    
    1. SUM(distance to travel)
       SUM (monetary cos) at monthly lvl
       
    THEN calc distance per dollar
    That's the value for the current month
    
    2. Populate the forecasted value for each month
    by getting the previous month value in another column
    
    3. Calculate error metrix:
    sqrt(mean(square(actual - forecast))
    
*/

with calcs as (
SELECT
    month,
    distance_per_$ as actuals,
    LAG(distance_per_$,1) OVER (ORDER BY month) as model
FROM
(
SELECT
    distinct month,
    dist_month/monetary_cost as distance_per_$
    
FROM
(
SELECT 
    request_id
    request_date,
    EXTRACT(month from request_date) as month,
    SUM(distance_to_travel) OVER ( PARTITION BY EXTRACT(month from request_date)) as dist_month,
    SUM(monetary_cost) OVER ( PARTITION BY EXTRACT(month from request_date)) as monetary_cost
FROM uber_request_logs
ORDER BY EXTRACT(month from request_date) asc
) as temp
ORDER BY month
) as temp_2
)

/*

*/
SELECT 
    ROUND(
        sqrt(
            AVG((model-actuals)*(model-actuals))
            ):: Decimal, 2
        ) AS RMSE,
        
        -- this will give the result .
        sqrt(AVG((model-actuals)*(model-actuals))):: Decimal
        
FROM calcs