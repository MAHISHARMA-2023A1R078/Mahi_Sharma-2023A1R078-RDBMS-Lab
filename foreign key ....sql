create database comp;
use comp;
 create table employees
 (
 eid int primary key,
 name varchar(20),
 mid int,
 foreign key(mid) references employees(eid)
 );
 
 insert into employees( eid, name, mid) values
 (101,'james',null),
 (102,'king',101),
 (103,'james',101),
 (104,'neena',102);
 desc employees;
 select *from employees;
 
  insert into employees( eid, name, mid) values
  (106,'black',108);
  
  insert into employees( eid, name, mid) values
  (108,'bik',101);
  select *from employees;
  