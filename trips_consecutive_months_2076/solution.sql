

/*
SOLUTION 1 PROPOSED  ====

- THIS will self join all possible combinations that have TRUE in is_completed 

- THEN by extracting year and * 12 you will get nr of months. 
+ EXTRACT months 

At least 1 trip/ month is automatically taken care by is_completed
*/


select
    distinct u1.driver_id
from uber_trips u1
join uber_trips u2 
on u1.driver_id = u2.driver_id
where u1.is_completed = 'TRUE' 
and u2.is_completed = 'TRUE'
and 
(
    (   EXTRACT('YEAR' FROM u2.trip_date) * 12 +
        EXTRACT('MONTH' FROM u2.trip_date)
    )
 -
    (
        EXTRACT('YEAR' FROM u1.trip_date) * 12 +
        EXTRACT('MONTH' FROM u1.trip_date)
    )
) = 1;


