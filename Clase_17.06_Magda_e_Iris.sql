USE tienda;
/* Realiza una consulta SELECT que obtenga el número identificativo de cliente más bajo de la base de datos.*/

SELECT MIN(customer_number) 
FROM customers;

/*Selecciona el limite de crédito medio para los clientes de España.*/
SELECT * FROM customers;

SELECT country, AVG(credit_limit) AS credit_limit_spain
FROM customers
GROUP BY country
HAVING country = 'Spain';

/*Selecciona el numero de clientes en Francia*/

SELECT country, COUNT(customer_number) AS french_customers
FROM customers
GROUP BY country
HAVING country = 'France';

/*Selecciona el máximo de crédito que tiene cualquiera de los clientes del empleado con número 1323.*/

SELECT sales_rep_employee_number MAX(credit_limit) 