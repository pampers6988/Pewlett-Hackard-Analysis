select
e.emp_no, 
e.first_name, 
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
from employees as e
join titles_1 as ti
on (e.emp_no=ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no ;


select * from retirement_titles

drop table distinct_retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT COUNT(title), title 
INTO retiring_titles
from unique_titles
group by title
order by count desc;

----mentorship queries

select distinct on(emp_no)
e.emp_no, 
e.first_name, 
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibility
from employees as e
inner join dept_emp as de
on (e.emp_no=de.emp_no)
inner join titles_1 as ti
on (e.emp_no=ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
order by e.emp_no ;

drop table mentorship_eligibility
select * from mentorship_eligibility


SELECT COUNT(title), title 
from mentorship_eligibility
group by title
order by count desc;


SELECT COUNT(title), title 
from mentorship_eligibility
group by title
order by count desc;

SELECT COUNT(title), title 
from retiring_titles
group by title
order by count desc;

--- extra tables for analysis
select
rt.emp_no,
rt.title,
rt.to_date,
s.salary,
e.birth_date
into retirement_title_salaries
from retirement_titles  as rt
inner join salaries as s
on (rt.emp_no=s.emp_no)
inner join employees as e
on (rt.emp_no=e.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (me.to_date = '9999-01-01')

select
me.emp_no,
me.title,
me.to_date,
s.salary,
me.birth_date
into mentorship_eligibility_salaries
from mentorship_eligibility  as me
inner join salaries as s
on (me.emp_no=s.emp_no)
WHERE (me.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
group by me.emp_no, me.title,me.to_date,me.birth_date,s.salary 
order by title, salary desc;


-- No of emp eligible to retire with title 
select 
e.emp_no,
e.birth_date,
e.first_name,
e.last_name,
c.to_date,
t.title
from employees as e
inner join current_emp as c
on (e.emp_no=c.emp_no)
inner join unique_titles as t
on (e.emp_no=t.emp_no)
order by emp_no ;


select
e.emp_no,
e.birth_date,
e.first_name,
e.last_name,
c.to_date,
t.title
INTO emp_ret_eligible
from employees as e
inner join current_emp as c
on (e.emp_no=c.emp_no)
inner join unique_titles as t
on (e.emp_no=t.emp_no)
order by emp_no ;


--current_employee_title
select
e.emp_no,
e.to_date,
t.title
INTO current_employee_title
from current_emp as e
inner join unique_titles as t
on (e.emp_no=t.emp_no)
order by t.title
