-- https://datalemur.com/questions/sql-highest-grossing
select 
  category, 
  product,
  total_spend 
from (
      select 
        category, 
        product, 
        total_spend,
        row_number() over(partition by category order by total_spend desc) as product_rank
      from (
        SELECT 
          category,
          product,
          sum(spend) as total_spend
        FROM product_spend
        where extract(year from transaction_date) = '2022'
        group by category, product
      ) spending 
) agg 
where product_rank <= 2
order by category, total_spend desc 


