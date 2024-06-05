-- https://datalemur.com/questions/yoy-growth-rate
select 
  year,
  product_id,
  curr_year_spend,
  prev_year_spend,
  round(((curr_year_spend - prev_year_spend) / prev_year_spend) * 100.0,2) as yoy_rate
from (
      select 
        year,
        product_id,
        year_spend as curr_year_spend,
        lag(year_spend) over(partition by product_id order by year asc) as prev_year_spend
      from (
        SELECT 
          extract(year from transaction_date) as year,
          product_id,
          sum(spend) as year_spend
        FROM user_transactions
        group by 1,2
        ) agg 
) yoy 
order by product_id, year


