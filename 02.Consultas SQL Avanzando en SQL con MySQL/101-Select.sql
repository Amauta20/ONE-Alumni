USE jugos_ventas;

SELECT * FROM tabla_de_clientes;

SELECT DNI, Nombre FROM tabla_de_clientes;

SELECT DNI AS Identificacion, Nombre AS Clientes FROM tabla_de_clientes;

SELECT * FROM tabla_de_productos;

SELECT * FROM tabla_de_productos WHERE SABOR = 'Uva';

SELECT * FROM tabla_de_productos WHERE SABOR = 'Mango';

SELECT * FROM tabla_de_productos WHERE ENVASE = 'Botella PET';

SELECT * FROM tabla_de_productos WHERE ENVASE = 'botella pet';

SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA > 16;

SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA <= 16;

SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA BETWEEN 16.0 AND 16.2;