-- https://leetcode.com/problems/capital-gainloss/
select 
    stock_name, 
    sum(
            if(
                operation='sell',price,-price
            )
        ) as capital_gain_loss
from stocks
group by 1