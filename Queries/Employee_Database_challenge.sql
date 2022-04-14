SELECT employees.emp_no, 
    employees.first_name, 
    employees.last_name,
    titles.title,
    titles.from_date,
    titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no;
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;


SELECT COUNT(title)
--INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY title DESC;


SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    ti.title
-- INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles  as ti
ON e.emp_no = ti.emp_no
WHERE (ti.to_date = ('9999-01-01')
    AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31'))
ORDER BY emp_no;


