use hr;
show tables;
desc employees;
select last_name, salary from employees where salary>11000;

select salary from employees where last_name='Abel';
# single row operators subquery
select last_name,salary
from employees
where salary>(select salary 
              from employees
			  where last_name='Abel');   #11,000 salary se bde salary wale employees
              
#vo emp niakalo  jisdin emp no 101 hire hua ha hire day nikalo
select last_name, dayname(hire_date) 
from employees where dayname(hire_date)=  #nested sub query
(select dayname(hire_date) from employees
where employee_id=101);

#vo emp nikalo jine vo person manage krta jo emp no 101 ko manage krta
select last_name, manager_id from employees where manager_id=
(select manager_id from employees where employee_id=101);   



#vo emp jinki salary king ki salary se kam 
select last_name, salary from employees where salary in 
(select salary from employees where last_name='king'); #sub query returns more than 1 row 

select salary from employees where last_name='king';

#emp jinki salary kisi bhi dept ki min salary se barabar ha 
select min(salary) from employees group by department_id; -- pehle andar wali chalao phir sub query puri 


#multi row operators subquery: 
select last_name, salary 
from employees 
where salary in(
                  select min(salary)
                  from employees
                  group by department_id);
                  
                  
#emp table selast_name aur job id
select last_name, salary, job_id from employees;

-- un emp ki salary jinki salary greater than min or max any IT prog emp salary or gerater than all mtlb sbse jayada
-- aur job id it programmer show nhi krwani 
select salary from employees where job_id="it_prog"; 


select last_name, salary, job_id 
from employees where salary>
any
(select salary from employees 
where job_id="it_prog") 
and job_id <> "it_prog"; -- its outer query part for filter jha hmne filter lgaya taki job_id hmein it prog na dikhe


-- all operator for maximum salary from all other emp
select last_name, salary, job_id 
from employees where salary>
all
(select salary from employees 
where job_id="it_prog") 
and job_id <> "it_prog";



# ****multi column subqueries****

use hr;
show tables;
desc employees;

select manager_id, department_id from employees
where employee_id in (174,180);   -- mutli row subquery and multicolumn subquery with multiple rows and columns
#Pairwise Comparison
 select last_name, manager_id, department_id
 from employees where (manager_id, department_id) in  -- *****Pairwise Comparison**** comparing pair at a time 
 (select manager_id, department_id from employees
where employee_id in (174,180))
order by department_id; 

     
-- manager id ki jaga name dikao too self join  self and equi join legaga


# Non Pairwise Comparison
select last_name, manager_id, department_id
 from employees where manager_id in  -- ***** Non Pairwise Comparison**** 
 (select manager_id from employees    -- same output dega like pairwise but alag alag and se query likhege 
  where employee_id in (174,180))      -- has no difference bs complex ha 
and 
department_id in(select department_id 
from employees
where employee_id in (174,180))
order by department_id;



##-- vo emp jinki sal kisi bhi dept ki avg sal se jayada ha 
select avg(salary) from employees
group by department_id;


-- sbse avg sal is 3475 h
-- so 3475 se upar wli salary of employees vo ayega
select last_name, salary from employees -- vo emp jinki sal kisi bhi dept ki avg sal se jayada ha 
where salary> any (select avg(salary) from employees
group by department_id)
order by salary;


##-- vo emp jinki salary apne hi dept ki sbse jayada salary hogi
select last_name, salary, e. department_id, deptavg.avgsal from employees e -- dono table mein did ha tbhi
join
(select department_id, avg(salary) as avgsal -- -> subquery in the from clause is known as inline view
from employees                                 -- template table
group by department_id) as deptavg
on (e.department_id=deptavg.department_id)   
and 
e.salary>deptavg.avgsal;-- vo emp jinki salary apne hi dept ki sbse jayada salary hogi
-- ######## isse pehle outer  most query  inner  wli se help legi


#****Co related subquery:*****

-- ###### inner most query bahar wli se help leke output generate krti aise pehle baahar wli query inner se help leti thi 
-- vo emp jinki avg sal apne dept ki avg sal se bdi ha
select last_name, salary, department_id
 from employees Outeremp 
 where salary>   -- outer is a keyword too alisaing mein keyword use nhi hota
(select avg(salary) from employees where department_id= Outeremp.department_id);







