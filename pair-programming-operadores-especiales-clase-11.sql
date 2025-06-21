USE tienda;

/*
EJERCICIO 1: 
Selecciona los apellidos que se encuentren en ambas tablas para employees y customers, con alias 'Apellidos'.
*/

-- Todos los apellidos de las dos tablas
SELECT last_name AS Apellidos
FROM employees
UNION 
SELECT contact_last_name
FROM customers; 

-- Los apellidos en común. (hacerlo)
SELECT last_name
FROM employees AS e
UNION 
SELECT contact_last_name
FROM customers AS c
WHERE c.contact_last_name = employees.last_name; 


/*
EJERCICIO 2: 
Selecciona los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes como de los empleados de las tablas employees y customers.
*/

-- Todos los apellidos y nombres de las dos tablas
SELECT 
	first_name AS Nombre,
    last_name AS Apellidos
FROM employees
UNION 
SELECT 
	contact_first_name, 
    contact_last_name
FROM customers; 




