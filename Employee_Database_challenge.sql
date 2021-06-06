--retirement titles
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

--Unique titles
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


--Retirement titles
select * from unique_titles
select count(title) from unique_titles
-- create alias
select count(title) as "Title Counts"
from unique_titles;
--- Group By title count
select title, count(title)as "Title Counts"
from unique_titles
group by title

--retiring titles
select title
into retiring_titles
from unique_titles
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'

-- create alias
select count(title) as "Title Counts"
from retiring_titles

select title, count(title)as "Title Counts"
from retiring_titles
group by title
order by "Title Counts" desc;


select count(title) as "Title Counts"
from retiring_titles

select * from retiring_titles2

select title, count(title)as "Title Counts"
into retiring_titles2
from retiring_titles
group by title
order by "Title Counts" desc;

--mentorship eligibility
--first table
select * from unique_titles_1
select distinct on(emp_no)
e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date,
e.birth_date
INTO unique_titles_1
from employees as e
JOIN titles as ti
on (e.emp_no=ti.emp_no)

--Joined first and created second
select distinct on(emp_no) 
ut.emp_no,
ut.first_name,
ut.last_name,
ut.birth_date,
ut.from_date,
ut.to_date,
ut.title
INTO unique_titles_3
from unique_titles_1 as ut
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND to_date = ('9999-01-01')
order by emp_no ;



