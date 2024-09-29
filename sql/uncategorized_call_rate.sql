-- https://datalemur.com/questions/uncategorized-calls-percentage
SELECT round(round(sum(case when call_category = 'n/a' or call_category is null then 1 else 0 end) / count(*)::decimal,3)*100,1) as uncategorised_call_pct  
FROM callers;