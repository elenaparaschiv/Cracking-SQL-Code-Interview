

-- Rank the visits 
with rank_order_purchases as (
select
    user_id,
    created_at,
    product_id,
    dense_rank() OVER (PARTITION BY user_id ORDER BY created_at) as rank_visits
from marketing_campaign
ORDER BY user_id
),

-- Get the products bought on day1
day1_exclude as (
SELECT 
 user_id,
 product_id,
 created_at
FROM rank_order_purchases
WHERE rank_visits = 1
),

-- Exclude the first purchase of each user
subsequent_visits as (
SELECT
*
FROM rank_order_purchases
WHERE rank_visits !=1
),

-- from subsequent visits 
-- exclude the rows where the product in day1_exclude repeats 
exclude_repeat_1purchase as (
SELECT
    s_v.user_id,
    s_v.created_at,
    s_v.product_id
FROM subsequent_visits as s_v
LEFT JOIN day1_exclude as d1
ON  s_v.user_id = d1.user_id
AND s_v.product_id = d1.product_id
WHERE d1.user_id is NULL
AND d1.product_id is NULL
)

SELECT
    count(u_id)
FROM (
SELECT
   distinct(user_id) as u_id
FROM exclude_repeat_1purchase
) as temp