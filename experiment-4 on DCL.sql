#Lab assignment 4  Data Control Language
 -- (execution date of  assignment )
--  2-April-25

#To apply Data Control Language( DCL) commands to grant and revoke access on university database.

#Note : Write down query and paste output after executing commands 

/* to create user*/
create user 'testuser'@'localhost' identified by '12345';
 select user,host from mysql.user; 
 
/* to change user password */
alter user 'testuser'@'localhost' identified by 'user123';

/* remove user */
drop user  'testuser'@'localhost';

/* rename user */
rename user 'testuser'@'localhost' to 'testnewuser'@'localhost';

/* check users in db schema */
select host,user from mysql.user;

/*show connected user*/
select user();


create database dcldb;
show databases;

/*granting system privileges*/
grant create,alter,drop
on dcldb.* to 'testnewuser'@'localhost';

/*to show privileges assigned to user*/
show grants for 'testnewuser'@'localhost';
show grants for 'testuser'@'localhost' ;

/*granting data privileges with grant option*/
grant select,insert,update,delete
on dcldb.* to 'testnewuser'@'localhost'
with grant option;


/* revoking privileges */
revoke select,insert,update,delete 
on dcldb.test123 from'testnewuser'@'localhost';

revoke create,alter,drop 
on dcldb.* from'testnewuser'@'localhost';

REVOKE ALL PRIVILEGES ON *.* FROM 'testnewuser'@'localhost';
flush privileges;
