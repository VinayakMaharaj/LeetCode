# Write your MySQL query statement below
with cte as (select o.customer_id, o.product_id, p.product_name, count(o.product_id) as count_prod, rank() over(partition by o.customer_id order by count(o.product_id) desc) as rank_prod
from Orders o join Products p on o.product_id = p.product_id
group by o.customer_id, o.product_id, p.product_name
)
select customer_id, product_id, product_name
from cte
where rank_prod = 1