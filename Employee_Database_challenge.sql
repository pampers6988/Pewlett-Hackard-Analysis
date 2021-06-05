#retirement titles
select
e.emp_no, 
e.first_name, 
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
from employees as e
join titles as ti
on (e.emp_no=ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no ;

#Unique titles
select distinct on(e.emp_no)
e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date,
e.birth_date
INTO unique_titles
from employees as e
JOIN titles as ti
on (e.emp_no=ti.emp_no)
