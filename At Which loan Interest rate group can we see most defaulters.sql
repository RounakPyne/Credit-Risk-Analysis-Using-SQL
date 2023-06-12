/*At Which loan Interest rate group can we see most defaulters*/
select 
case 
	when loan_int_rate > 5 and loan_int_rate<= 10 then "5 to 10 Percent"
	when loan_int_rate > 10 and loan_int_rate<= 15 then "10 to 15 Percent"
    when loan_int_rate > 15 and loan_int_rate<= 20 then "15 to 20 Percent"
    when loan_int_rate > 20 then "Greater than 20 Percent"
END as `loan_int_rate_Group`,
(sum(loan_status)/count(*))*100 as default_rate
from credit_risk_dataset
group by loan_int_rate_Group
order by case 
	when loan_int_rate_Group = '5 to 10 Percent' Then 1
    when loan_int_rate_Group = '10 to 15 Percent' Then 2
    when loan_int_rate_Group = '15 to 20 Percent' Then 3
    when loan_int_rate_Group = 'Greater than 20 Percent' Then 4
END;

select loan_int_rate from credit_risk_dataset
order by loan_int_rate desc
