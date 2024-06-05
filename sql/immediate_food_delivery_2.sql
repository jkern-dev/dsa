-- https://leetcode.com/problems/immediate-food-delivery-ii/description/
select 
round((sum(case when order_date = customer_pref_delivery_date then 1 else 0 end) / count(*)*100),2) as immediate_percentage
from
(
    select 
        customer_id, 
        order_date, 
        customer_pref_delivery_date,
        row_number() over(partition by customer_id order by order_date asc) as order_num
    from delivery
) agg
where order_num = 1