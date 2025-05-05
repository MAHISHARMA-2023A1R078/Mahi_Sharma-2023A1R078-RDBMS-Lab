# work on triggers
# A MYSQL trigger is a stored program (with queries) which is executed automatically in respond to a specific event 
-- such as insertion, updation or deletion occurring in a table.
#-- > jisne delete kiya uska naam ajaye 
# before and after triggger: before trigger task perform krne se pehle trigger ki body ko execute krta h
# after mein pehle task execute phir trigger ki body execute 
# trigger event : insert, uodate, delete
use spdemo;
create table emplog(
eid int ,
name varchar(20),
salary decimal(8,2),
emial varchar(20),
gender char(1),
username varchar(30),
deltime datetime -- ye log table mein data remove hoke store hojayega
);

desc emplog;  -- all the triggers are buiilt iin triggers. like log constarints

#syntax of trigger:
delimiter //
create trigger empbackup before 
delete on employees for each row   -- 5 rows delete so trigger 5 bar chelga 
begin 
-- jo row deltee hui unhe hm old values bolte
    declare un varchar(20);
    set un=user(); -- here un is username    -- now() current user show krega 
    insert into emplog values(old.eid, old.name,old.salary,old.email,old.gender, un, now()); -- # old is koown as "qualifier"
end// 
delimiter ;

select * from emplog;
call delemp(103);
call delemp(102);
call delemp(101); -- ha ho nhi
select * from employees;
