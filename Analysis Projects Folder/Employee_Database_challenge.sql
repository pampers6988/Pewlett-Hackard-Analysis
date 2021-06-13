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
