Use jugos;

-- Funcion de STRING
SELECT trim("    MySQL es fácil    ");

SELECT ltrim("    MySQL es fácil");

SELECT rtrim("MySQL es fácil    ");

SELECT concat("MySQL es fácil,", " no lo crees?");

SELECT upper("MySQL es una base de datos impresionante");

SELECT lower("MySQL es una base de datos impresionante");

SELECT substring("MySQL es una base de datos impresionante", 14, 4);

SELECT concat(nombre, " ", dni) FROM clientes;

SELECT concat(nombre, " ", direccion_1, " ", direccion_2, " ", barrio, " ", ciudad, " ", estado) 
FROM clientes;