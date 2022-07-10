
with t1 as (
SELECT
    to_char(request_date::DATE, 'yyyy-mm') as request_m,
    distance_to_travel / monetary_cost as daily_dist_$,
    
    (sum(distance_to_travel) OVER (PARTITION BY to_char(request_date::date, 'yyyy-mm'))
    /sum(monetary_cost) OVER (PARTITION BY to_char(request_date::date, 'yyyy-mm'))) as month_dist_$
FROM uber_request_logs
),

-- for each row of data we need to get the decimal absolute
t2 as (
SELECT
 request_m,
 ABS(daily_dist_$ - month_dist_$)::decimal as abs_dist_$
FROM t1
),

t3 as (
SELECT
    request_m,
    round(avg(abs_dist_$),2) as diff
FROM t2
GROUP BY 1
)

SELECT * FROM t2

