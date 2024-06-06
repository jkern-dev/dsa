-- https://datalemur.com/questions/sql-department-company-salary-comparison
with dep_salaries as (
  select 
    b.department_id,
    payment_date,
    avg(a.amount) as avg_salary
    from salary a  
    inner join employee b on a.employee_id = b.employee_id
    where extract(month from payment_date) = 3
    and extract(year from payment_date) = 2024
    group by 1,2
),
comp_salary as (
  select 
  payment_date,
  avg(amount) as comp_average
  from salary     
  where extract(month from payment_date) = 3
  and extract(year from payment_date) = 2024
  group by 1
)
select 
  department_id, 
  to_char(a.payment_date, 'MM-YYYY') as payment_date,
  case 
    when avg_salary < comp_average then 'lower'
    when avg_salary > comp_average then 'higher'
    else 'same'
  end as comparison
from dep_salaries a  
inner join comp_salary b on a.payment_date = b.payment_date