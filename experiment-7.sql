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



