-- CHAPTER 3: QUERY PRIMER

-- 1. Show all tables
SHOW TABLES;

-- 2 Select * from tables
SELECT * FROM employee;

-- 3. Select with some columns
SELECT employee.emp_id,fname, employee.dept_id FROM employee;

-- 4. Custom select with literals, expressions, built-in function calls
SELECT employee.emp_id, 'ACTIVE', employee.emp_id * 3.14159, UPPER(employee.lname) FROM employee;

-- 5. Execute a built-in function or evaluate a simple expression, skip the FROM clause
SELECT VERSION(), USER(), DATABASE();

-- 6. Column aliases, using with SELECT Clause
SELECT employee.emp_id, 'ACTIVE' status, employee.emp_id * 3.14 empid_x_pi, UPPER(employee.lname) last_name_upper
FROM employee;

-- 6.1 Or using with AS for readability
SELECT employee.emp_id, 'ACTIVE' AS status, employee.emp_id * 3.14 AS empid_x_pi, UPPER(employee.lname) AS last_name_upper
FROM employee;

-- 7. Some records that might be duplicate
SELECT cust_id FROM account;

-- 7.1 Using keyword DISTINCT (like Set) for deduplicate (query's result showing only unique records)
SELECT DISTINCT account.cust_id FROM account;