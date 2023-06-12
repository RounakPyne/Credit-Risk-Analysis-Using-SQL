/*Which Income source has the most defaulters with minimum and the maximum loan amount.*/
select
case 
when person_income <= 50000 then "Less than 50k"
when person_income >50000 and person_income <= 100000 then "50k to 1 lakh"
when person_income >100000 and person_income <= 500000 then "1 lakh to 5 lakhs"
when person_income >500000 and person_income <= 1000000 then "5 lakhs to 10 lakhs"
when person_income >1000000 and person_income <= 5000000 then "10 lakhs to 50 lakhs"
else "Greater than 50 lakhs"
end as Income_Group,
min(loan_amnt) as `Min Loan Amount`,max(loan_amnt) as `Max loan Amount`, round((sum(loan_status)/count(*))*100,2) as default_rate
from credit_risk_dataset
group by Income_Group
order by case 
when Income_Group = "Less than 50k" then 1
when Income_Group = "50k to 1 lakh" then 2
when Income_Group = "1 lakh to 5 lakhs" then 3
when Income_Group = "5 lakhs to 10 lakhs" then 4
when Income_Group = "10 lakhs to 50 lakhs" then 5
else 6
end;