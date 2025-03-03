-- 3/03/25

use university2;
show tables;

desc instructors;

select *from instructors;

select name,salary from instructors; 


-- combine multiple columns into one by concatination fn.

select concat(name,' earns ',salary) as 'earns' from instructors ; -- expression becomes name of the column

select concat(name, ' works in ', deptid) as 'works in' from instructors;

select name from instructors;  -- sabke agge doctor mention ha aur want name only

-- index 5 se print krna ha mtlb string ki sub string 
-- exclude Dr. 
select substr(name,5) from instructors; -- index 5 se name retrive krega 

-- start from index 5 and print 3 char agge wla tk 
select substr(name,5,3) from instructors;

-- convert the string into uppercase or lower case using fn.
select  upper(name) from students;  -- case manipulation fn.
select  lower(name) from students;  -- case manipulation fn.

select name from students;
select  concat(substr(name,1,1), lower(substr(name,2)))  -- first captial baaki small mtlb 1,1 pe khtm
from students;     -- nested fn  


-- to show left wale pehle 5 
select left(name,5) from students;
select right(name,5) from students;

-- leading and trilling space hatane ha 
select ltrim('   hello    '); -- kisi table mein exist nhi krra only string pe kaam krna ha -- starting space remove
select rtrim('        hello     '); -- ending space remove
select trim('       hello      '); -- start , end dono space remove


-- to add character in data   --padding mein colmn ka data dikhega agge piche add krne ha character 
--  append * 
select lpad(salary, 15 ,'*' ) from instructors; -- out of 15 8 stars acquired by salary jitna space bchega salary ke agge start*
select rpad(salary, 15 ,'*' ) from instructors; -- end mein * chahiye too r pad 
-- agge piche * lagane ha dono side
select lpad(rpad(salary,15,'*'),20,'*') from instructors;

select name, dob from students;
desc students;
-- date se january wla 

select name,day(dob) from students;
select name,month(dob) from students;
select name,year(dob) from students;

select name,minute(dob) from students; -- not date time field that's why 00
select name,hour(dob) from students;
select name,second(dob) from students;

select curdate();  -- current date of machine
select minute(curdate());
select hour(curdate());

select name, dayname(dob) ,monthname(dob) from students;

-- all the students born on sunday

select name, dayname(dob) ,monthname(dob) from students
where dayname(dob)="sunday";

-- calculate age from dob as deruved attribute: 
select name, year(curdate()) - year(dob) as age from students;

-- date difference by date dif fn name: date ko minus krke days dedeta

-- important function: 3 30% increment , 6 40% increment and  dept 9 mein 50% increment show and baaki same salary
-- case situation ke liye case naam ka fn hota ha
select *from instructors;
-- incremented salary dept id ke behalf pe
select name,  salary, deptid,
case deptid
when 3 then salary*1.30
when 6 then salary*1.40
when 9 then salary*1.50
-- else salary ye  else nhi diya too null dikhayega
else salary
end
as 'incremented sal'
from instructors;   -- jinko mention nhi kiya deptid unki salary is normal

