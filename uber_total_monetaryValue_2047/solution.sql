with service_name as (
    select distinct service_name from uber_orders
)


SELECT 
    EXTRACT(MONTH from order_date) as month,
    status_of_order,
    SUM(
      CASE 
        WHEN lower(service_name) = 'uber_box'
        THEN monetary_value END
    ) as uber_box,
    SUM(
      CASE 
        WHEN lower(service_name) = 'uber_clean'
        THEN monetary_value END
    ) as uber_clean,
    SUM(
      CASE 
        WHEN lower(service_name) = 'uber_food'
        THEN monetary_value END
    ) as uber_food,
    SUM(
      CASE 
        WHEN lower(service_name) = 'uber_food'
        THEN monetary_value END
    ) as uber_food,
     SUM(
      CASE 
        WHEN lower(service_name) = 'uber_glam'
        THEN monetary_value END
    ) as uber_glam,
     SUM(
      CASE 
        WHEN lower(service_name) = 'uber_kilat'
        THEN monetary_value END
    ) as uber_kilat,
     SUM(
      CASE 
        WHEN lower(service_name) = 'uber_mart'
        THEN monetary_value END
    ) as uber_mart,
     SUM(
      CASE 
        WHEN lower(service_name) = 'uber_massage'
        THEN monetary_value END
    ) as uber_massage,
     SUM(
      CASE 
        WHEN lower(service_name) = 'uber_ride'
        THEN monetary_value END
    ) as uber_ride,
     SUM(
      CASE 
        WHEN lower(service_name) = 'uber_send'
        THEN monetary_value END
    ) as uber_send,
     SUM(
      CASE 
        WHEN lower(service_name) = 'uber_shop'
        THEN monetary_value END
    ) as uber_shop,
     SUM(
      CASE 
        WHEN lower(service_name) = 'uber_tix'
        THEN monetary_value END
    ) as uber_tix
FROM uber_orders
GROUP BY 1,2
HAVING status_of_order = 'Completed'

