-- UNION , UNION ALL

select * from A;
Select * from B;
-- avoid duplicates
select num from A union select num from B;
-- combine two tables together
select num from A union all select num from B;


Select * from tab1 inner join tab2 on tab1.numid=tab2.numid;

select * from tab1 left join tab2 on tab1.numid = tab2.numid;

select * from tab1 right join tab2 on tab1.numid = tab2.numid;

Select * from employees Inner join departments on employees.department_id = departments.department_id;

Select * from employees Inner join departments on employees.department_id <> departments.department_id;

-- inner join
Select first_name,salary,departments.department_id from employees Inner join departments on employees.department_id = departments.department_id;

Select first_name,salary,departments.department_id from employees left join departments on employees.department_id = departments.department_id;

-- display employees whose salary is less than ellens salary

select salary from employees where first_name = "ellen";
select salary from employees where salary<11000;
select salary from employees where salary<(select salary from employees where first_name = "ellen");

-- 2nd maximum salary
select max(salary) from employees;
select max(salary) from employees where salary<(select max(salary) from employees);

-- 3rd maximum salary
select max(salary) from employees where salary < (select max(salary) from employees where salary<(select max(salary) from employees));

-- single row subqueries
-- find salary of employee whose salary is greater than the salary of employee whose employee_id 150
select salary from employees where salary>(select salary from employees where employee_id=150);

-- display the employees who all are earning highest salary
select * from employees where salary=(select max(salary) from employees);

-- multi row subqueries
-- display  employees whose salary is equal to salary of the at least one employee in department id 30
select * from employees where salary in (select salary from employees where department_id=30);

-- display  employees whose salary is less than salary of the at least one employee in department id 30
select * from employees where salary < ANY (select salary from employees where department_id=30);

-- display  employees whose salary is greater than salary of the at least one employee in department id 30
select * from employees where salary > ANY (select salary from employees where department_id=30);


-- display  employees whose salary is greater than all salary of the at least one employee in department id 30
select * from employees where salary > ALL (select salary from employees where department_id=30);


-- query to get department name of employee

select first_name,employee_id,department_id,
(select department_name from departments where employees.department_id=departments.department_id) DNAME
from employees;


-- list out the employees who are having salary less than maximum salary and also having hire date greater than hire date of an employee
-- who is having maximum salary
select employee_id,first_name,salary,hire_date from employees where salary<
	(select max(salary) from employees) and hire_date>
		(select hire_date from employees where salary = (select max(salary) from employees));
-- foreign key
create table school(
sno int(3),
sname varchar(15),
marks int(3),
primary key(sno));

insert into school values(101,'arun',90);
insert into school values(102,'Tarun',70);
insert into school values(103,'arul',80);

select * from school;
create table library
(sno int(3) , foreign key (sno) references school(sno),
book_name varchar(10));

insert into library values(102,'java');
select * from library;
insert into library values(102,'java'); -- error because 108 is not there in parent table
insert into library value(null,'dot net'); -- null is allowed

-- child table records can be removed directly 



