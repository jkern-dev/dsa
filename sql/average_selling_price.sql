-- https://leetcode.com/problems/average-selling-price/?envType=study-plan-v2&envId=top-sql-50
select 
    a.product_id, 
    case 
        when sum(b.units) is null then 0 
        else round(sum(a.price*b.units) / sum(b.units),2)
    end as average_price
from prices a
left join unitssold b on a.product_id = b.product_id 
                        and b.purchase_date between a.start_date and a.end_date
group by 1;