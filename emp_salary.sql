create database company;
use company;
create table emp_list_salary( emp_id varchar(20) , emp_name varchar(25), department varchar(20), mode varchar(15), salary int);

select *from emp_list_salary;
insert into emp_list_salary values
("id-101","Dev","CEO","online/offline",200000),
("id-102","Stephen","DSE","online",70000),
("id-103","Prachi","DA","offline",50000),
("id-104","Suman","RM","offline",30000),
("id-105","Sasthri","DSE","online",70000),
("id-106","Revanth","DA","offline",50000),
("id-107","Shikar","RM","offline",30000),
("id-108","Smitha","DA","offline",50000),
("id-109","Supritha","RM","offline",30000),
("id-110","Devika","DSE","online",50000);

update emp_list_salary set salary = 300000 where emp_id = "id-101";
update emp_list_salary set emp_name = "Devadatta" where emp_id="id-101";
alter table emp_list_salary add column total int ;

# this is used to add a row in a column 
SELECT  emp_id, emp_name, department, mode, salary FROM emp_list_salary UNION ALL SELECT 'Total' AS emp_id, NULL AS emp_name, NULL AS department, NULL AS mode, Null as place ,SUM(salary) AS salary FROM  emp_list_salary; 
-- alter table emp_list_salary add column place varchar(20);
-- update  emp_list_salary set place = "bengaluru " where emp_id ="id-102";
-- update  emp_list_salary set place = "mumbai" where emp_id ="id-103";
-- update  emp_list_salary set place = "chennai" where emp_id ="id-104";
-- update  emp_list_salary set place = "dehli" where emp_id ="id-105";
-- update  emp_list_salary set place = "chennai " where emp_id ="id-106";
-- update  emp_list_salary set place = "dehli " where emp_id ="id-107";
-- update  emp_list_salary set place = "bengaluru " where emp_id ="id-108";
-- update  emp_list_salary set place = "mumbai " where emp_id ="id-109";
-- update  emp_list_salary set place = "bengaluru " where emp_id ="id-110";
alter table emp_list_salary add column place varchar(20);

-- UPDATE emp_list_salary
-- SET place = CASE 
-- 	WHEN emp_id = "id-101" THEN "chennai"
--     WHEN emp_id = "id-102" THEN "bengaluru"
--     WHEN emp_id = "id-103" THEN "mumbai"
--     WHEN emp_id = "id-104" THEN "chennai"
--     WHEN emp_id = "id-105" THEN "dehli"
--     WHEN emp_id = "id-106" THEN "chennai"
--     WHEN emp_id = "id-107" THEN "dehli"
--     WHEN emp_id = "id-108" THEN "bengaluru"
--     WHEN emp_id = "id-109" THEN "mumbai"
--     WHEN emp_id = "id-110" THEN "bengaluru"
--     ELSE place
-- END;              

 #alternate form for above code 
-- SELECT  emp_id, emp_name, department, mode, salary FROM emp_list_salary UNION ALL SELECT 'Total' AS emp_id, NULL AS emp_name, NULL AS department, NULL AS mode,SUM(salary)AS salary, Null as place  FROM  emp_list_salary; 

-- SELECT  salary FROM emp_list_salary UNION ALL SELECT  SUM(salary) AS salary FROM  emp_list_salary;

-- create table emp_salary_list_1 as select *from emp_list_salary;
-- select *from emp_salary_list_1;
-- delete from emp_salary_list_1 where emp_id="id-108";
-- delete from emp_salary_list_1 where emp_id in ("id-110","id-104","id-107");
-- alter table emp_salary_list_1 drop column place ;
-- truncate table emp_salary_list_1;
-- drop table emp_salary_list_1;

-- select *from emp_list_salary where emp_name ="devadatta";
-- select *from emp_list_salary where emp_name in ("supritha","devadatta","smitha","devika");
-- select *from emp_list_salary where emp_name like "s%";
-- select *from emp_list_salary where emp_name like "%a";
-- select *from emp_list_salary where emp_name like "%e%";
-- select *from emp_list_salary where salary >= 10000 and total <= 40000;
-- select *from emp_list_salary where emp_name != "Devika";


-- select *from emp_list_salary;
-- select sum(total) as salary_total, avg(total) as avg_tot,max(salary) as max_sal,min(salary) as min_sal,stddev(total) as stdev_tot from emp_list_salary;

-- select count(*) as table_rowws from emp_list_salary;


