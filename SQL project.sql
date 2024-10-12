create database bank_analysis;
use bank_analysis;

select * from finan_1;	
select * from finance_2;


-- KPI 1 :- Year wise loan amount Stats

select year(issue_d) as issue_date, concat(format(sum(loan_amnt)/1000000,0),'M') as loan_amt
from finan_1
group by year(issue_d)
order by year(issue_d);


-- KPI 2 :- Grade and sub grade wise revol_bal

select grade,sub_grade, sum(revol_bal)
from finan_1 join finance_2
on finan_1.id = finance_2.id
group by grade,sub_grade
order by grade;


-- KPI 3 :- Total Payment for Verified Status Vs Total Payment for Non Verified Status

select  verification_status, concat(format(sum(total_pymnt)/1000000,1),'M') as total_payment
from finan_1 join finance_2 
on finan_1.id = finance_2.id
group by verification_status
order by total_payment;

-- KPI 4 :- State wise and month wise loan status

select addr_state, monthname(issue_d), loan_status
from finan_1
group by addr_state, monthname(issue_d), loan_status;


-- KPI 5 :- Home ownership Vs last payment date stats

select home_ownership, last_pymnt_d
from finan_1 join finance_2
on finan_1.id = finance_2.id
group by home_ownership, last_pymnt_d;	

-- year wise total funded amount

select year(issue_d) as year, concat(format(sum(funded_amnt)/1000000,1),'M') as Yearly_funded_amt
from finan_1
group by year(issue_d)
order by year(issue_d);

-- year wise average intrest rate

select year(issue_d), concat(format(avg(int_rate),2), ' %')
from finan_1 
group by year(issue_d)
order by year(issue_d);






