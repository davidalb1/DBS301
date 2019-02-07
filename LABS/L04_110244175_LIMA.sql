-- ***********************
-- Name: David Albuquerque Lima
-- ID: 110244175
-- Date:  02 - Feb - 2019
-- Purpose: Lab 4 DBS301
-- ***********************

-- Question 1 - Display difference between avg pay and lowest pay
-- Name as Real Amount. Output with 2 decimal places 

SELECT to_char(round(avg(salary) - min(salary), 2),'$999,999.00') 
    AS "Real Amount" 
    FROM employees;
      
-- Question 2 - Display the department number, highest, lowest and avg pay
-- per each department
-- Name as High, Low and Avg
-- Sort that department with highest avg salary is shown first 
-- Output as currency 

SELECT department_id AS "Department ID",
    to_char(round(max(salary), 2),'$999,999.00') AS "High",
    to_char(round(min(salary), 2),'$999,999.00') AS "Low", 
    to_char(round(avg(salary), 2),'$999,999.00') AS "Avg"
    FROM employees
    GROUP BY department_id
    ORDER BY "High" DESC;
    
    
/*or ORDER BY to_char(round(max(salary), 2),'$999,999.00') DESC;*/
    
-- Question 3 - Display number of people that wok the same job
-- in the same department
-- Name as Dept#, Job and How Many
-- Only jobs with more than 1 person
-- Sort as Jobs with most people are shown first 

SELECT department_id AS "Dept#",
    job_id AS "Job",
    count(distinct(nvl(department_id, 0))) AS "How Many"
    FROM employees
    GROUP BY department_id, job_id
    ORDER BY "How Many";


-- Question 4 - Display for each job title, total amount paid each month
-- Exclude AD_PRES and AD_VP
-- Include Only jobs that required more than $11,000
-- Sort as top paid jobs are shown first 

SELECT job_id AS "Job Title", to_char(round(sum(salary), 0), '$999,999.00' ) AS "Total Amount Paid"
    FROM employees
    WHERE job_id NOT IN ('AD_PRES', 'AD_VP')
    GROUP BY job_id
    ORDER BY "Total Amount Paid" DESC;
    
-- Question 5 - Display for each manager how many people he/she supervises
-- Exclude managers 100, 101 and 102
-- Include only managers with more than 2 people 
-- Sort manager by most supervised people 

SELECT manager_id AS "Manager",
    count(manager_id) AS "Supervising"
    FROM employees
    WHERE manager_id NOT IN ('100', '101', '102')
    GROUP BY manager_id
    HAVING count(manager_id) > 2
    ORDER BY "Supervising" DESC; 
    
-- Question 6 - Display for each department latest and earliest hire date
-- Exclude departments 10 and 20
-- Exclude departments where last person was hired in this decade
-- Sort by most recent

SELECT department_id AS "Department",
   min(to_char(hire_date, 'dd-mm-yyyy')) AS "Earliest Hire Date",
   max(to_char(hire_date, 'dd-mm-yyyy')) AS "Latest Hire Date"
    FROM employees
    WHERE department_id NOT IN ('10', '20')
        AND to_char(hire_date, 'yyyy') > 2009
    GROUP BY department_id
    ORDER BY max(hire_date) DESC;
    

