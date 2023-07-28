USE jugos;

SELECT CURRENT_TIMESTAMP() AS RESULTADO;

SELECT CONCAT("La fecha y la hora de hoy son: ", CURRENT_TIMESTAMP()) AS Resultado;

SELECT CONCAT("La fecha y el horario son: ",
DATE_FORMAT(CURRENT_TIMESTAMP(), "%W, %d/%m/%Y as las %T" )) AS RESULTADO;

SELECT CONVERT(23.45, CHAR) AS RESULTADO;

SELECT SUBSTRING(CONVERT(23.45, CHAR),3,1) AS RESULTADO;


SELECT * FROM clientes;
SELECT * FROM facturas;
SELECT * FROM items_facturas;

SELECT c.nombre, 
	concat('El cliente ', c.nombre, 
		' facturo ', floor(sum(i.cantidad * i.precio)), 
        ' en el ', date_format(f.fecha_venta, "%Y")) as resultado
FROM facturas f
INNER JOIN clientes c on c.dni = f.dni
INNER JOIN items_facturas i on f.numero = i.numero
WHERE year(f.fecha_venta) = 2016
GROUP BY c.nombre, year(f.fecha_venta);

SELECT @@sql_mode; 

SET sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


