# lab experiment number 7 joins and views 
# note execute these command on university database that i have sheared 
#these queries will only work with university databse

use university2;

#equi join
select coursename,deptname
from courses join departments
on courses.deptid=departments.deptid;

#-------------------------------------------------------
create table salgrade 
(grade char(1),minsal decimal(8,2),maxsal decimal(8,2));

insert into salgrade values
('A',90000,100000),
('B',80000,89999),
('C',70000,79999),
('D',50000,69999);
#execute above create salgrade and insert query to run nonequijoin query
#nonequi join
select name,salary,grade
from instructors join salgrade
on( salary between minsal and maxsal);

#--------------------------------------------------------------------


ALTER TABLE `university2`.`instructors` 
ADD COLUMN `mid` INT NULL AFTER `Salary`,
ADD INDEX `instructor_manager_idx` (`mid` ASC);
ALTER TABLE `university2`.`instructors` 
ADD CONSTRAINT `instructor_manager`
  FOREIGN KEY (`mid`)
  REFERENCES `university2`.`instructors` (`InstructorID`)
  ON DELETE SET NULL
  ON UPDATE SET NULL;

UPDATE `university2`.`instructors` SET `mid`='1' WHERE `InstructorID`='2';
UPDATE `university2`.`instructors` SET `mid`='3' WHERE `InstructorID`='4';
UPDATE `university2`.`instructors` SET `mid`='5' WHERE `InstructorID`='6';
UPDATE `university2`.`instructors` SET `mid`='7' WHERE `InstructorID`='8';
UPDATE `university2`.`instructors` SET `mid`='9' WHERE `InstructorID`='10';
UPDATE `university2`.`instructors` SET `mid`='11' WHERE `InstructorID`='12';
UPDATE `university2`.`instructors` SET `mid`='13' WHERE `InstructorID`='14';
UPDATE `university2`.`instructors` SET `mid`='15' WHERE `InstructorID`='16';
UPDATE `university2`.`instructors` SET `mid`='17' WHERE `InstructorID`='18';
UPDATE `university2`.`instructors` SET `mid`='19' WHERE `InstructorID`='20';

#note execut above alter update query to run self join query 
#self join
select t1.name as employee,t2.name as mgr
from instructors t1 join instructors t2
on(t1.mid=t2.instructorid);

#natural join
select s.studentid,s.name,e.courseId,e.grade
from students s natural join enrollments e;


#left outer join
select s.studentid,s.name,e.courseId,e.grade
from students s left outer join enrollments e
on(s.studentid=e.studentid);


#execute this delete query prior to perform right join
delete from enrollments where courseid in (7,10);

#right outer join
select c.courseid,c.coursename,e.enrolldate
from enrollments e right outer join courses c
on(e.courseid=c.courseid);


update enrollments set courseid=null,enrolldate=null,grade=null
where enrollmentid in(89,90,91,92,93);
# run above query prior running full outer join
# full outer join
select c.courseid,c.coursename,e.enrolldate,enrollmentid
from enrollments e left outer join courses c
on(e.courseid=c.courseid)
union
select c.courseid,c.coursename,e.enrolldate,enrollmentid
from enrollments e right outer join courses c
on(e.courseid=c.courseid)
order by enrolldate;

#cartesian product or cross join
select * 
from instructors cross join departments;


#view
alter  view courseenroll as
select c.courseid,c.coursename,e.enrollmentid
from enrollments e join courses c
on(e.courseid=c.courseid);

select * from enrollments;





