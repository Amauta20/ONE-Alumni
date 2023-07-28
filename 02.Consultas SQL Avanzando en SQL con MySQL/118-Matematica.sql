Use jugos;

SELECT CEILING (23.1222);

SELECT FLOOR (23.999999);

SELECT RAND() AS RESULTADO;

SELECT ROUND(254.545,2);

SELECT NUMERO, CANTIDAD, PRECIO, CANTIDAD * PRECIO AS FACTURACION 
FROM items_facturas;

SELECT NUMERO, CANTIDAD, PRECIO, ROUND(CANTIDAD * PRECIO,2) AS FACTURACION 
FROM items_facturas;

SELECT * FROM facturas;
SELECT * FROM items_facturas;

SELECT  
	year(f.fecha_venta) AS INFO, 
    floor(sum(i.cantidad * i.precio * f.impuesto)) AS RESULTADO
FROM facturas f
INNER JOIN items_facturas i
ON f.numero = i.numero
WHERE year(f.fecha_venta) = 2016
GROUP BY Info;

