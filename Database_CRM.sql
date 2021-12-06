-- Database: Database_CRM

-- DROP DATABASE IF EXISTS "Database_CRM";

CREATE DATABASE "Database_CRM"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
create table person(
	person_id int primary key,
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	gender char(1) not null,	
	date_of_birth date,
	email varchar(25),
	contact_no bigint not null,
    addresss varchar(30) 
	);
	
create table lead(
	lead_id int primary key,
	created_at date not null,
	person_id int references person(person_id)
	);
	
create table plan(
	plan_id int primary key,
	plan_name varchar(15) not null,	
	plan_validity varchar(20) not null,
	plan_data varchar(20) not null,
	plan_price char(15) not null 
	);
	
create table opportunity(
	opportunity_id int primary key,
	created_at date not null,
	emp_id int , 
	lead_id int references lead(lead_id),
	plan_id int references plan(plan_id)
	);
	
create table customer(
	customer_id int primary key,
	cust_username varchar(25) not null,
	cust_password varchar(25) not null,
	ac_details varchar(20) not null,
	opportunity_id int references opportunity(opportunity_id),
	plan_id int references plan(plan_id)
	);
	
create table employee(
	emp_id int primary key,
	designation varchar(25) not null,
	person_id int references person(person_id),
	customer_id int references customer(customer_id)
	);
	
create table task(
	task_id int primary key,
	task_name varchar(25) not null,
	task_desc varchar(25) not null,
	task_status varchar(20) not null,
	start_date date,
	expected_end_date date,
	actual_end_date date,
	assigned_by varchar(25) not null,
	module_id int not null,
	module_name varchar(20),
	emp_id int references employee(emp_id)
	);



-------INSERTION------

--Person Table


insert into person (person_id,first_name,last_name,gender,date_of_birth,email,contact_no,addresss)
	values
	( 1, 'Shubhangi' , 'Pangare', 'F', '1997-11-08','shub@gmail.com', 9284840608, 'Pune'), 
	( 2, 'Sameer' , 'Shaikh', 'M', '1991-11-15','sameer@gmail.com', 8087407806 , 'solapur'), 
	( 3, 'Apeksha' , 'Gajbe', 'F', '1993-01-21','apeksha@gmail.com', 7865389722 , 'Mahabaleshwar'),
	( 4, 'Shruti' , 'Dubey', 'F', '1997-02-16','dubey@gmail.com', 8364536453, 'Hyderabad') ,
	( 5, 'Amam' , 'Shah', 'M', '1999-01-05','amam@gmail.com', 9283746564 , 'Satara') ,
	( 6, 'Neelay' , 'Kadam', 'M', '1999-08-10','neelay@gmail.com', 9998388386 , 'Pashan') ,
	( 7, 'Sarthak' , 'Deshmukh', 'M', '1993-01-20','sarthak@gmail.com', 9287374658 , 'Gujrat') ,
	( 8, 'Rahul' , 'Kapoor', 'M', '1997-02-22','rahul@gmail.com', 9283745345 , 'Patna') ,
	( 9, 'Akash' , 'Shinde', 'M', '2000-07-25','akash@gmail.com', 9283745231 , 'Surat') ,
	( 10,'Simran', 'Prasad', 'F', '2002-12-31','simran@gmail.com', 9998128838 , 'Delhi');


--Lead Table


insert into lead ( lead_id,created_at,person_id)
values 
(1,'2021-10-31', 3 ),
(2,'2021-11-15', 4 ),
(3,'2021-09-17', 5 ),	
(4,'2021-08-09', 6 ),
(5,'2021-12-3', 7 ),
(6,'2021-07-22', 8 );

---Plan Table

insert into plan (plan_id,plan_name,plan_validity,plan_data,plan_price) 
values
(1, '50Mbps', '1 month', '180GB' , 399 ),
(2, '200Mbps', '3 months', 'unlimited' , 9999 ),
(3, '100Mbps', '6 months', 'free installation' , 399 ),
(4, '200Mbps', '12 month', 'fast speed' , 599 ),
(5, '150Mbps', '9 month', 'easy downloads' , 799 );


---Opportunity Table

insert into opportunity(opportunity_id,created_at,emp_id,lead_id) 
values 
	(1, '2021-09-20', 3, 2),
	(2, '2021-08-15', 4, 1),
	(3, '2021-12-10', 5, 4),
	(4, '2021-05-09', 5, 4),
	(5, '2021-12-08', 5, 4),
	(6, '2021-07-25', 6, 5);
	


----Customer Table

insert into customer 
values
(1, 'Vaishnavi' , '12345', '1102928182', 1, 4 ),
(2, 'Sayali' , '12345', '1102928182', 2, 5 ),
(3, 'Mayank' , '12345', '1102928182', 4, 3 ),
(4, 'Shantanuu' , '12345', '1102928182', 5, 1 ),
(5, 'Sarah', '12345', '1102928182', 3, 2 );

---Employee Table
	
insert into employee (emp_id,designation,person_id,customer_id ) 
values
(11, 'Asstt Officer', 5, 1),
(12, 'Engineer', 2, 3),
(13, 'Manager', 7, 2),
(14, 'Asst Manager', 10, 5),
(15, 'Employee', 1, 2);


---Task Table

insert into task(task_id,task_name,task_desc,task_status,start_date,expected_end_date,actual_end_date,assigned_by,module_id,module_name,emp_id) 
values
(11, 'Installation', 'Installing new broadband','completed', '2020-07-26' ,'2021-08-30','2021-11-01', 'admin1', 011, 'INSTALL', '11'),

(21, 'Updation', 'Updating new broadband','Pending', '2020-07-26' ,'2021-08-30','2021-12-01', 'Manager', 012, 'UPDATE', '12'),

(31, 'Modification', 'Modifying new broadband','completed', '2020-08-26' ,'2021-09-30','2021-10-01', 'Asst Manager', 013, 'MODIFY', '13');	


---QUERIES

4:
select * from lead;

5:
select le.lead_id ,le.created_at, le.person_id, opp.opportunity_id, opp.plan_id from lead le join opportunity opp using(lead_id) ;

6:
select le.lead_id ,le.created_at, le.person_id, cus.customer_id, opp.opportunity_id
	from lead le
	join opportunity opp ON opp.lead_id = le.lead_id
	join customer cus ON cus.opportunity_id = opp.opportunity_id;
	
7:
select le.lead_id ,le.created_at, le.person_id, cus.customer_id, opp.opportunity_id
from lead le
join opportunity opp ON opp.lead_id = le.lead_id
join customer cus ON cus.opportunity_id = opp.opportunity_id;

8:
select count(task_id) from task group by module_id;

9:
select * from task;

11:
select * from task where start_date != current_date;

12:
select * from task where task_status = 'completed';

13:
select * from task where start_date > current_date;

14:
select cus.customer_id , cus.ac_details, pe.contact_no, pe.first_name
	from customer cus 
	join opportunity opp ON opp.opportunity_id = cus.opportunity_id
	join lead le ON  le.lead_id = opp.lead_id
	join person pe ON  pe.person_id=  le.person_id;


15:
select count(le.lead_id) 
from lead le
join opportunity opp ON opp.lead_id = le.lead_id
join customer cus ON cus.opportunity_id = opp.opportunity_id;

16:
select * from opportunity;

17:
select  cus.customer_id, opp.opportunity_id, cus.cust_username
	from opportunity opp
	join customer cus ON cus.opportunity_id = opp.opportunity_id;

18:
select count(plan_id) from customer group by plan_id;


