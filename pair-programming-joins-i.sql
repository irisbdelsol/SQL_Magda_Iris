USE tienda;

-- 1
SELECT e.employee_number, e.last_name, e.first_name, c.customer_number
FROM employees AS e
CROSS JOIN customers AS c;

-- 2 -> cross 5 -> inner
/*
PRUEBAS:

SELECT COUNT(sales_rep_employee_number) AS conteo
FROM customers
GROUP BY sales_rep_employee_number;

SELECT e.employee_number, e.last_name, e.first_name, COUNT(c.sales_rep_employee_number) AS conteo
FROM employees AS e
CROSS JOIN customers AS c
GROUP BY c.sales_rep_employee_number
HAVING conteo >= 8;
-- WHERE conteo >= 8;

SELECT e.employee_number, COUNT(e.employee_number) AS conteo
FROM employees AS e
CROSS JOIN customers AS c
GROUP BY e.employee_number
WHERE conteo = 8;
-- HAVING conteo = 8;

SELECT e.employee_number, e.last_name, e.first_name, COUNT(c.sales_rep_employee_number) AS conteo
FROM employees AS e
CROSS JOIN customers AS c
GROUP BY c.sales_rep_employee_number
HAVING conteo >= 8;
-- WHERE conteo >= 8;
*/
-- 2
SELECT e.employee_number, e.last_name, e.first_name, COUNT(c.sales_rep_employee_number) AS conteo
FROM employees AS e
INNER JOIN customers AS c ON e.employee_number = c.sales_rep_employee_number
GROUP BY c.sales_rep_employee_number
HAVING conteo >= 8;

-- 5
SELECT e.employee_number, e.last_name, e.first_name, COUNT(c.sales_rep_employee_number) AS conteo
FROM employees AS e
CROSS JOIN customers AS c 
WHERE e.employee_number = c.sales_rep_employee_number
GROUP BY c.sales_rep_employee_number
HAVING conteo >= 8;