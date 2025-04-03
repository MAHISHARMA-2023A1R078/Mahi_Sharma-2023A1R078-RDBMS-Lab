select user();   # who is the user at current  2/04/25

select host, user from mysql.user;  # user bana ha ya nhi to check for user

create database csea4;
show databases;
# create user , alter user and drop user 

# to create user in current server use 'localhost'  but for other server use the IP address of that server using DDL
create user 'stu1'@'localhost' identified by'1234'; 
select user from mysql.user;

#change password 
alter user 'stu1'@'localhost' identified by '4567';

#rename user
rename user 'stu1'@'localhost' to 'stu123'@'localhost';
select user from mysql.user; # ab user ka naam hoga stu123

# if want to remove user from the schema 
drop user 'stu1'@'localhost';

# now give authorities to the user  
-- GRANT Command 
grant create, alter, drop 
on csea4.* to 'stu123'@'localhost'; -- csea4 database ki saari tables pe create, alter and drop you can do

# if want to see grant priviliges ki user ko konsi permissions grant hain
show grants for 'stu123'@'localhost';

grant select , insert, update, delete
on csea4.* to 'stu123'@'localhost';

# how to revoke 
revoke select , insert, update, delete
on csea4.* from 'stu123'@'localhost';

revoke all on csea4.* from 'stu123'@'localhost';
show grants for 'stu123'@'localhost';



