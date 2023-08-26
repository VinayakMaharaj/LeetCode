# Write your MySQL query statement below
with recursive merged_results as (
SELECT fail_date as event_date, "failed" as period_state FROM Failed
where fail_date between CAST('2019-01-01' AS DATE) and CAST('2019-12-31' AS DATE)
UNION
SELECT success_date as event_date, "succeeded" as period_state FROM Succeeded
where success_date between CAST('2019-01-01' AS DATE) and CAST('2019-12-31' AS DATE)
), switch_points as (
    SELECT *, 1 as switch_point FROM merged_results where event_date = (select min(event_date) from merged_results)
    UNION ALL
    SELECT merged_results.*,
        CASE when merged_results.period_state=switch_points.period_state THEN switch_points.switch_point
        ELSE switch_points.switch_point+1 END as switch_point
    FROM merged_results, switch_points
    where merged_results.event_date=switch_points.event_date+ INTERVAL 1 DAY
) SELECT period_state, min(event_date) as "start_date", max(event_date) as "end_date"
from switch_points
GROUP by switch_point, period_state;