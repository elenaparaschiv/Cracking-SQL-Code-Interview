/*
    It's important to use COALESCE
    because when we diff: 
      termination_date - hire_date  ,
     if termination_date is null,
     it should have a reference_value so COALESCE will make that
*/

SELECT
  first_name,
  last_name,
  COALESCE(termination_date, '2021-05-01') as ref_term,
  (COALESCE(termination_date, '2021-05-01') - hire_date)/365::float as years_spent,
  CASE
    WHEN termination_date is null THEN 'Yes'
    ELSE 'No'
  END as still_employed
FROM uber_employees
WHERE (COALESCE(termination_date, '2021-05-01') - hire_date) > 730