use jugos;

select * from  productos;
select * from  facturas;
select * from  items_facturas;

# Sabor | Año | Cantidad(Litros) | Porcentaje
select 
	p.SABOR as Sabor,
	year(f.FECHA_VENTA) as Fecha,
	sum(i.CANTIDAD) as Cantidad_Anual
from items_facturas i
inner join facturas f 
	on i.NUMERO  = f.NUMERO
inner join productos p  
	on i.CODIGO_DEL_PRODUCTO = p.CODIGO_DEL_PRODUCTO 
where year(f.FECHA_VENTA) = 2016
group by p.SABOR, year(f.FECHA_VENTA)
order by year(f.FECHA_VENTA) desc ;

select 
	year(f.FECHA_VENTA) as Fecha,
	sum(i.CANTIDAD) as Cantidad_Total
from items_facturas i
inner join facturas f 
	on i.NUMERO  = f.NUMERO
inner join productos p  
	on i.CODIGO_DEL_PRODUCTO = p.CODIGO_DEL_PRODUCTO 
where year(f.FECHA_VENTA) = 2016
group by year(f.FECHA_VENTA);

select 
	VS.Sabor, 
	VS.Fecha, 
	VS.Cantidad_Anual, 
	round(VS.Cantidad_Anual/VT.Cantidad_Total*100,2) as Porcentaje
from (select 
	p.SABOR as Sabor,
	year(f.FECHA_VENTA) as Fecha,
	sum(i.CANTIDAD) as Cantidad_Anual
from items_facturas i
inner join facturas f 
	on i.NUMERO  = f.NUMERO
inner join productos p  
	on i.CODIGO_DEL_PRODUCTO = p.CODIGO_DEL_PRODUCTO 
where year(f.FECHA_VENTA) = 2016
group by p.SABOR, year(f.FECHA_VENTA)) VS
inner join
(select 
	year(f.FECHA_VENTA) as Fecha,
	sum(i.CANTIDAD) as Cantidad_Total
from items_facturas i
inner join facturas f 
	on i.NUMERO  = f.NUMERO
inner join productos p  
	on i.CODIGO_DEL_PRODUCTO = p.CODIGO_DEL_PRODUCTO 
where year(f.FECHA_VENTA) = 2016
group by year(f.FECHA_VENTA)) VT
on VS.Fecha = VT.Fecha
order by VS.Cantidad_Anual desc;