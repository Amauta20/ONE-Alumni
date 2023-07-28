SELECT DISTINCT BARRIO FROM tabla_de_vendedores;

SELECT * FROM tabla_de_clientes
WHERE BARRIO IN (SELECT DISTINCT BARRIO FROM tabla_de_vendedores);

SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO FROM tabla_de_productos
GROUP BY ENVASE;

SELECT X.ENVASE, X.PRECIO_MAXIMO FROM
(SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO FROM tabla_de_productos
GROUP BY ENVASE) X
WHERE PRECIO_MAXIMO > 10;


SELECT DNI, COUNT(*) FROM facturas
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY DNI
HAVING COUNT(*) > 2000;

SELECT Y.DNI, Y.CONTADO FROM
(SELECT DNI, COUNT(*) AS CONTADO FROM facturas
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY DNI) Y
WHERE Y.CONTADO > 2000;
