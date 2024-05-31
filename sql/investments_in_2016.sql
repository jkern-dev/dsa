-- https://leetcode.com/problems/investments-in-2016/?envType=study-plan-v2&envId=top-sql-50
with unique_lat_lon as (
    select lat, lon, count(*)
    from Insurance
    group by 1,2
    having count(*) = 1
),
multiple_tiv_2015 as (
    select tiv_2015, count(*)
    from Insurance
    group by 1
    having count(*) > 1
)
select round(sum(tiv_2016),2) as tiv_2016
from Insurance 
where tiv_2015 in (select tiv_2015 from multiple_tiv_2015)
and concat(lat,lon) in (select concat(lat,lon) from unique_lat_lon)