-- https://datalemur.com/questions/compensation-outliers
with average_salaries as (
  select title, avg(salary) as title_avg
  from employee_pay
  group by 1
)

select 
  employee_id,
  salary,
  case 
    when salary > (2*title_avg) then 'Overpaid'
    when salary < (title_avg/2) then 'Underpaid'
  end as status
from employee_pay a
inner join average_salaries b on a.title = b.title 
  and (salary > (2*title_avg) or salary < (title_avg/2))
