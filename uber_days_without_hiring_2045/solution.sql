
SELECT
  max(fire_diff),
  max (hire_diff)
FROM(
SELECT 
  
  hire_date - lag(hire_date) over (order by hire_date) as hire_diff,
  
  termination_date - lag(termination_date) over (order by termination_date) as fire_diff
from uber_employees
) as a

