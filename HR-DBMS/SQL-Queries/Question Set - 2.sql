-- 1.	Find the list of employees who have received a rating of 9 or more in their latest performance review

select * from techwave_vision.review 
where score = 9 && review_date like '%2023'
order by review_date desc;


-- 2. Find the total benefit amount for each employee

select employee_id, concat(sum(benefit_amount), ' Rs.') Total_Benefit_Amount from techwave_vision.benefits
group by employee_id;


-- 3.	Get the name and salary of all employees who have a salary greater than or equal to 6 LPA

select * from techwave_vision.salary
where ctc_lpa >= 6;


-- 4.	Get the name and review date of all employees who have a review score less than 8

select e.employee_id, e.first_name, r.review_date, r.score from techwave_vision.employee e
join techwave_vision.review r
on e.employee_id = r.employee_id
where r.score < 8; 


-- 5. GET NAME, EMAIL & BENEFIT DETAILS OF ALL THE EMPLOYEES WHO ARE ON NOTICE PERIOD.

select CONCAT(e.first_name, " ", e.last_name)as FULL_NAME, e.email_id as EMAIL, b.scheme_id,
 b.scheme_type, b.benefit_amount, b.end_date from techwave_vision.employee e
JOIN techwave_vision.benefits b
on e.employee_id = b.employee_id
where e.on_notice like 'yes'
ORDER BY b.scheme_id;


-- 6. COMPANY WANTS TO GIVE BONUSES TO TOP PERFORMERS OF LAST YEAR. GET THE LIST OF ALL EMPLOYEES WHO WERE SCORED 9 BY THEIR RESPECTIVE MANAGERS.

select e.first_name, e.last_name, r.review_date, r.review_id, r.score from techwave_vision.employee e
JOIN techwave_vision.review r
on e.employee_id = r.employee_id
where r.review_date like '%2023' && r.score = 9
order by e.employee_id;


-- 7. COMPANY WANTS TO SEND MAIL TO ALL EMPLOYEES WITH THEIR PERFORMANCE REVIEW DETAILS. GET FULL NAME, 
-- EMAIL-ID AND REVIEW DETAILS OF ALL EMPLOYEES WHOS REVIEWS FOR LAST YEAR HAS BEEN DONE.

select concat(e.first_name, " ", e.last_name)as Full_Name, e.email_id, r.* from techwave_vision.employee e
RIGHT JOIN techwave_vision.review r
on e.employee_id = r.employee_id
where r.review_date like '%2023'
order by e.employee_id;



-- 8. GET THE LIST OF EMPLOYEES WHOS INDUCTION HAS NOT BEEN DONE YET.

select * from techwave_vision.employee
where induction_status like 'no';


-- 9. GET THE JOB HIERARCHY IN THE COMPANY BY JOB GRADES.

select employee_id, first_name, last_name, designation, job_grade from techwave_vision.employee
order by job_grade desc;


-- 10. GET THE TOTAL BENEFIT AMOUNTS OF ALL EMLOYEES;

select employee_id, concat(sum(benefit_amount), " Rs.")as Total_Benefit_Amount from techwave_vision.benefits
group by employee_id;

-- 11. GET THE AVERAGE SALARY ALL EMLOYEES DESIGNATION WISE.

select e.designation as Designation, concat(round(avg(s.ctc_lpa)), " LPA") Average_Sal from techwave_vision.employee e
JOIN techwave_vision.salary s
on e.employee_id = s.employee_id
group by e.designation;