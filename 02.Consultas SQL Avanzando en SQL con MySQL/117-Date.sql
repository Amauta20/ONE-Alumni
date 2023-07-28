Use jugos;

-- Función de fecha

SELECT curdate();

SELECT current_timestamp();

SELECT year(current_timestamp());

SELECT monthname(current_timestamp());

SELECT dayname(current_timestamp());

SELECT datediff(current_timestamp(), "2020-10-2") AS Diferencia_dias;

SELECT datediff(current_timestamp(), "1984-10-2") AS Diferencia_dias;

SELECT current_timestamp() AS Dia_Hoy,
date_sub(current_timestamp(), interval 1 month) AS Resultado;

SELECT DISTINCT fecha_venta, dayname(fecha_venta) as dia, monthname(fecha_venta) as mes, year(fecha_venta) as año
FROM facturas;

SELECT nombre, timestampdiff(year, fecha_de_nacimiento, curdate()) 
FROM clientes;