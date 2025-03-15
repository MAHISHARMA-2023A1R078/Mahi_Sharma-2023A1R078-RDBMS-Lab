-- experiment 7
use scott;
show tables;
select *from emp;
select *from dept;

-- union mein rows match/ combine hoti ha
-- 2 tables ke column ko combine krna ha too join
-- //cartesian product: join se where ko omitt matlb delete krein too cartesian product bnta ha
select *from emp join dept order by dept.deptno;
-- selected recors nikalo
select *from emp join dept 
on(emp.deptno=dept.deptno)
order by dept.deptno;

-- want only ename and dname:
select ename, dname 
from emp join dept               -- ******follow this 
on(emp.deptno=dept.deptno)  -- on is used in place of where and "=" is equi join / inner join / simple join 
order by dept.deptno;


-- or 
select ename, dname 
from emp join dept 
where(emp.deptno=dept.deptno)  -- on is used in place of where "=" equi join / inner join // simple join 
order by dept.deptno;

select ename, dname,deptno 
from emp join dept 
on(emp.deptno=dept.deptno)  -- on is used in place of where "=" equi join / inner join // simple join 
order by dept.deptno;  -- gives error that deptno is ambiguous so prefix it 

select ename, dname, emp.deptno
from emp join dept 
on(emp.deptno=dept.deptno)  -- on is used in place of where "=" equi join / inner join // simple join 
order by dept.deptno;  -- attributes disjoint nhi hote mtlb common hote too table ka name prefix krna hota ha




use university2;
show tables;

desc instructors;
desc departments;
desc students;

-- name, deptid show 
select name, deptname, departments.deptid from instructors join departments
on(instructors.deptid=departments.deptid); -- on hatayenge too cartesian product

 use university2;
select name, deptname,students.deptid from students join departments
on(students.deptid=departments.deptid);




-- 12/03/25
use scott;
show tables;
desc emp;
desc dept;
select *from emp;
select*from dept;

select emp.ename, emp.sal,emp.deptno,dept.deptno,dept.dname,dept.loc /* table name_col name*/
from emp join dept; -- cartesian product 

-- filter equall ko join 
select emp.ename, emp.sal,emp.deptno,dept.deptno,dept.dname,dept.loc /* table name_col name*/
from emp join dept
on(emp.deptno=dept.deptno); 


 -- as we are using = operator so k/as "equi join"
select emp.ename, emp.sal,dept.dname,dept.loc /* table name_col name*/
from emp join dept
on(emp.deptno=dept.deptno);

-- natural join automatically checks konsa common ha  (type of equi join is natural join)
 select emp.ename, emp.sal,dept.dname,dept.loc /* table name_col name*/
from emp natural join dept;  -- single col common hona chiye in  natural join and table alaiasing not used 

select *from salgrade;

-- empname, salary and garde;
#non equi join
select e.ename,e.sal,s.grade, s.losal, s.hisal
from emp e join salgrade s
on e.sal between s.losal and s.hisal; -- table aiasing   -- between operation used for join k/as non equi join.

select *from emp;
select * from dept;

-- join a table to itself k/as self join #self join 
select e.ename as empname, m.ename as mgrname -- alisaing 
from emp e join emp m 
on (e.mgr = m.empno);


select ename,dname -- operations missing
from emp join dept
on(emp.deptno=dept.deptno); 
-- vo dept jismein emp nhi ha  

select ename,dname -- operations missing
from emp right outer join dept
on(emp.deptno=dept.deptno); 
-- vo dept jismein emp nhi ha  -- right outer join -- right side table dept ka op missing dept bhi dikhana tha 


select ename,dname -- operations missing
from emp left outer join dept
on(emp.deptno=dept.deptno); 
-- vo dept jismein emp nhi ha  -- emp jisko koi dept assign nhi h vo bhi dikhega //match and unmatch both dikhane ha 


insert into emp values(999,'MAHI','MANAGER',7566,'1982-12-09',2000,NULL,NULL); 

-- //*******full outer join********
-- by union of left and right outer join
select ename,dname -- operations missing
from emp left outer join dept
on(emp.deptno=dept.deptno)
-- vo dept jismein emp nhi ha  -- emp jisko koi dept assign nhi h vo bhi dikhega //match and unmatch both dikhane ha 
union
select ename,dname -- operations missing
from emp right outer join dept
on(emp.deptno=dept.deptno); 
-- vo dept jismein emp nhi ha  -- right outer join -- right side table dept ka op missing dept bhi dikhana tha 

-- order by clause in last of query and col alias clause in first of query  --in union query 

use hr;
show tables;
desc employees;
desc departments;
 -- 2 col common dept id and manager id
 
 -- first name and dept name from emp and dept tables;
 select first_name, department_name 
 from employees join departments
 on(employees.department_id=departments.department_id);
 -- giving nick name
 select e.first_name, d.department_name
 from employees e join departments d
 on(e.department_id=d.department_id); -- 2 columns common so not use natural join 
 
 -- kuch dept having no employess // unmatch dept 
  select e.first_name, d.department_name
 from employees e right outer join departments d
 on(e.department_id=d.department_id);   -- dept havinh no employees
 
 -- vo emp jinko dept assign nhi h
  select concat(e.first_name," ",e.last_name) fullname, d.department_name
 from employees e left outer join departments d
 on(e.department_id=d.department_id)   -- to show full name using concat also and match/unmatch from both tables using left and outer join
 union 
   select concat(e.first_name," ",e.last_name) fullname, d.department_name
 from employees e right outer join departments d
 on(e.department_id=d.department_id);
 
 
 
#VIEWS
-- deptname , dept total sal, min d=salary , avg sal, no of emp -- dept ka data dept se aur emp ka emp se
select department_name, max(salary)as maxsal, 
min(salary) as minsal,
avg(salary) as avgsal,
sum(salary) as sumsal,  
count(*) as noofemp
from employees e join departments d
on (e.department_id=d.department_id)
group by department_name; -- roj query likhoge too task roj perform krna hoga

#-- VIEW easy way iss query ko view banadege name dege iss query ko
create view deptsalreport as 
select department_name, max(salary)as maxsal, 
min(salary) as minsal,
avg(salary) as avgsal,
sum(salary) as sumsal,  
count(*) as noofemp  -- ye query background mein chegi
from employees e join departments d
on (e.department_id=d.department_id)
group by department_name;

 select *from deptsalreport; -- data complexity easy 
 
 select count(*) from employees; --  no of emp count hoge
 select department_id, count(*) from employees group by department_id; -- table ke andar group by 
 
 use university;
 -- join instructor and dept name from instr and dept by equi join
 
 