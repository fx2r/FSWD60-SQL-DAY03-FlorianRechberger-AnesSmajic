--------1.REPORT Exercise 3-----------
-- total rows in DB table
SELECT COUNT(*) FROM departments;
/**
departments: 9
dept_emp: 331603
dept_manager: 24
employees: 300024
salaries: 2844047
titles: 443308
*/

--------2.REPORT Exercise 3-----------
-- employees called "Mark"
SELECT COUNT(employees.first_name) FROM employees WHERE employees.first_name = "Mark";
-- 230 Marks

--------3.REPORT Exercise 3-----------
--Amount employeed first name and starting with certain letter last name
SELECT COUNT(employees.first_name) FROM employees
WHERE employees.first_name = "Eric" AND employees.last_name LIKE 'A%';
--13 Erics A...

--output Full Names
SELECT employees.first_name, employees.last_name FROM employees
WHERE employees.first_name = "Eric" AND employees.last_name LIKE 'A%';

--------4.REPORT Exercise 3-----------
SELECT COUNT(*) FROM employees WHERE employees.hire_date > '1984-12-31'
--300024

--------5.REPORT Exercise 3-----------
--between two dates
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees WHERE employees.hire_date BETWEEN '1900-01-01' AND '1996-12-31';
--OR
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees WHERE employees.hire_date >= '1900-01-01' <= '1996-12-31';


--------6.REPORT Exercise 3-----------
--salary greater than 70000
SELECT COUNT(DISTINCT salaries.emp_no)
FROM salaries
INNER JOIN employees on salaries.emp_no = employees.emp_no
WHERE salaries.salary > 70000;
--135631

--salary greater than 70000 (showing names and coresponding salary)
SELECT employees.first_name, employees.last_name, salaries.salary
FROM employees
INNER JOIN salaries on employees.emp_no = salaries.emp_no
WHERE salaries.salary > 70000;

-------------------------------------what is the avarage salary?????????????-----------------------


--------7.REPORT Exercise 3-----------
SELECT COUNT(employees.emp_no)FROM employees
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no WHERE 
departments.dept_name = "Research" AND employees.hire_date => "1992-01-01"
--0

--------8.REPORT Exercise 3-----------

SELECT COUNT(DISTINCT employees.emp_no)
FROM employees
INNER JOIN salaries on employees.emp_no = salaries.emp_no
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE departments.dept_name = "Finance" AND employees.hire_date >= "1985-01-01" AND salaries.salary > 75000
--2

SELECT DISTINCT employees.first_name, employees last_name
FROM employees
INNER JOIN salaries on employees.emp_no = salaries.emp_no
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE departments.dept_name = "Finance" AND employees.hire_date => "1985-01-01" AND salaries.salary > 75000
--Ebru Alpin
--Isamu Legleitner

--------9.REPORT Exercise 3-----------
--cerain output
SELECT employees.last_name, employees.birth_date, employees.gender, employees.hire_date, salaries.salary, salaries.to_date, titles.title
FROM employees
INNER JOIN salaries on employees.emp_no = salaries.emp_no
INNER JOIN titles on employees.emp_no = titles.emp_no
WHERE employees.hire_date < "2011-01-01"

--------10.REPORT Exercise 3-----------
SELECT DISTINCT employees.first_name, employees.last_name, employees.birth_date, employees.gender, employees.hire_date, salaries.salary, titles.title, departments.dept_name
FROM employees
LEFT JOIN salaries on employees.emp_no = salaries.emp_no
LEFT JOIN titles on employees.emp_no = titles.emp_no
LEFT JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
LEFT JOIN departments ON dept_manager.dept_no = departments.dept_no 
UNION
SELECT DISTINCT employees.first_name, employees.last_name, employees.birth_date, employees.gender, employees.hire_date, salaries.salary, titles.title, departments.dept_name
FROM employees
RIGHT JOIN salaries on employees.emp_no = salaries.emp_no
RIGHT JOIN titles on employees.emp_no = titles.emp_no
RIGHT JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
RIGHT JOIN departments ON dept_manager.dept_no = departments.dept_no 
WHERE dept_manager.to_date < '2011-11-11' AND titles.title = 'Manager'
