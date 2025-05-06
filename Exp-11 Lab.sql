# Experiment 11

# Aim:-To implement high level language extensions with cursors and triggers:-



set autocommit=0;
use subprograms;

/*A MySQL trigger is a stored program (with queries) which is executed automatically 
to respond to a specific event such as insertion, updation or deletion 
occurring in a table.*/

/*After Trigger*/
/*Sample schema*/
create table delbackup(
eid int,
name varchar(20),
salary decimal(8,2),
email varchar(20),
gender char(1),
username varchar(50),
deltime datetime
);


delimiter //
create trigger deltrigger before 
delete on employees for each row
begin
declare un varchar(20);
select user() into un;
insert into delbackup values(old.eid,old.name,old.salary,old.email,old.gender,un,now());
end //
delimiter ;

delete from employees where gender='M';
select * from employees;
select * from delbackup;

/*cursors
A MySQL cursor is a powerful database object 
designed for retrieving, processing, and managing rows 
from a result set one at a time. Unlike standard SQL queries that 
handle sets of rows in bulk, cursors allow for detailed row-by-row operations.

DECLARE cursor_name CURSOR FOR select_statement;
OPEN cursor_name;
FETCH cursor_name INTO variable1, variable2, ...;
CLOSE cursor_name;
*/

delimiter //
create procedure incrementsal(in sal decimal(8,2))
begin
declare done int default false;
declare empno int;
declare incsal cursor for select eid from employees where salary>sal; 
declare continue handler for not found set done=true;
open incsal;
lp:loop
	fetch incsal into empno;
		update employees set salary=salary*1.10 where eid=empno;
        if done then
          leave lp;
	end if;
end loop;
close incsal;
end //
delimiter ;
call incrementsal(99000);
select * from employees;
