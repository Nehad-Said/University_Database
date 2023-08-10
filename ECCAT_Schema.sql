
/* create database */
create database company
/* use this database */
use company;
go

/* create schema */
create schema services;
go

/* create the tables */
create table person_abstract(
name_person varchar(50) primary key,
sex varchar(50) not null ,
address_id varchar(50) not null,
birth_date varchar(60) not null
);
ALTER TABLE person_abstract
ADD num_of_employees  int;

alter table person_abstract
add constraint abstr_depart_num foreign key (num_of_employees )
references  department (num_of_employees)

/* select query */
SELECT *
 /*address_id,sex */
FROM
person_abstract
WHERE
sex='boy'
/* GROUP BY
birth_date*/
ORDER BY
birth_date;

SELECT birth_date,count(*)
 /*address_id,sex */
FROM
person_abstract
WHERE
sex='boy'
 GROUP BY
birth_date
HAVING count(*) > 10
ORDER BY
len(birth_date) asc;

create table customer(
sum_of_sales varchar(50) primary key,
occupation varchar(50) not null
);

create table system(
server_id varchar(50) primary key,
keyboard_code varchar(50) not null,
mouse_code varchar(30) ,
performance int not null
);

create table product_abstract(
product_code int primary key ,
name_product varchar(60) not null,
price int not null,
price_plus_vat int not null
);

create table employee(
employee_id varchar(50) primary key,
address_id varchar(50) not null ,
position varchar(60) not null,
salary int not null
);
ALTER TABLE employee
ADD fore_emplo int;

alter table employee 
add constraint fore_employee_num foreign key (fore_emplo )
references department(num_of_employees)

create table manager(
office_no int primary key,
car_num int
);

create table department(
num_of_employees int primary key ,
monthly_payroll int not null ,
annual_payroll int not null ,
monthly_income int not null ,
dept_name varchar(60) unique
);

create table computer(
cpu_type varchar(50) primary key ,
memory varchar(50) not null ,
HD varchar(30) not null ,
cpu_performance int not null
);

create table monitor(
VDU_type varchar(80) primary key,
color varchar(30) ,
resolution varchar(50) not null,
VDU_quality varchar(50) unique
);

create table mc_computer(
cpu_type varchar(50) primary key ,
memory varchar(50) not null ,
HD varchar(30) not null ,
cpu_performance int not null
);
ALTER TABLE mc_computer
ADD office_no int;

alter table mc_computer
add constraint comp_manager_num foreign key (office_no )
references  manager (office_no)
/* create foreign key */


/*first foreign key */
create table employee(
employee_id varchar(50) primary key,
address_id varchar(50) not null ,
position varchar(60) not null,
salary int not null
);
create table department(
num_of_employees int primary key ,
monthly_payroll int not null ,
annual_payroll int not null ,
monthly_income int not null ,
dept_name varchar(60) unique
);

ALTER TABLE employee
ADD fore_emplo int;

alter table employee 
add constraint fore_employee_num foreign key (fore_emplo )
references department(num_of_employees)


/* second foreign key */


create table person_abstract(
name_person varchar(50) primary key,
sex varchar(50) not null ,
address_id varchar(50) not null,
birth_date varchar(60) not null
);
create table department(
num_of_employees int primary key ,
monthly_payroll int not null ,
annual_payroll int not null ,
monthly_income int not null ,
dept_name varchar(60) unique
);

ALTER TABLE person_abstract
ADD num_of_employees  int;

alter table person_abstract
add constraint abstr_depart_num foreign key (num_of_employees )
references  department (num_of_employees)

/* third foreign key */
create table mc_computer(
cpu_type varchar(50) primary key ,
memory varchar(50) not null ,
HD varchar(30) not null ,
cpu_performance int not null
);
create table manager(
office_no int primary key,
car_num int
);
ALTER TABLE mc_computer
ADD office_no int;

alter table mc_computer
add constraint comp_manager_num foreign key (office_no )
references  manager (office_no)
/* insert in tables */
use company;
insert into manager(office_no,car_num )
output inserted.office_no, inserted.car_num
values
(1,100),
(2,200),
(3,300),
(4,400),
(5,500);

/* selesct from tables */


SELECT *
 /*address_id,sex */
FROM
person_abstract
WHERE
sex='boy'
/* GROUP BY
birth_date*/
ORDER BY
birth_date;

SELECT birth_date,count(*)
 /*address_id,sex */
FROM
person_abstract
WHERE
sex='boy'
 GROUP BY
birth_date
HAVING count(*) > 10
ORDER BY
len(birth_date) asc;

/* select top from tables */
SELECT TOP 10
 price
FROM
product_abstract
WHERE
price > 10
ORDER BY
price asc;
/* select DISTINCT column the same as ORDER BY */
SELECT DISTINCT name_product
FROM
product_abstract
ORDER BY
name_product desc;

SELECT *
FROM 
monitor
WHERE resolution ='ghjv' AND color='red'
ORDER BY resolution


SELECT price
FROM
product_abstract
WHERE
price IN (100,546,300,400)
ORDER BY
price asc;
SELECT *FROM product_abstract

SELECT *
FROM 
monitor
WHERE resolution LIKE '%g'
ORDER BY resolution;
SELECT *FROM monitor


SELECT VDU_quality +' '+ VDU_type 'full Name'
FROM 
monitor
WHERE resolution LIKE '%g'
ORDER BY resolution;


SELECT VDU_quality 'QUALITY'
FROM 
monitor
WHERE resolution LIKE '%g'
ORDER BY resolution;


/* join tables */



/* inner join */

select name,sex,monthly_income
from person_abstract p
INNER JOIN department d
ON d.num_of_employees = p.num_of_employees
ORDER BY name DESC;

/* left join */

select name,sex,monthly_income
from person_abstract p
LEFT JOIN department d
ON d.num_of_employees = p.num_of_employees
ORDER BY name ASC;

/* right join */


select name,sex,monthly_income
from person_abstract p
RIGHT JOIN department d
ON d.num_of_employees = p.num_of_employees
/* invalid ali
WHERE name = ali
*/
ORDER BY name ASC;

/* full join */
select name+' '+sex "name sex",monthly_income
from person_abstract p
FULL JOIN department d
ON d.num_of_employees = p.num_of_employees
ORDER BY "name sex" ASC;


/* cross join */
select name,sex,monthly_income
from person_abstract p
CROSS JOIN department d
ORDER BY name ASC;