Employee Table
+-------------+------------+-----------+--------------+--------+------------+
| employee_id | first_name | last_name | department_id| salary | hire_date  |
+-------------+------------+-----------+--------------+--------+------------+
|      1      |    John    |    Doe    |      10      |  5000  | 2015-01-12 |
|      2      |    Jane    |   Smith   |      20      |  6000  | 2016-06-23 |
|      3      |    Mike    |   Brown   |      10      |  5500  | 2018-03-30 |
|      4      |    Emily   |   Davis   |      30      |  7000  | 2017-09-11 |
|      5      |    Jack    |   White   |      20      |  4500  | 2019-07-19 |
+-------------+------------+-----------+--------------+--------+------------+

Department Table
+--------------+------------------+-------------+
| department_id| department_name  | location_id |
+--------------+------------------+-------------+
|      10      |      Sales       |      1      |
|      20      |       HR         |      2      |
|      30      |       IT         |      3      |
+--------------+------------------+-------------+

Salaries Table
+-------------+--------+------------+------------+
| employee_id | salary | start_date |  end_date  |
+-------------+--------+------------+------------+
|      1      |  5000  | 2015-01-12 | 2019-01-12 |
|      2      |  6000  | 2016-06-23 | 2020-06-23 |
|      3      |  5500  | 2018-03-30 |    NULL    |
|      4      |  7000  | 2017-09-11 | 2021-09-11 |
+-------------+--------+------------+------------+


-- QUESTION AND ANSWER

-- 1.  List all employees' first names and salaries.  
SELECT first_name, salary from Employee ;

-- 2. Display the full name (first and last) of employees.
SELECT CONCAT(first_name, ' ', last_name) as `full name` FROM Employee;

-- 3.  Find all employees who earn more than 5000.
SELECT * from Employee WHERE salaries > 5000;

-- 4. Retrieve employees hired after 2017.
SELECT * from Employee WHERE hire_date > "2017-01-01";

-- 5. Find employees whose first name starts with 'J'.
SELECT * from Employee WHERE first_name LIKE "J%";

-- 6.  Show all employees who work in the 'Sales' department.
SELECT E.* FROM Employee E JOIN Department D ON E.department_id = D.department_id WHERE D.department_name = "Sales";

-- 7.  Find the distinct departments available.
SELECT DISTINCT department_name from Department

-- 8.  Count how many employees are in each department.
SELECT D.department_name, COUNT(E.employee_id) as employee_count From Employee E JOIN Department D ON E.department_id = D.department_id group by D.department_name

-- 9. List employees in descending order by salary.
SELECT * FROM Employee order by salary DESC

-- 10. Find the employee with the highest salary.
SELECT * FROM Employee order by salary DESC LIMIT 1;

SELECT * FROM Employee where salary = (select MAX(salary) from Employee)

-- 11. Display the sum of all employees' salaries.
SELECT SUM(salary) FROM Employee;

-- 12. Find the average salary in the 'HR' department.
SELECT AVG(salary) FROM Employee where department_id =  20;

SELECT AVG(salary) FROM Employee E
JOIN Department D ON E.department_id = D.department_id
where D.department_name = "HR";

-- 13. Check which employees were hired before 2018 but still earn less than 5500.
SELECT * FROM Employee WHERE hire_date < "2018-01-01" AND salary < "5500"

-- 14. Retrieve all employees who are not in the 'IT' department.
SELECT * FROM Employee WHERE department_id <> 30;

SELECT * FROM Employee E
JOIN Department D ON E.department_id = D.department_id
where D.department_name != "IT"

-- 15. Select the employees who do not have a salary record in the Salaries table.
SELECT * FROM Employee E LEFT JOIN Salaries S ON E.employee_id = S.employee_id WHERE S.salary IS NULL;

-- 16. Find employees with a salary between 4500 and 7000.
SELECT * FROM Employee WHERE salary BETWEEN 4500 AND 7000

-- 17. Display employees along with their department name.
SELECT E.first_name, E.last_name FROM Employee E JOIN Department D ON E.department_id = D.department_id 

-- 18. List employees who have worked for more than 3 years.
SELECT * FROM Employee WHERE DATEDIFF(NOW(), hire_date) > (3 * 365);

SELECT * FROM Employee WHERE hire_date < NOW() - INTERVAL 3 YEAR;

-- 19. Check if there are any employees without a department assigned.
SELECT * FROM Employee WHERE department_id IS NULL;

-- 20. Find employees who were hired within the last 2 years.
SELECT * FROM Employee WHERE DATEDIFF(NOW(), hire_date) <= (2 * 365);

SELECT * FROM Employee WHERE hire_date >= DATE_SUB(CURRENT_DATE() , INTERVAL 2 YEAR);

-- 21. What is the highest salary in each department?
SELECT D.department_name, MAX(E.salary) AS highest_salary FROM Employee E
JOIN Department D ON E.department_id = D.department_id
GROUP BY D.department_name

-- 22. Find the total salary expenditure for each department.
SELECT D.department_name, SUM(E.salary) AS total_salary FROM Employee E
JOIN Department D ON E.department_id = D.department_id
GROUP BY D.department_name

-- 23. List employees who earn more than the average salary of their department.
SELECT E.first_name, E.last_name, E.salary, D.department_name FROM Employee E 
JOIN Department D ON E.department_id = D.department_id
WHERE E.salary > (select AVG(salary) FROM Employee  GROUP BY department_id = E.department_id)

-- 24. Write a query to swap the first name and last name of all employees.
UPDATE Employee SET first_name = last_name, last_name = first_name

-- 25. Display employees who work in either 'HR' or 'IT' departments.
SELECT * FROM Employee E
JOIN Department D ON E.department_id = D.department_id
where D.department_name = "HR" OR D.department_name = "IT"

-- 26. Find the number of employees hired in each year. 
SELECT YEAR(hire_date) as hire_year, COUNT(*) as employee_count from Employee group by YEAR(hire_date);

-- 27. Find employees whose salary is greater than the average salary of their department plus 10%
SELECT E.first_name, E.last_name FROM Employee E where E.salary > (SELECT AVG(E2.salaries) * 1.1  from Employee E2 WHERE E2.department_id = E.department_id)

-- 28. List the top 5 highest-paid employees. 
SELECT * FROM Employee ORDER BY salary DESC LIMIT 5

-- 29. Display the longest-serving employee in each department. 
SELECT E.department_id, E.first_name, E.last_name, MIN(E.hire_date) as hire_date FROM Employee E GROUP BY E.department_id

-- 30. Identify the departments with the highest average salary.
SELECT D.department_name, AVG(E.salary) as average_salary FROM Employee 
JOIN Department D ON E.department_id = D.department_id 
GROUP BY D.department_name ORDER BY average_salary DESC LIMIT 1

-- 31. Find employees who are making less than the minimum salary in their department.
SELECT E.first_name, E.last_name, E.salary, D.department_name FROM Employee E
JOIN Department D ON E.department_id = D.department_id
WHERE E.salary < (SELECT MIN(salary) FROM Employee WHERE department_id = E.department_id)

-- 32. Find all employees who earn the same as at least two other employees.
SELECT E.first_name, E.last_name FROM Employee E where (SELECT COUNT(*) from Employee E1 WHERE E1.salary = E.salary) >= 3

-- 33. Write a recursive query to list managers and their direct reports. 

WITH RECURSIVE ManagerHierarchy AS (
    -- Anchor member: Start with employees who do not have a manager (top-level managers)
    SELECT 
        employee_id AS manager_id,
        first_name AS manager_name,
        employee_id AS employee_id,
        first_name AS employee_name,
        0 AS level
    FROM Employee
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive member: Find direct reports for each manager
    SELECT 
        mh.manager_id,
        mh.manager_name,
        e.employee_id,
        e.first_name AS employee_name,
        mh.level + 1 AS level
    FROM Employee e
    INNER JOIN ManagerHierarchy mh
        ON e.manager_id = mh.employee_id
)
-- Final query: List all managers and their direct reports
SELECT 
    manager_name,
    employee_name,
    level
FROM ManagerHierarchy
ORDER BY manager_name, level, employee_name;