-- https://datalemur.com/questions/card-launch-success
with ranked_months as (
  SELECT 
    card_name,  
    issue_year,
    issue_month,
    issued_amount,
    rank() over(partition by card_name order by issue_year, issue_month) as launch_month
  FROM monthly_cards_issued
)
select card_name, issued_amount
from ranked_months
where launch_month = 1
order by issued_amount desc
