USE tienda;
/*Calcula el número de clientes por cada ciudad */

SELECT city,
COUNT(customer_number) AS conteo
FROM customers
GROUP by city;

SELECT * FROM customers;

/*Usando la consulta anterior como subconsulta, selecciona la ciudad con el mayor numero de clientes. */
SELECT * 
FROM (
SELECT city,
    COUNT(customer_number) AS conteo
	FROM customers AS c1
    GROUP by city
    ) AS c2
ORDER BY conteo desc
LIMIT 1; 




/* ERROR:
SELECT tabla.city, MAX(tabla.conteo)
FROM (
SELECT city,
    COUNT(customer_number) AS conteo
	FROM customers
    GROUP by city
    ) AS tabla;
*/

