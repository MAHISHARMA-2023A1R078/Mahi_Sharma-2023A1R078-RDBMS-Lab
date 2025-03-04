-- ifnull
use university2;
show tables;
-- null pe meaning full data
select ifnull(null,"na");

select ifnull(10,"na"); -- null pe 2nd attribute  chlta, value pe 1st attribute

-- multirow fns.
show tables;
select max(salary) maxsal from instructors;  -- exp = column name as maxal likhno nhi likho no matter
select max(salary) as maxsal from instructors;
select min(salary) maxsal from instructors;

select max(salary) maxsal,
min(salary) as minsal,
round(avg(salary),2) as avgsal from instructors;   --  round is single row fn here and 2 places tak decimal print honge
select round(avg(salary)) as avgsal from instructors;  


select max(salary) maxsal,
min(salary) as minsal,
round(avg(salary),2) as avgsal,
sum(salary) as sumsal
 from instructors;   
 
 desc instructors;
 
 -- total imstructors kitne ha how many employees are there in the company
 select max(salary) maxsal,
min(salary) as minsal,
round(avg(salary),2) as avgsal,
sum(salary) as sumsal,
count*(instructorid) as noofemp
 from instructors;   
 
 
 select *from departments;

-- department wise max salary
select deptid, max(salary) 
from instructors
group by deptid;

select deptid, max(salary),count(*) 
from instructors          -- no of employees
group by deptid;

select* from students;

select count(*) from students; -- pure table meim kitne students

select deptid, count(*) from students group by deptid;
