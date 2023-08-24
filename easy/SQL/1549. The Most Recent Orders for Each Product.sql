# Write your MySQL query statement below
with cte as (
	select order_id, product_id, order_date, dense_rank() over (partition by product_id order by order_date desc) as rk
	from Orders
)
select b.product_name, a.product_id, a.order_id, a.order_date
from cte a
left join Products b
on a.product_id = b.product_id
where a.rk = 1
order by product_name, product_id, a.order_id