
SELECT
    SUM(
        CASE 
            WHEN hire_date=(select min(hire_date) FROM uber_employees) 
            THEN 1 else 0 END 
    ) as shortest_tenured_count,
    SUM(
        CASE WHEN hire_date = (SELECT max(hire_date) FROM uber_employees)
        THEN 1 else 0 END
    ) as longest_tenured_count,
    max(hire_date) - min(hire_date) as diff

FROM uber_employees
WHERE termination_date is null