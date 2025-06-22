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

-- Los apellidos en común.
SELECT e.last_name AS Apellidos
FROM employees AS e
INNER JOIN customers AS c
ON e.last_name = c.contact_last_name;


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


/*
EJERCICIO 3:
Selecciona todos los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes como de los empleados de las tablas employees y customers.
*/

SELECT 
	first_name AS Nombre,
    last_name AS Apellidos
FROM employees
UNION ALL
SELECT 
	contact_first_name, 
    contact_last_name
FROM customers;


/*
EJERCICIO 4: 
Queremos ver ahora el employee_number como 'Número empleado', first_name como 'nombre Empleado' y last_name como 'Apellido Empleado' para los empleados con employee_number: 1002,1076,1088 y 1612.
*/

SELECT 
	employee_number AS 'Numero empleado',
    first_name AS 'Nombre empleado', 
    last_name AS 'Apellido empleado'
FROM 
	employees
WHERE 
	employee_number IN (1002, 1076, 1088, 1612);
    

/*
EJERCICIO 5: 
Queremos ver ahora la 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' de la tabla customers, que no estén en: Ireland, France, Germany.
*/

SELECT 
	country AS País, 
	city AS Ciudad, 
    customer_name AS 'Nombre de la Empresa'
FROM 
	customers
WHERE
	country NOT IN ('Ireland', 'France', 'Germany');
    

/*
EJERCICIO 6: 
Encuentra los campos nombre del cliente y ciudad, de aquellas ciudades de la tabla de customers que terminen en 'on'.
*/

SELECT 
	contact_first_name AS 'Nombre del cliente', 
    city AS Ciudad
FROM 
	customers
WHERE 
	city LIKE '%on';
    
    
/*
EJERCICIO 7:
Encuentra los campos nombre del cliente y ciudad de aquellas ciudades de la tabla de customers que terminen en 'on' y que unicamente sean de longitud 4.
*/

-- Ciudad con 4 letras en total (incluyendo el 'on')
SELECT 
	contact_first_name AS 'Nombre del cliente', 
    city AS 'Ciudad'
FROM customers
WHERE city LIKE '__on';


/*
EJERCICIO 8:
Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 en su dirección postal (o lo que es lo mismo, su primera dirección).
*/

SELECT 
	contact_first_name AS 'Nombre del cliente', 
    address_line1 AS 'Primera dirección', 
    city AS 'Ciudad'
FROM customers
WHERE 
	address_line1 LIKE '%3%';


/*
EJERCICIO 9:
Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 en su dirección postal y la ciudad no empiece por T.
*/

SELECT 
	contact_first_name AS 'Nombre del cliente', 
    address_line1 AS 'Primera dirección', 
    city AS Ciudad
FROM customers
WHERE
	address_line1 LIKE '$3$' AND city NOT LIKE 'T%';
    

/*
EJERCICIO 10: 
Selecciona, haciendo uso de expresiones regulares, los campos nombre del cliente, primera dirección y ciudad. Unicamente en el caso que la dirección postal, posea algún número en dicho campo.
*/

SELECT 
	contact_first_name AS 'Nombre del Cliente', 
    address_line1 AS 'Primera dirección', 
    city AS 'Ciudad'
FROM customers
WHERE address_line1 REGEXP '[0-9]+'; 

/*
[0-9] -> busca cualquier dígito
+ -> asegura que haya uno o más dígitos
*/
