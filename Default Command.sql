/*Creating and using the Database.*/
create database Credit_Risk_Analysis;
use Credit_Risk_Analysis;
/*Total Number of defaulters in current data*/
select (sum(loan_status)/count(*))*100 as default_rate
from credit_risk_dataset;
/*Dealing with null values in the data*/
update credit_risk_dataset
set loan_int_rate = null 
where loan_int_rate = 1111;
/*Load Table*/
select * from credit_risk_dataset;
/*Null Loan interest changed based avg interest rate on the internet as of 12/06/2023.*/
update credit_risk_dataset
set loan_int_rate = 12.44
where loan_int_rate is null and loan_intent = 'DEBTCONSOLIDATION' ;

