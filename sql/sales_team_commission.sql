-- https://datalemur.com/questions/sales-team-compensation
with total_deals as (
  select 
    a.employee_id,
    base,
    commission,
    quota,
    accelerator,
    sum(deal_size) as total_deals
  from employee_contract a 
  inner join deals b on a.employee_id = b.employee_id
  group by 1,2,3,4,5
)
select 
  employee_id,
  case 
    when total_deals < quota then base + (total_deals * commission)
    when total_deals = quota then base + (total_deals * commission)
    when total_deals > quota then base + (quota*commission) + (commission*(total_deals - quota)*accelerator)
  end as total_compensation
from total_deals
order by total_compensation desc, employee_id