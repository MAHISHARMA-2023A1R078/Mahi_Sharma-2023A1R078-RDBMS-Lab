create database spdemo; # stored procedure demo
use spdemo;
set autocommit=0;
# A SQL Stored Preocedure and functions are collection of sql statements bundled together to p[erform a specific task.
-- These Procedures are stored in the database and can be called upon by users, applications, or other procedures.
-- Stored Procedures are essential for automating database tasks, improving efficiency, and reducing redundancy.

# create procedure name(para1,para2,...)          -- procedure can have paramters 
# begin        -- start o the procedure bpdy
#     proc body                                   # syntax of stored procedure
# end       -- end of the procedure bpdy

create table employees
(eid int,
name varchar(20) not null,
salary decimal(8,2),
email varchar(20),
gender char(1),
primary key(eid),
unique(email),   -- table level  constraints , only not null is column level constarint not a table level
check(salary>0),
check(gender in(binary('M'), binary('F')))
);
desc employees;
show tables;

# procedure banana ha jo employee record ko insert krne mein help krega
-- procedure shuru hone se pehle delimiter change krna ha  phir last mwein phirse change
delimiter // 
create procedure insemp(in empno int, in ename varchar(20), in sal decimal(8,2), in eemail varchar(20), in gen char(1))
begin
     insert into employees values (empno,ename,sal,eemail,gen);
 end //
 delimiter ;
 select * from employees;
 call insemp(101,'James',80000,'James@gmail.com','M');
 

-- employee ka mail change krna ha behalf of eid
delimiter //
create procedure updateemail(in empno int, in newemail varchar(20))
begin
update employees set email=newemail where eid=empno;
end//
delimiter ;
select *  from employees;
call updateemail(101,'Jamesnew@gmail.com'); 
call insemp(102,'King',90000,'King@gmail.com','M');
call insemp(103,'neena',100000,'neena@gmail.com','F');
commit;
select * from employees;

# delete emp
delimiter //
create procedure delemp(in empno int)
begin
delete from employees where eid=empno;
end//
delimiter ;
call delemp(101);
commit;
select * from employees;

# search emp krna h using procedure too seleect * from likhna ha in query 
delimiter //
create procedure searchemp(in empno int)
begin
    select * from employees where eid=empno;
end//
delimiter ;

call searchemp(101); --- yeh delete hochuka ha 
call searchemp(102);
commit; -- mtlb changes save hojaygei 
# ***** agar procedure ,ein kuch galat hiogya too drop procedure procedure_name;


####Funtion####
-- fn. used to modify the values 
#annual salary chhiye emp ki  0-- emp ki salarty return krege *12 kekre
delimiter //
create function getasal(empno int)
returns decimal(10,2)
deterministic -- alredy we know dataset ha hmara 
begin
declare asal decimal(10,2) default 0;
select salary into asal from employees where eid=empno;
return asal*12;
end//
delimiter ; 

drop function getasal ; -- galat hogya tha empno

-- how to call this fn:
select eid, name, salary, getasal(eid) from employees;



