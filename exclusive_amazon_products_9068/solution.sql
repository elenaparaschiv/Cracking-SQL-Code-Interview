

with macys as (select distinct product_name, mrp from innerwear_macys_com ORDER BY product_name),

topshop as (select distinct product_name, mrp from innerwear_topshop_com ORDER BY product_name),

SELECT
  product_name, mrp, brand_name, price, rating
FROM innerwear_amazon_com
where (product_name,mrp) NOT IN 
(
SELECT
    *
  FROM macys
  UNION ALL
  SELECT
    *
  FROM topshop

)