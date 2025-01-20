SELECT 
    c.Categor_Prod AS Categoria_Producto, -- Nombre de columna
    SUM(pr.Pro_Precio * p.Ped_cantidad) AS Total_Ventas, -- Suma de totales y nombre de columna
    AVG(pr.Pro_Precio * p.Ped_cantidad) AS Media_Importe_Pedido -- Calculo de promedio y nombre de columna
FROM 
    pedidos p -- Origen de los datos de pedidos
INNER JOIN 
    productos pr ON p.Ped_id_producto = pr.idproductos -- Relacion entre pedidos y productos
INNER JOIN 
    pedido_estado e ON p.Ped_Estado = e.idpedido_estado -- Relacion estre estado de pedidos y pedidos
INNER JOIN 
    categoria_producto c ON pr.Pro_Categor = c.idCategoria_producto -- Relacion entre categorias y pedidos 
GROUP BY 
    c.Categor_Prod -- Agrupacion de datos por categoria
ORDER BY 
    Total_Ventas DESC; -- Orden descendente