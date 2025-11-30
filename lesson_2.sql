-- CHAPTER 3: QUERY PRIMER

-- # 3.1 THE SELECT CLAUSE

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

-- # 3.2 THE "FROM" CLAUSE

-- ## 3.2.1 TABLES

/*
    Three different types of tables definition:
    - Permanent tables (created tables by using the `create table` statement)
    - Temporary tables (rows returned by a subquery)
    - Virtual tables (created tables view by using `create view` statement)
*/

-- 8. Subquery-generated tables
/*
    - Subqueries surrounded by parentheses can be found in various parts of a `select` statement; within the `from` clause
    - A subquery serves the role of generating a temporary table that is visible from all other `query` clauses and can interact with other tables named in the `from` clause
*/
SELECT e.emp_id, e.fname, e.lname FROM (SELECT emp_id, fname, lname, start_date, title FROM employee) e;
/*
    - As above, a subquery against the `employee` table returns five columns, and the containing `query` references three of the five available columns.
    - The subquery is referenced by the containing query via its alias, which, in this case, is `e`
*/

-- 9. Views
/*
    - A view is a query that is stored in the data dictionary.
    - It looks and acts like a table, but there is no data associated with a view (virtual tables)
    - When issue a query against a view, the query is merged with the view definition to create a final query to be executed
*/
CREATE VIEW employee_vw AS SELECT employee.emp_id, employee.fname, employee.lname, YEAR(employee.start_date) start_year FROM employee
/*
-- The view was created, no additional data is generated or stored; the server simply tucks away the `select` statement for future use.
-- Now the view exists, can issue queries against it:
 */
-- 9.1 Querying from views (or virtual tables)
SELECT emp_id, start_year FROM employee_vw
-- Views are created for various reasons, including to hide columns from users, and to simplify complex database designs

-- ## 3.2.2 Tables Links

/*
 - The second deviation (khác biệt) from the simple `from` clause definition is the mandate (yêu cầu) that if more than one tables appears in the `from` clasue, the conditions
    used to links the tables must be included as well.
 - ANSI-approved (SQL ANSI or ANSI SQL - SQL standard by American National Standards Institute) method of joining multiple tables.
 */

SELECT employee.emp_id, employee.fname, employee.lname, department.name dept_name FROM employee INNER JOIN department ON employee.dept_id = department.dept_id;