-- https://datalemur.com/questions/sql-average-deal-size-2
with customer_info as (
select
  a.customer_id,
  case 
    when employee_count < 100 then 'SMB'
    when employee_count between 100 and 999 then 'Mid-Market'
    else 'Enterprise'
  end as market_segment,
  b.yearly_seat_cost * num_seats as total_revenue
from customers a  
inner join contracts b on a.customer_id = b.customer_id
),
average_deal_size as (
  select 
    market_segment,
    sum(total_revenue) / count(distinct customer_id) as average_revenue
  from customer_info
  group by 1
)
select 
  sum(average_revenue) filter (where market_segment = 'SMB') as smb_avg_revenue,
  sum(average_revenue) filter (where market_segment = 'Mid-Market') as mid_avg_revenue,
  sum(average_revenue) filter (where market_segment = 'Enterprise') as enterprise_avg_revenue
from average_deal_size

