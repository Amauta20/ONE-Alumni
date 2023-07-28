SELECT ENVASE, TAMANO FROM tabla_de_productos;

SELECT DISTINCT ENVASE, TAMANO FROM tabla_de_productos;

SELECT DISTINCT ENVASE, TAMANO, SABOR FROM tabla_de_productos WHERE SABOR = "naranja";

SELECT * FROM tabla_de_clientes;

SELECT DISTINCT CIUDAD FROM tabla_de_clientes;

SELECT DISTINCT BARRIO, CIUDAD FROM tabla_de_clientes WHERE CIUDAD = "Ciudad de México";
