# Write your MySQL query statement below
with cte1 as (
select user_id, visit_date, lead(visit_date,1 ,'2021-1-1') over (partition by user_id order by visit_date) dt
from UserVisits )

select user_id, max(timestampdiff(day, visit_date, dt)) biggest_window
from cte1
group by user_id
having biggest_window = max(timestampdiff(day, visit_date, dt) );