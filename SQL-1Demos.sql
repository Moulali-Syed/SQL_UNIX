--  

CREATE DATABASE mydb;
DROP DATABASE mydb;


CREATE SCHEMA mydb;
DROP SCHEMA mydb;

 CREATE DATABASE IF NOT EXISTS mydb;
 
 USE mydb;
 
 CREATE TABLE STUDENT(SNO INT(5) , SNAME VARCHAR(15) , MARKS INT(3));
 
 DESCRIBE STUDENT;
 
 INSERT INTO STUDENT VALUES(101,"APPLE" ,98);
 
 SELECT * from STUDENT;
 
 INSERT INTO STUDENT(SNAME,SNO,MARKS) VALUES("Mango",102,90);
 
  INSERT INTO STUDENT(SNAME,SNO,MARKS) VALUES("Banana",103,NULL);
  
  -- select command / Retreive data from tables
 USE sql_hr;
 SELECT * FROM employees;
 SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES;
 -- column alias 
   SELECT EMPLOYEE_ID empId,FIRST_NAME fname,LAST_NAME lname,SALARY FROM EMPLOYEES;
   -- adding to columns
    SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY+5000 FROM EMPLOYEES;
    
    -- where clause - retrieve data based on condition
        Select * from employees;
	-- salary greater than 30000
		Select * from employees where salary>90000;
	-- salary lessthan or equal to 15000
		Select * from employees where salary<=15000;
	-- employees of office id -1
		Select * from employees where office_id=1;
	-- checking if some record value is null
		Select * from employees where office_id is NULL;
	-- using =
		Select * from employees where first_name="Sayer";
	-- distinct - display unique value from table
		Select distinct office_id from employees ;
        Select distinct * from employees;
        
        
	Select * from employees;
    Select * from employees where salary>15000 and job_id='AD_VP';
    Select * from employees where salary>15000 or job_id='AD_VP';
    Select * from employees where not first_name = 'david';
  
  
  --  BETWEEN , insert
  select * from employees where salary between 10000 and 20000;
  select * from employees where salary not between 10000 and 20000;
  
  Select * from employees where salary in(3400,2500,3000);
  select * from employees where salary not in(3400,2500,3000);
  
  -- pattern matching
  -- firstname - first character having start with s
  select first_name from employees where first_name like 's%';
  -- end with r 
  select first_name from employees where first_name like '%r';
  --  start with s and end with r
  select first_name from employees where first_name like 's%r';
  --  names with m in between
  select first_name from employees where first_name like '%m%';
  -- must not start with S
  select first_name from employees where first_name NOT LIKE 'S%';
  -- underscore represent one character , % any number of characters
  -- displays any name that having last between character as e
  select * from employees where first_name like '%e_';
  -- firstname with 3 characters
  select * from employees where first_name like '___';
  
  -- to use a database
     use mydb; 
  -- drop table will removes data and structure
  DROP TABLE STUDENT;
  
  CREATE TABLE STUDENT(SID INT(4), SNAME VARCHAR(15));
  
  DESCRIBE STUDENT;
  
  INSERT INTO STUDENT VALUES(101,'DAVID');
  INSERT INTO STUDENT VALUES(102,'SMITH');
  INSERT INTO STUDENT VALUES(103,'SCOTT');
  
  COMMIT;
  
  Select * from STUDENT;
  
  -- 			alter 
  -- alter commands to add a new column , alter works on definition
  alter table student add(grade varchar(2));
  
  -- to remove column
  alter table student drop column grade;
  
  -- modify a column
  alter table student modify column sname varchar(20);
  -- to decrease column size we must delete all data from column
  
  --     rename
  alter table student rename column sname to stuname;
  
  --     DROP , remove database objects , will completely remove db , structure , data
  
  
  -- TRUNCATE , only data is removed and still table structure will be present , data removed permanently
  TRUNCATE Table Student;
  -- DELETE , data is removed but we can get the data back using ROLLBACK
  delete from student;
  
  ROLLBACK;
  -- commit will make chnages permanently
  COMMIT ;
  -- set autocommit =0 , this prevents the autocommit , thus prevents the automatic permanent changes to db , present only in mysql
  -- to allows insertion and deletion to table , we have to set  , SET SQL_SAFE_UPDATES = 0;
  
  
  -- rename table
  RENAME TABLE jobs to designation;
  
  -- String Functions
  Select UPPER(first_name) from employees;
  Select LOWER(first_name) from employees;
  -- counts number of characters
  Select length('oracle');
  select length(first_name) from employees;
  -- print names of employees whose names has 4 characters
  select * from employees where length(first_name)=4;
  
  -- remove spaces from both sides
  select TRIM('   welcome  ');
  -- remove z from start and end
  select TRIM('z' from 'zzbdbsazbzb');
  
  -- NSTR() - returns position of character
  select instr('welcome','o');
  
  -- SUBSTR()/SUBSTRING()
  select SUBSTR("ORACLE",2,3);  -- RAC
  select SUBSTR("ORACLE",3,3); -- ACL
  select SUBSTR("ORACLE",4,3); -- CLE
  
  select SUBSTRING("ORACLE",2,3);   -- RAC
  select SUBSTRING("ORACLE",3,3); -- ACL
  select SUBSTRING("ORACLE",4,3); -- CLE
  
  select substring(first_name,1,3) from employees;
  
  -- concat
  select concat('oracle','rain') ;
  select concat(first_name , last_name) as Full_Name from employees;
  
  -- numeric functions
  select abs(-40); -- 40
  select abs(12); -- 12
  select sqrt(25);
  select mod(10,3);
  select power(2,5);
  select truncate(40.1234,3); -- 40.123
  select truncate(6872,-2); -- 6800
  select truncate(12345,-1); -- 12340
  select greatest(100,200,300);
  select least(100,200,300);
  
  
  -- date functions
  select curdate(); -- only date
  select current_date(); -- only date
  
  select curtime();  -- only time
  select current_time();  -- only time
  
  select now();
  select SYSDATE();
  
  select month("2019-03-19");
  select year("2019-05-19");
  select day("2019-03-19");
  
  -- display employees who are joined in 1987
  select * from employees where year(hire_date)='1997';
  -- display employees joined in june
  select * from employees where month(hire_date)="6";
  select * from employees where monthname(hire_date)="JUNE";
  
  
  -- aggregate functions
  select avg(salary) from employees;
  select sum(salary) from employees;
  select min(salary) from employees;
  select max(salary) from employees;
  select count(*) from employees;
  
  -- groupby - used for grouping results from table
  select department_id , sum(salary) from employees group by department_id;
  select department_id, avg(salary) from employees group by department_id;
  
  select department_id,min(salary),max(salary) from employees group by department_id;
  
  select job_id, count(*) from employees group by job_id;
  -- job_id must be in select clause , and same for all above queries
  
  select job_id,department_id , count(*) from employees group by job_id;
    select job_id,department_id , count(*) from employees group by job_id,department_id;
    
    
    -- having
    -- having = after group by if u want to apply some condition on it then use having / to filter on top of group by
    select job_id, count(*) from employees group by job_id having count(*)>20;
    
    select department_id,sum(salary) from employees group by department_id having sum(salary)>20000;
    -- after group by to apply condition use having , if before group by then use where clause
    select department_id , sum(salary) from employees where department_id<>50 group by department_id having sum(salary)>20000;
    
    -- order by clause is used to arrange the rows in a table (ascending or descending order)
    select * from employees order by department_id desc;
    select * from employees order by department_id; -- default is ascending order
    
    
    -- order of execution
    --  where --> group by --> having --> order by
    -- select columnNames from TableName group by columnNames having condition order by columnNames
    
    select department_id,sum(salary) from employees group by department_id having sum(salary)>20000 order by sum(salary);
    
    select department_id,sum(salary) from employees 
						where department_id<>100 
                        group by department_id
                        having sum(salary)>20000
                        order by sum(salary) desc;
    
    
  
  
  
  
  
  