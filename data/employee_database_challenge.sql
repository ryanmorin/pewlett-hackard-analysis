--creating a list of potential retiring employees
select e.emp_no
      ,e.first_name
      ,e.last_name
      ,t.title
      ,t.from_date
      ,t.to_date
  into retirement_titles
  from employees e
  left join titles t
    on e.emp_no = t.emp_no
 where e.birth_date BETWEEN '1952-01-01' AND '1955-12-31';
 
--creating a distinct cte called unique_titles
select DISTINCT ON (emp_no) emp_no
      ,first_name
      ,last_name
      ,title
  into unique_titles
  from retirement_titles
 order by emp_no, title; 
  
-- count the number of titles
select title
      ,count(title) as cnt
  into retiring_titles
  from unique_titles
 group by title
 order by count(title) DESC;
 
 --DROP TABLE mentorship_eligibility
 -- temp
 select DISTINCT ON (ee.emp_no) ee.emp_no
       ,ee.first_name
	   ,ee.last_name
	   ,ee.birth_date
	   ,de.from_date
	   ,de.to_date
	   ,tt.title
   into mentorship_eligibility
   from employees ee
   left join dept_employee de
     on ee.emp_no = de.emp_no
   left join titles tt
     on ee.emp_no = tt.emp_no
  where de.to_date != '9999-01-01'
    and (ee.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
  order by ee.emp_no DESC;

--retirees as a % of the total employees
 select el.title
       ,count(el.emp_no) as current_nmbr_emp
       ,r.cnt as ret_emp
       ,round((cast(r.cnt as decimal) / cast(count(el.emp_no) as decimal)),2) * 100 as pcnt_ret
   from
      (
        select DISTINCT ON (emp_no) emp_no
              ,title
              ,from_date
              ,to_date
           from titles
          order by emp_no DESC 
      ) as el
   join retiring_titles r
     on el.title = r.title
  group by el.title, r.cnt;


-- the number of employees that will be turning 65 by title in a given year
-- assumption that employees will retire in their 65 year

select DATE_PART('year',birth_date) + 65 as retirement_year
      ,ut.title
      ,count(ut.title) as nmbr_potential_retirements
      ,(cast(count(ut.title) as decimal) / cast(max(ttl_title) as decimal)) * 100 as pcnt_ttl
  from unique_titles as ut
  join employees     as e
    on ut.emp_no = e.emp_no
  join 
      (
       select title
	      ,count(title) as ttl_title
         from unique_titles
	group by title
      )   as sq_u
    on ut.title = sq_u.title
 group by (DATE_PART('year',birth_date) + 65), ut.title
 order by (DATE_PART('year',birth_date) + 65) ASC;


-- total number of employees at PH
 select DISTINCT ON (emp_no) emp_no
       ,title
   from titles
  order by emp_no DESC;	  