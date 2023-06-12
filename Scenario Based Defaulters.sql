/*Screnario based Cases*/
/*Lets's say we have a customer of age between 50-55 wants to take a personal loan . What is his percentage of defaulting?*/
set @Default_Rate = (select (sum(loan_status)/count(*))*100 as default_rate from credit_risk_dataset);
select @Default_Rate;
select round((((sum(loan_status)/count(*))*100)/@Default_Rate)*100,2) as default_rate_in_Percent
from credit_risk_dataset
where person_age between 50 and 55 and loan_intent = "Personal" ;