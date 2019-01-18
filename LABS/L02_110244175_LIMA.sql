-- ***********************
-- Name: David Albuquerque Lima
-- ID: 110244175
-- Date: 18 - Jan - 2019
-- Purpose: Lab 2 DBS301
-- ***********************

-- Question 1 – display employee_id, last name and salary. 
-- Range $8,000 to $12,000. Sort by top salary and then last name

SELECT employee_id, last_name, to_char(salary, '$999,999.99') AS salary
    FROM employees
    WHERE (salary >= 8000 AND salary <= 12000)
    ORDER BY salary DESC, last_name;

-- Question 2 – modify #1 and show only if they work
-- as Programmers or Sales Representatives. Same sorting.

SELECT employee_id, department_id, first_name, last_name, 
to_char(salary, '$999,999.99') AS salary 
    FROM employees
    WHERE (salary BETWEEN 8000 AND 12000) 
    AND (department_id = 60) OR (department_id = 80)
    ORDER BY salary DESC, last_name;

-- Question 3 - change #2 to display same job titles
-- outside the range from #1. Same sorting

SELECT employee_id, department_id, first_name, last_name, 
to_char(salary, '$999,999.99') AS salary 
    FROM employees
    WHERE (salary NOT BETWEEN 8000 AND 12000)  
    AND (department_id = 60 OR department_id = 80)
    ORDER BY salary DESC, last_name;

-- Question 4 - Display last name, job_id and salary of
-- employee hired before 2018. Most recently hired first 

SELECT first_name, last_name, job_id,to_char(hire_date, 'dd-mm-yyyy') AS hireDate,
to_char(salary, '$999,999.99') AS salary
    FROM employees
    WHERE hire_date < to_date('01-01-18', 'dd-mm-yy')
    ORDER BY hire_date DESC;

-- Question 5 - change #4 display only employees earning
-- more than $12,000. List by job title alphabetically 
-- then by highest paid

SELECT first_name, last_name, job_id,to_char(hire_date, 'dd-mm-yyyy') AS hireDate,
to_char(salary, '$999,999.99') AS salary
    FROM employees
    WHERE hire_date < to_date('01-01-18', 'dd-mm-yy') AND salary >= 12000
    ORDER BY job_id, salary DESC;
    
-- Question 6 - Dsiplay job titles and full names of employees 
-- (first name has e or E anywhere) Bonus for not using OR

SELECT first_name, last_name, job_id 
    FROM employees 
    WHERE lower(first_name) LIKE '%e%';
    
-- Question 7 - Display last name, salary and comm%

SELECT last_name, salary, commission_pct
    FROM employees
    WHERE commission_pct is not null; 

-- Question 8 - Same as #7. Order descendending salary

SELECT last_name, salary, commission_pct
    FROM employees
    WHERE commission_pct is not null
    ORDER BY salary DESC;
    
-- Question 9 - Same as #8. Use numeric value
-- Cast convert an expression of one data type to another

SELECT last_name, salary, commission_pct
    FROM employees
    WHERE commission_pct is not null
    ORDER BY CAST(salary AS number) DESC;
