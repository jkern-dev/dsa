-- https://datalemur.com/questions/fill-missing-product
WITH filled_category AS (
SELECT
  *,
  COUNT(category) OVER (
    ORDER BY product_id) AS numbered_category
FROM products
)
select 
  product_id,
  coalesce(category, max(category) over (partition by numbered_category)) as category,
  name
from filled_category