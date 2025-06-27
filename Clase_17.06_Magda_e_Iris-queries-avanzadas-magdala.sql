USE tienda;
/* 
EJERCICIO 1: 
Realiza una consulta SELECT que obtenga el número identificativo de cliente más bajo de la base de datos.
*/

SELECT MIN(customer_number) 
FROM customers;

/*
EJERCICIO 2:
Selecciona el limite de crédito medio para los clientes de España.
*/

SELECT * FROM customers;

SELECT country, AVG(credit_limit) AS credit_limit_spain
FROM customers
GROUP BY country
HAVING country = 'Spain';

/*
EJERCICIO 3:
Selecciona el numero de clientes en Francia
*/

SELECT country, COUNT(customer_number) AS french_customers
FROM customers
GROUP BY country
HAVING country = 'France';

/*
EJERCICIO 4:
Selecciona el máximo de crédito que tiene cualquiera de los clientes del empleado con número 1323.
*/

SELECT sales_rep_employee_number, MAX(credit_limit) AS credit_limit_employee_1323
FROM customers
GROUP BY sales_rep_employee_number
HAVING sales_rep_employee_number = 1323;

/*
EJERCICIO 5: 
¿Cuál es el número máximo de empleado de la tabla customers?
*/

SELECT MAX(sales_rep_employee_number) AS employee_number
FROM customers;

/*
EJERCICIO 6: 
Realiza una consulta SELECT que seleccione el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno.
*/

SELECT sales_rep_employee_number, COUNT(DISTINCT customer_number) AS customer_count
FROM customers
WHERE sales_rep_employee_number IS NOT NULL
GROUP BY sales_rep_employee_number;

/*
EJERCICIO 7: 
Selecciona el número de cada empleado de ventas que tenga más de 7 clientes distintos.
*/

SELECT sales_rep_employee_number, COUNT(DISTINCT customer_number) AS customer_count
FROM customers
WHERE sales_rep_employee_number IS NOT NULL
GROUP BY sales_rep_employee_number
HAVING customer_count > 7;


-- ---------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------- BONUS ----------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------

/*
EJERCICIO 8: 
Selecciona el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno. Asigna una etiqueta de "AltoRendimiento" a aquellos empleados con mas de 7 clientes distintos.
*/

SELECT sales_rep_employee_number,COUNT(DISTINCT customer_number), 
CASE 
	WHEN COUNT(DISTINCT customer_number) > 7 THEN "AltoRendimiento"
    END AS Rendimiento
FROM customers
WHERE sales_rep_employee_number IS NOT NULL
GROUP BY sales_rep_employee_number;


/*
EJERCICIO 9:
Selecciona el número de clientes en cada país.
*/

SELECT country, COUNT(customer_number)
FROM customers
GROUP BY country;

SELECT country, COUNT(country)
FROM customers
GROUP BY country;


/*
EJERCICIO 10:
Selecciona aquellos países que tienen clientes de más de 3 ciudades diferentes.
*/

SELECT country, COUNT(DISTINCT city) AS city_count
FROM customers
GROUP BY country
HAVING city_count > 3;