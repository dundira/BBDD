SELECT 
    cl.idclientes, 
    cl.Cli_nombre, 
    COUNT(p.idpedidos) AS num_pedidos,  -- Número de pedidos realizados por el cliente y nombre de columna
    SUM(pr.Pro_Precio * p.Ped_cantidad) AS gasto_total,  -- Gasto total por cliente y nombre de columna
    AVG(pr.Pro_Precio * p.Ped_cantidad) AS promedio_gasto,  -- Promedio de gasto por cliente y nombre de columna
    c.Categor_Prod AS categoria_producto,  -- Desglose por categoría de producto y nombre de columna
    COUNT(DISTINCT pr.idproductos) AS num_productos_diferentes  -- Número de productos diferentes comprados y nombre de columna
FROM 
    clientes cl
INNER JOIN 
    pedidos p ON cl.idclientes = p.Ped_IDCliente  -- Relación entre clientes y pedidos
INNER JOIN 
    productos pr ON p.Ped_id_producto = pr.idproductos  -- Relación entre pedidos y productos
INNER JOIN 
    categoria_producto c ON pr.Pro_Categor = c.idCategoria_producto  -- Relación con categoría de producto
GROUP BY 
    cl.idclientes, cl.Cli_nombre, c.Categor_Prod  -- Agrupar por cliente y por categoría de producto
ORDER BY 
    promedio_gasto DESC;  -- Ordenar por promedio de gasto en orden descendente