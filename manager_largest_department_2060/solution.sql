with emp as (
    select
        department_id,
        count(*) ,
        rank() over(order by count(*) desc) as rnk
    from az_employees
    group by department_id
)

select
    first_name,
    last_name
from az_employees
where position ilike '%manager%'
and department_id in (
    select 
    department_id 
    from emp where rnk = 1
)


