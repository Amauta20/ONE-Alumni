Use jugos;

SELECT * FROM clientes;
SELECT * FROM facturas;
SELECT * FROM items_facturas;

SELECT f.DNI, f.FECHA_VENTA, i.CANTIDAD
FROM facturas f
INNER JOIN items_facturas i
ON f.NUMERO = i.NUMERO;

SELECT f.DNI, date_format(f.FECHA_VENTA, "%m-%Y") as Fecha, i.CANTIDAD as Cantidad
FROM facturas f
INNER JOIN items_facturas i
ON f.NUMERO = i.NUMERO;

-- Cantidad de ventas al mes por cliente

SELECT f.DNI, 
	c.nombre,
    date_format(f.FECHA_VENTA, "%m-%Y") as Fecha, 
    floor(sum(i.CANTIDAD)) as Cantidad,
    max(c.volumen_de_compra)/10 as Cantidad_Maxima	
FROM facturas f
INNER JOIN items_facturas i ON f.NUMERO = i.NUMERO
INNER JOIN clientes c ON f.dni = c.dni
WHERE c.volumen_de_compra >= i.cantidad
GROUP BY f.DNI, c.nombre, Fecha;

SELECT A.dni,
	A.nombre,
    A.fecha,
    (A.cantidad - A.cantidad_maxima) as Diferencia
FROM (
	SELECT f.DNI, 
	c.nombre,
    date_format(f.FECHA_VENTA, "%m-%Y") as Fecha, 
    floor(sum(i.CANTIDAD)) as Cantidad,
    max(c.volumen_de_compra)/10 as Cantidad_Maxima	
FROM facturas f
INNER JOIN items_facturas i ON f.NUMERO = i.NUMERO
INNER JOIN clientes c ON f.dni = c.dni
WHERE c.volumen_de_compra >= i.cantidad
GROUP BY f.DNI, c.nombre, Fecha
) A;


SELECT A.dni,
	A.nombre,
    A.fecha,
    (A.cantidad - A.cantidad_maxima) as Diferencia,
    CASE
		WHEN (A.cantidad - A.cantidad_maxima) <= 0 THEN 'Venta Valida'
		ELSE 'Venta Invalida'
    END as Status_Venta
FROM (
	SELECT f.DNI, 
	c.nombre,
    date_format(f.FECHA_VENTA, "%m-%Y") as Fecha, 
    floor(sum(i.CANTIDAD)) as Cantidad,
    max(c.volumen_de_compra)/10 as Cantidad_Maxima	
FROM facturas f
INNER JOIN items_facturas i ON f.NUMERO = i.NUMERO
INNER JOIN clientes c ON f.dni = c.dni
WHERE c.volumen_de_compra >= i.cantidad
GROUP BY f.DNI, c.nombre, Fecha
) A;

Use jugos;

SELECT A.DNI, A.NOMBRE, A.MES_AÑO, 
A.CANTIDAD_VENDIDA - A.CANTIDAD_MAXIMA AS DIFERENCIA,
CASE
   WHEN  (A.CANTIDAD_VENDIDA - A.CANTIDAD_MAXIMA) <= 0 THEN 'Venta Válida'
   ELSE 'Venta Inválida'
END AS STATUS_VENTA, ROUND((1 - (A.CANTIDAD_MAXIMA/A.CANTIDAD_VENDIDA)) * 100,2) AS PORCENTAJE
 FROM(
SELECT F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y") AS MES_AÑO, 
SUM(IFa.CANTIDAD) AS CANTIDAD_VENDIDA, 
MAX(VOLUMEN_DE_COMPRA)/10 AS CANTIDAD_MAXIMA  
FROM facturas F 
INNER JOIN 
items_facturas IFa
ON F.NUMERO = IFa.NUMERO
INNER JOIN 
clientes TC
ON TC.DNI = F.DNI
GROUP BY
F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y"))A
WHERE (A.CANTIDAD_MAXIMA - A.CANTIDAD_VENDIDA) < 0;


SELECT A.DNI, A.NOMBRE, A.MES_AÑO, 
A.CANTIDAD_VENDIDA - A.CANTIDAD_MAXIMA AS DIFERENCIA,
CASE
   WHEN  (A.CANTIDAD_VENDIDA - A.CANTIDAD_MAXIMA) <= 0 THEN 'Venta Válida'
   ELSE 'Venta Inválida'
END AS STATUS_VENTA, ROUND((1 - (A.CANTIDAD_MAXIMA/A.CANTIDAD_VENDIDA)) * 100,2) AS PORCENTAJE
 FROM(
SELECT F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y") AS MES_AÑO, 
SUM(IFa.CANTIDAD) AS CANTIDAD_VENDIDA, 
MAX(VOLUMEN_DE_COMPRA)/10 AS CANTIDAD_MAXIMA  
FROM facturas F 
INNER JOIN 
items_facturas IFa
ON F.NUMERO = IFa.NUMERO
INNER JOIN 
clientes TC
ON TC.DNI = F.DNI
GROUP BY
F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y"))A
WHERE (A.CANTIDAD_MAXIMA - A.CANTIDAD_VENDIDA) < 0 AND ROUND((1 - (A.CANTIDAD_MAXIMA/A.CANTIDAD_VENDIDA)) * 100,2) > 50
AND A.MES_AÑO LIKE "%2018";