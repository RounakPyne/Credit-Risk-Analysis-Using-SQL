/*At Which loan amount group can we see most defaulters*/
select 
case 
	when loan_amnt <= 1000 then "Less Than 1000"
	when loan_amnt > 1000 and loan_amnt<= 10000 then "1000 to 10000"
    when loan_amnt > 10000 and loan_amnt<= 25000 then "10000 to 25000"
    when loan_amnt > 25000 then "Greater than 25000"
END as `Loan_amt_group`,
(sum(loan_status)/count(*))*100 as default_rate
from credit_risk_dataset
group by Loan_amt_group
order by case 
	when Loan_amt_group = 'Less Than 1000' Then 1
    when Loan_amt_group = '1000 to 10000' Then 2
    when Loan_amt_group = '10000 to 25000' Then 3
    when Loan_amt_group = 'Greater than 25000' Then 4
END;

