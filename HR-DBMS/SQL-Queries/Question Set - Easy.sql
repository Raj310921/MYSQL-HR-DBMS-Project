-- 1. Display employee first and last name and thier job grades

select employee_id, first_name, last_name, job_grade
from techwave_vision.employee;

-- 2. Display employee id and full name and email.

select employee_id, concat(first_name, ' ', last_name) Full_Name, email_id
from techwave_vision.employee;

-- 3. Get the salary information of a particular  employee

select * from techwave_vision.salary 
where employee_id = 1007;

select * from techwave_vision.salary 
where employee_id = 1004;

-- 4. Get the salary information of a particular  employee

select * from techwave_vision.benefits 
where employee_id = 1003;


-- 5. Get the latest performance review score for a particular employee

select * from techwave_vision.review 
where employee_id = 1009 
order by review_date desc 
limit 1;


-- 6. Get the name and department of all employees whos designation is 'coder'

SELECT * FROM techwave_vision.employee 
WHERE designation = 'Coder';

-- 7. GET DATA OF ALL EMPLOYEES WHO DON'T USE OUTLOOK

select * from techwave_vision.employee 
where email_id not like '%@outlook.com';

 -- 8.	Get the name and hire date of all employees who were hired in the year 2020
 
 select concat(first_name, ' ', last_name) as Full_Name, hire_date
 from techwave_vision.employee 
 where hire_date like '%2020';
 
 