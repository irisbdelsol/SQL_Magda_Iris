USE tienda;
/*Selecciona el ID, nombre, apellidos de todas las empleadas y el ID de cada cliente asociado a ellas (si es que lo tienen).*/

/*Ejercicio 1*/
SELECT
e.employee_number,
e.first_name,
e.last_name,
c.customer_number 
FROM employees AS e
LEFT JOIN customers AS c
ON 
e.employee_number = c.sales_rep_employee_number;

/*Ejercicio 2
Selecciona el ID de todos los clientes, y el nombre, apellidos de las empleadas que llevan sus pedidos (si es que las hay).
*/

SELECT 
c.customer_number, 
e.first_name,
e.last_name
FROM employees AS e
RIGHT JOIN customers AS c
ON 
e.employee_number = c.sales_rep_employee_number;

SELECT
c.customer_number,
e.first_name,
e.last_name
FROM customers AS c
LEFT JOIN employees AS e
ON 
e.employee_number = c.sales_rep_employee_number;

/*Ejercicio 3
Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando LEFT JOIN. 
*/
SELECT 
e.employee_number,
e.first_name,
e.last_name, 
COUNT(c.sales_rep_employee_number) AS conteo
FROM employees AS e
LEFT JOIN customers AS c
ON 
e.employee_number = c.sales_rep_employee_number
GROUP BY c.sales_rep_employee_number
HAVING conteo >= 8;

/*Ejercicio 4
Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando RIGHT JOIN. */

SELECT 
e.employee_number,
e.first_name,
e.last_name, 
COUNT(c.sales_rep_employee_number) AS conteo
FROM customers AS c
RIGHT JOIN employees AS e
ON 
e.employee_number = c.sales_rep_employee_number
GROUP BY c.sales_rep_employee_number
HAVING conteo >= 8;

