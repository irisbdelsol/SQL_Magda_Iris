USE tienda;


/*
EJERCICIO 1:
Calcula el número de clientes por cada ciudad 
*/

SELECT city,
COUNT(customer_number) AS conteo
FROM customers
GROUP by city;

SELECT * FROM customers;


/*
EJERCICIO 2:
Usando la consulta anterior como subconsulta, selecciona la ciudad con el mayor numero de clientes. 
*/

SELECT * 
FROM (
	SELECT city,
		COUNT(customer_number) AS conteo
		FROM customers AS c1
		GROUP BY city
		) AS c2
ORDER BY conteo DESC
LIMIT 1; 


/*
EJERCICIO 3: 
Por último, usa todas las consultas anteriores para seleccionar el customer_number, nombre y apellido de las clientas asignadas a la ciudad con mayor numero de clientas.
*/

SELECT customer_number, customer_name, contact_last_name, contact_first_name
FROM customers
WHERE (
	SELECT city 
	FROM (
	SELECT city,
		COUNT(customer_number) AS conteo
		FROM customers AS c1
		GROUP BY city
		) AS c2
	ORDER BY conteo DESC
	LIMIT 1) = city;


/*
EJERCICIO 4: 
Queremos ver ahora que empleados tienen algún contrato asignado con alguno de los clientes existentes. Para ello selecciona employeeNumber como 'Número empleado', 
firstName como 'nombre Empleado' y lastName como 'Apellido Empleado'
*/

-- Como no tengo claro como es, lo hago de dos formas. 
-- Forma 1: Supongo que cuando dice cliente existentes se refiere a los clientes del ejercicio 3. 
SELECT 
	employee_number AS 'Número empleado', 
    first_name AS 'Nombre empleado', 
    last_name AS 'Apellido empleado'
FROM employees
WHERE
	employee_number IN (
							SELECT sales_rep_employee_number
							FROM customers
							WHERE (
								SELECT city 
								FROM (
								SELECT city,
									COUNT(customer_number) AS conteo
									FROM customers AS c1
									GROUP BY city
									) AS c2
								ORDER BY conteo DESC
								LIMIT 1) = city
							);


-- Forma 2: Suponemos que los clientes existentes son todos los clientes que tenemos en nuestra base de datos

SELECT 
	employee_number AS 'Número empleado', 
    first_name AS 'Nombre empleado', 
    last_name AS 'Apellido empleado'
FROM employees 
WHERE employee_number IN (
							SELECT DISTINCT sales_rep_employee_number
							FROM customers
							WHERE sales_rep_employee_number IS NOT NULL
						);



/*
EJERCICIO 5:
Queremos ver ahora en cuantas ciudades en las cuales tenemos clientes, no también una oficina de nuestra empresa para ello: Selecciona aquellas ciudades como 'ciudad' 
y los nombres de las empresas como 'nombre de la empresa ' de la tabla customers, sin repeticiones, que no tengan una oficina en dicha ciudad de la tabla offices.
*/

SELECT 
	city AS 'Ciudad', 
	customer_name AS 'Nombre de la empresa'
FROM customers
WHERE city NOT IN (
					SELECT city
                    FROM offices
					);