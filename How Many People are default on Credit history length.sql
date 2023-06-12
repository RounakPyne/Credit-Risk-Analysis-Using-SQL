/*How Many People are default on Credit history length*/
select 
case 
	when cb_person_cred_hist_length <=5  then "5 Years"
	when cb_person_cred_hist_length > 5 and cb_person_cred_hist_length<= 10 then "5 to 10 Years"
    when cb_person_cred_hist_length > 10 and cb_person_cred_hist_length<= 15 then "10 to 15 Years"
    when cb_person_cred_hist_length > 15 and cb_person_cred_hist_length<= 20 then "15 to 20 Years"
    when cb_person_cred_hist_length > 20 and cb_person_cred_hist_length<= 25 then "20 to 25 Years"
    when cb_person_cred_hist_length > 25 and cb_person_cred_hist_length<= 30 then "25 to 30 Years"
END as `cb_person_cred_hist_length_Group`,
(sum(loan_status)/count(*))*100 as default_rate
from credit_risk_dataset
group by cb_person_cred_hist_length_Group
order by case 
	when cb_person_cred_hist_length_Group = "5 Years" Then 1
    when cb_person_cred_hist_length_Group = '5 to 10 Years' Then 2
    when cb_person_cred_hist_length_Group = '10 to 15 Years' Then 3
    when cb_person_cred_hist_length_Group = '15 to 20 Years' Then 4
    when cb_person_cred_hist_length_Group = '20 to 25 Years' Then 5
    when cb_person_cred_hist_length_Group = '25 to 30 Years' Then 6
END;