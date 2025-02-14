# creating database
create database student;
# activate database
use student; 
# creating a table 
create table student_info (roll_no int, st_name varchar(25),maths int, science int, english int, kannada int, hindi int, social int);
#check or view the table 
select *from student_info;
# inserting a data into table
# insert into student_info values 
(113,"Mohan",86,68,70,85,67,98,325,65.15),
(114,"Mukesh",68,87,59,87,77,96,385,78.5);
(104,"Dev",64,66,57,89,90,78),

(105,"Harish",58,55,60,67,93,84),
(106,"Rajath",58,86,78,52,90,65),
(107,"Preetham",58,89,67,64,58,64),
(108,"Raghu",51,61,99,76,89,74),
(109,"ranjan ",74,57,89,59,90,89),
(110,"Venu",56,67,94,93,58,78);
# updating/modifying values in a table 
update student_info set maths = 89 where roll_no = 102 ;
update student_info set st_name = "Devadatta" where roll_no = 104 ;
update student_info set english = 79 where roll_no = 109 ;
# adding new column to the table 
alter table student_info add column total int ;
update student_info set total = maths+science+english+kannada+hindi+social;
alter table student_info add column Percent float ;
update student_info set Percent = round (total/600*100,2);

# creating copy of existing table 
create table student_info_1 as select * from student_info;
select *from student_info_1 ;
# deleting a rows from table 
delete from student_info_1 where roll_no = 103;
# deleting multiple rows from table 
delete from student_info_1 where roll_no in (102,106,108);
#deleting a column from table 
alter table student_info_1 drop column Percent ;
alter table student_info_1 drop column total ;
# erasing/deleting all the row in the table at a time 
truncate table student_info_1; 
#deleting/drop table 
drop table student_info_1;

#filtering and analyzing the data 
select *from student_info where st_name = "Devadatta" ;
select *from student_info where st_name in ("Ashish","Harish","Preetham");
select *from student_info where st_name like "r%";  # starts with R 
select *from student_info where st_name like "%H"; # ends with H 
select *from student_info where st_name like "%m%"; # contains M 
select *from student_info where total >= 500; # greater than 
select *from student_info where total <= 400; #lesser than 
select *from student_info where total between 400 and 500; #range 
select *from student_info where maths >= 70 and science >= 70; #and 
select *from student_info where maths >= 70 or  science >= 70; #OR 
select *from student_info where st_name != "Rajath"; #excluding 
select *from student_info where st_name not like "r%";  # excludes with R 

#sorting the data in a table 
select *from student_info order by st_name asc ; #sorting in asc
select *from student_info order by st_name desc;  #sorting in desc
select *from student_info order by total desc; #sorting total 
select *from student_info order by total desc limit 3 ; # top 3 
select *from student_info order by total asc limit 3 ; # bottom 3 

#aggregation functions 
select *from student_info ;
select sum(maths) as Maths_ttl, avg(maths) as maths_avg, max(maths) as maths_max,min(maths) as maths_min, stddev(maths) as maths_dev from student_info ;
select count(st_name)as st_count ,sum(total) as total_ttl, avg(total) as total_avg, max(total) as total_max,min(total) as total_min, stddev(total) as total_dev from student_info ;

# check how many row/records in a table 
select count(*) as table_rows from student_info;

#text function 
select *, upper(st_name) as st_upper from student_info;# creates temporary upper case row 
select *, lower(st_name) as st_lower from student_info;
select *, length(st_name) as st_length from student_info;# check number of char in each name 
select *, left(st_name,2) as st_left, right(st_name,2) as st_right, mid(st_name,2,2) as st_mid from student_info;
select *, concat(st_name,"gupta") as first_and_last_name from student_info;


create table department_1 (roll_no int , department varchar(50));
select * from department_1;
# insert into department_1 values 
(101, "MBA"),
(102, "BBA"),
(103, "BSC"),
(104, "MBA"),
(105, "BBA"),
(106, "BSC"),
(107, "MBA"),
(108, "BBA"),
(109, "BSC"),
(110, "MBA");
# drop table department;
select count(*) as table_rows from department_1;

#sql joins (inner join)
select a.*,b.department from student_info a 
inner join  department_1 b 
on a.roll_no=b.roll_no;

select a.*,b.department from student_info a 
left join  department_1 b 
on a.roll_no=b.roll_no;

select a.*,b.department from student_info a 
right join  department_1 b 
on a.roll_no=b.roll_no;

#incase of duplicate 
delete from student_info where roll_no in (113,114);
truncate table department_1;

#checking null values in the table 
select a.*,b.department from student_info a 
left join  department_1 b 
on a.roll_no=b.roll_no 
where b.department is null;

#excluding null values 
select a.*,b.department from student_info a 
left join  department_1 b 
on a.roll_no=b.roll_no 
where b.department is not null;

#creating a view or virtual table 
create view student_data as 
select a.*,b.department from student_info a 
left join  department_1 b 
on a.roll_no=b.roll_no 
where b.department is not null;

select *from student_data;

select *from student_data 
order by department asc ;

# summarizing or aggregating the data using group by function  (order of execution) 
select department, sum(total) as ttl_marks, count(roll_no) as st_count 
from student_data 
# where department="BBA" filtering
group by department 
having ttl_marks < 1500
order by ttl_marks asc 
limit 1;

#subquery or nested query 
#filtering data for student scoring ab0ve 439
select *from student_info where total >= ( select avg(total) from student_info);

select *from student_data where roll_no in (
select roll_no from student_data where department = "MBA") ;

select *from student_data;
select *,case
when total > 500 then "first class"
when total> 400 then "second class"
else "pass" end as grade from student_data;

#constraints
create table employee
( emp_id int primary key, 
emp_name varchar(50) not null ,
mobile_no bigint unique not null,
age int check(age>18),
department varchar(20) default "manufacturing");
select *from employee;
insert into employee values
("311","Rithu",8746835983,20,"");

#create a 2 table emp_1 (5 records )and Emp_2 (4records) same as above 


create table Emp_1 (
emp_id int ,
emp_name varchar(50),
mobile_no bigint ,
age int ,
city varchar(25) ,
department varchar(20)
);

select *from Emp_1;
insert into Emp_1 value 
(101,"deeksith",4986276080,24,"Bengaluru","manufacturing"),
(102,"Rohit",1687746013 ,30,"mysore","manufacturing"),
(103,"Pariksith",8978131281,28,"Bengaluru","manufacturing"),
(104,"emuele",8870532767 ,37,"darwad","manufacturing"),
(105,"Dhruv",8638692528,24,"Hubli","manufacturing");


create table Emp_2 (
emp_id int ,
emp_name varchar(50),
mobile_no bigint ,
age int ,
city varchar(25) 
);

select *from emp_2;

insert into emp_2 values
(106, "maddy",3165143956,26,"Mysore"),
(107,"rohan",9474977389 ,30,"Mandya"),
(108,"Ravi",0882394867,28,"Bengaluru"),
(109,"Manju",3655231484,25,"Hubli"),
(110,"srinivas",8502225372,30,"Mysore");
