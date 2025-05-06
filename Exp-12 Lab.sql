# Aim:-To implement procedures and functions.


/*
A SQL Stored Procedure and functions are collection of SQL 
statements bundled together to perform a specific task. 
These procedures are stored in the database and can be 
called upon by users, applications, or other procedures. 
Stored procedures are essential for automating database 
tasks, improving efficiency, and reducing redundancy. 

Syntax of procedure:-
create procedure name(in para1 type, in para2 type,...)
begin
    proc body
end 

Syntax of function:-
create function name(para1 type ,para2 type,...)
returns para type
determenestic
begin
    proc body
end
*/


set autocommit=0;
create database subprograms;
use subprograms;

/*sample schema */
create table employees
(
eid int,name varchar(20) not null,
salary decimal(8,2),email varchar(20),
gender char(1),primary key(eid),
unique(email),check (salary>0),
check (gender in(binary('M'),binary('F')))
);

insert into employees values(101,'neena',90000,'neena@gmail.com','F');
insert into employees values(102,'james',91000,'james@gmail.com','M');
insert into employees values(103,'blake',97000,'blake@gmail.com','M');
commit;
select * from employees;

/*inserting record via procedure*/
delimiter //
create procedure insertemployee
(in eid int ,in name varchar(20),
 in salary decimal(8,2),
 in email varchar(20),
 in gender char(1)) 
begin
 insert into employees values(eid,name,salary,email,gender);
end //	
delimiter ;

/*calling insertemployee procedure */
call insertemployee(106,'ana',80000,'ana@gmail.com','F');
select * from employees;

/*updating record via procedure*/
delimiter //
create procedure updateemployee
(in empid int ,
 in newemail varchar(20))
begin
 update employees set email=newemail where eid=empid;
end //	
delimiter ;
/*calling updateemployee procedure */
call updateemployee(102,'jamesnew@gmail.com');
select * from employees;

/*deleting record via procedure*/
delimiter //
create procedure deleteemployee
(in empid int) 
begin
 delete from employees where eid=empid;
end //	
delimiter ;

/*calling deleteemployee procedure */
call deleteemployee(103);
select * from employees;

/*searching record via procedure*/
delimiter //
create procedure showdetails(in empid int)
begin
select * from employees where eid=empid;
end //
delimiter ;

call showdetails(102);


/*function returning annual alary*/
delimiter //
create function getanualsalary(empid int)
returns decimal(10,2)
deterministic
begin
declare asal decimal(10,2) default 0;
select salary into asal from subprograms.employees  where eid=empid;
return asal*12;
end//
delimiter ;


select getanualsalary(eid)  from employees;



