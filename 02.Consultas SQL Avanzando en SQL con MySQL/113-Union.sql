SELECT BARRIO FROM tabla_de_clientes;
SELECT BARRIO FROM tabla_de_vendedores;

SELECT BARRIO FROM tabla_de_clientes
UNION 
SELECT BARRIO FROM tabla_de_vendedores;

SELECT BARRIO FROM tabla_de_clientes
UNION ALL
SELECT BARRIO FROM tabla_de_vendedores;

SELECT BARRIO, NOMBRE, 'Cliente' FROM tabla_de_clientes
UNION
SELECT BARRIO, NOMBRE, 'Vendedor' FROM tabla_de_vendedores;