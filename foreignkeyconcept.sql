show databases;
use university;
show tables;
desc Courses;
desc Students;
select *from departments;
select *from Students;
delete from Students where DepartmentID=3; /* delete krna h kyunki 3 ilegal entry h agr jbtk ilegal entry hotbtk forign key 
apply nhi hoti*/
alter table Students
add foreign key(DepartmentID) references departments(DepartmentID);


/*DQL*/

select *from departments;
select *from Students;

/* projection*/
select studentid, firstname, departmentid from Students; /*case insensitive*/
select departmentid, studentid, firstname from Students; /*jis order mein loge us order mei dega*/
select firstname,dob from Students;
select *from courses;
select courseid,coursename,credits from courses;

select *
from courses 
where credits=4; /*filter with where*/

select *
from courses 
where credits<=5; 



