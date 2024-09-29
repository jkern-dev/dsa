-- https://datalemur.com/questions/sql-bloomberg-stock-min-max-1
with price_ranks as (
  select 
    ticker,
    year_month,
    low,
    row_number() over (partition by ticker order by low asc) as low_rank,
    high,
    row_number() over (partition by ticker order by high desc) as high_rank
  from (
    SELECT 
      ticker,
      to_char(date, 'Mon-YYYY') as year_month,
      min(open) as low,
      max(open) as high
    from stock_prices
    group by ticker, year_month
    ) agg 
)
select distinct 
  a.ticker,
  high.year_month as highest_mth,
  high.high as highest_open,
  low.year_month as lowest_mth,
  low.low as lowest_open
from stock_prices a  
inner join price_ranks high on a.ticker = high.ticker and high.high_rank = 1
inner join price_ranks low on a.ticker = low.ticker and low.low_rank = 1
order by a.ticker