-- ***********************
-- Name: David Albuquerque Lima
-- ID: 110244175
-- Date:  26 - Jan - 2019
-- Purpose: Lab 3 DBS301
-- ***********************

-- Question 1 - Display tomorrow's date. example:  January 10th of year 2019
-- and label the column "Tomorrow"

SELECT to_char(sysdate + 1, 'Monthddth" of year "yyyy') 
    AS "Tomorrow"
    FROM dual; 


-- Question 2 - For departments 20, 50 and 60 - Last name, first name, salary
-- and salary increased by 4% as a whole number
-- label column "Good Salary". Add column that subtracts old salary and 
-- multiplies by 12. Laber coloumn "Annual Pay Increase"

SELECT department_id AS "Department", 
    last_name AS "Last Name", 
    first_name AS "First Name", 
    to_char(salary, '$999,999.99') AS "Salary", 
    to_char(round(salary * 1.04, 0), '$999,999.99') AS "Good Salary",
    to_char((round(salary * 1.04, 0) - salary)* 12, '$999,999.99') AS "Annual Pay Increase"
    FROM employees
    WHERE department_id IN (20, 50, 60);


-- Question 3 - Display employee's full name and job title 
-- as DAVIES, CURTIS is ST_CLERK 
-- only last name ends with S and first name starts with C or K
-- give column label and sorts by last name

SELECT upper(last_name || ', ' || first_name) || ' is ' || 
    upper(job_id) AS "Job Title"
    FROM employees
    WHERE upper(last_name) LIKE '%S' AND (upper(first_name) LIKE 'C%' 
    OR upper(first_name) LIKE 'K%')
    ORDER BY last_name DESC;
   
   
-- Question 4 - employee before 2012, last name, hire date 
-- and calculate number of years between today and hire date
-- label column Years worked
-- Order by number of years. Round to the closest whole number

SELECT last_name AS "Last Name",
    to_char(hire_date, 'dd-mm-yyyy') AS "Hire Date",
    round(to_number(sysdate - hire_date)/365)AS "Years Worked"
FROM employees 
WHERE to_char(hire_date, 'yyyy') < '2012'
ORDER BY round(to_number(sysdate - hire_date)) DESC;

-- Question 5 - Display city names, country codes and state provinces names
-- only cities that start with S and has at least 8 characters
-- If city has no province name assigned, put Unknown Province 
-- Cautious of case sensitivity 

SELECT city AS "City",
    country_id AS "Country Code",
    nvl(state_province, 'Unknow Province') AS "Province Name"
    FROM locations
    WHERE upper(city) LIKE 'S%' AND  length(city) < 9;
    


-- Question 6 - Display employees' last name, hire date and salary
-- review date (First Thursday a year of service)
-- only for hired after 2017
-- label column REVIEW DAY
-- Format date as: THURSDAY, August the Thirty-First of year 2018
-- Sort by review date

SELECT last_name AS "Last Name",
    to_char(hire_date, 'dd-mm-yyyy') AS "Hire Date",
    salary AS "Salary",
    to_char(next_day(add_months(hire_date, 12), 'Thursday'), 
    'fmDAY"," Month "the" Ddspth "of year" yyyy' ) AS " REVIEW DAY"
    FROM employees
    WHERE to_char(hire_date, 'yyyy') > '2017';
    
 
    
    