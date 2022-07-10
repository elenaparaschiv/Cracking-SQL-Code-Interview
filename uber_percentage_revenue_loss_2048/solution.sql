/*
For each service, CALC:

% incomplete orders
% revenue loss from Incomplete Orders

---
Learnings:
== The filter clause extends aggregate functions (sum, avg, count, …) by an additional where clause. 
SUM(n) FILTER (WHERE n!=null) as not_null_n
https://modern-sql.com/feature/filter
*/
SELECT 
    service_name,
    (lost_orders_number/total_orders)*100 AS orders_loss_percent,
    (lost_profit/possible_profit)*100 AS profit_loss_percent
FROM
(
SELECT 
    service_name,
    SUM(number_of_orders) AS total_orders,
    SUM(number_of_orders) 
        FILTER (
            WHERE status_of_order != 'Completed'
        ) AS lost_orders_number,
    SUM(monetary_value) AS possible_profit,
    SUM(monetary_value)
        FILTER (
            WHERE status_of_order != 'Completed'
        ) AS lost_profit
FROM uber_orders
GROUP BY 1
) tmp