-- ***********************
-- Name: David Albuquerque Lima
-- ID: 110244175
-- Date: January 11, 2019
-- Purpose: Lab 1 DBS301
-- ***********************

-- Question 1 – write a brief note about what the question is asking
-- Q1 Solution --

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM job_history;

/*
The employees file is the longest one since it has 20 rolls while departments has 8 and
job_history has 10 rolls respectively.

*/
-- Q2 Solution --

SELECT last_name "LName", job_id "Job Tittle",
Hire_Date "Job Start"
FROM employees;

/*
The problem is the underscore that is missing in Hire_Date.
It is space sensitive
*/

-- Q3 Solution --
SELECT employee_id, first_name, last_name, department_id, salary, commission_pct, phone_number
FROM employees;

/* 
The first mistake is that is missing a comma in between commission_pct and Emp Comm
The second mistake is selecting a column that does not exist
The third mistake is the underscore is missing in last_name to match the column name
I also believe that it is missing the first name of the employee since they might have
the same last name. A contact information, the salary and which department the employee
works would be very helpful as well

*/

-- Q4 Solution --

describe locations


-- Q5 Solution --
SELECT location_id AS "City#", 
       city AS "City", 
       (state_province || ' IN THE ' || country_id) AS "Province with Country Code"
    FROM locations;

/* 
To be able to have the table that was requested, Alias has to be used
*/



