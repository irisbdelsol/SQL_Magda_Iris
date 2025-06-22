USE tienda;

-- 1
/*
Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando CROSS JOIN.
*/

SELECT 
	e.employee_number AS 'ID empleada', 
    e.last_name AS 'Apellido empleada', 
    e.first_name AS 'Nombre empleada', 
    c.customer_number AS 'ID cliente'
FROM employees AS e
CROSS JOIN customers AS c
WHERE e.employee_number = c.sales_rep_employee_number;


-- 2
/*
Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando CROSS JOIN.
*/

SELECT 
	e.employee_number AS 'ID empleada', 
    e.last_name AS 'Apellido empleada', 
    e.first_name AS 'Nombre empleada', 
    COUNT(c.sales_rep_employee_number) AS conteo
FROM employees AS e
CROSS JOIN customers AS c 
WHERE e.employee_number = c.sales_rep_employee_number
GROUP BY c.sales_rep_employee_number
HAVING conteo >= 8;


-- 3
/*
Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando CROSS JOIN.
*/

SELECT 
    e.first_name AS 'Nombre empleada',
    e.last_name AS 'Apellido empleada',
    c.sales_rep_employee_number AS 'ID empleada',
    COUNT(c.country) AS conteo_pais
FROM employees AS e
CROSS JOIN customers AS c
WHERE e.employee_number = c.sales_rep_employee_number
GROUP BY c.sales_rep_employee_number
HAVING conteo_pais > 1;


-- 4
/*
Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando INNER JOIN.
*/

SELECT 
	e.employee_number AS 'ID empleado',
    e.first_name AS 'Nombre empleada', 
    e.last_name AS 'Apellido empleada', 
    c.customer_number AS 'ID cliente'
FROM employees AS e
INNER JOIN customers AS c
ON e.employee_number = c.sales_rep_employee_number;

-- 5
/*
Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando INNER JOIN.
*/

SELECT 
	e.employee_number AS 'ID empleado', 
    e.last_name AS 'Apellido empleado', 
    e.first_name AS 'Nombre empleado', 
    COUNT(c.sales_rep_employee_number) AS conteo_clientes
FROM employees AS e
INNER JOIN customers AS c 
ON e.employee_number = c.sales_rep_employee_number
GROUP BY c.sales_rep_employee_number
HAVING conteo_clientes >= 8;


-- 6
/*
Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando INNER JOIN.
*/

SELECT 
	e.first_name AS 'Nombre empleada',
    e.last_name AS 'Apellido empleada',
    c.sales_rep_employee_number AS 'ID empleada',
    COUNT(c.country) AS conteo_pais
FROM employees AS e
INNER JOIN customers AS c 
ON e.employee_number = c.sales_rep_employee_number
GROUP BY c.sales_rep_employee_number
HAVING conteo_pais > 1;
