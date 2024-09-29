-- https://datalemur.com/questions/sql-histogram-tweets
select 
tweet_count as tweet_bucket, 
count(user_id) as users_num
from (
  SELECT 
    user_id, 
    count(*) as tweet_count 
  FROM tweets
  where extract(year from tweet_date) = 2022
  group by 1
) agg 
group by 1;