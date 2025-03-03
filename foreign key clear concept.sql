create database company;
use company;
 create table dept(
 did int primary key,
 dname varchar(20),
 location varchar(20)
 );
 create table emp(
 eid int primary key,
 name varchar(20),
 did int,
 foreign key(did) references dept(did)
 );
 desc dept;
 desc emp;
 
 insert into dept(did, dname, location) values
 (1, 'cse', 'mumbai'),
 (2, 'maths', 'dubai'),
 (3,'music', 'usa');
  select *from dept;
  
  insert into emp(eid, name, did) values
  (101, 'nack', 1),
  (102,'jack',2),
  (103,'dok',3);
  select *from emp;
  
    insert into emp(eid, name, did) values
    (104,'in',4);
     insert into dept(did, dname, location) values
     (4,'it','jammu');
     
     delete from dept where did=4; /* did mein delete nhi hoga kyunki emp mein did 4 ha*/
     delete from emp where did=4;
      delete from dept where did=4;  /* now its deleted*/
      
      delete from emp where eid=101;
      delete from dept where  did=1;
      
     