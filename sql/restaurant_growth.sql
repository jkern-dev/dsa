-- https://leetcode.com/problems/restaurant-growth/submissions/1272923655/?envType=study-plan-v2&envId=top-sql-50
with total_cte as
(
  select distinct 
         visited_on, 
         SUM(amount) over (order by visited_on
                           range between interval 6 day preceding
                           and current row) AS amount
  from Customer
)
select 
    visited_on,
    amount,
    round(amount/7, 2) as average_amount
    from total_cte a
    inner join (select min(visited_on) as min_visit from total_cte) b on datediff(visited_on, min_visit) >= 6