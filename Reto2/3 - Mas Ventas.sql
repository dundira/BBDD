SELECT 
    pr.Pro_Nombre,  -- Nombre del producto
    COUNT(p.Ped_id_producto) AS cantidad_ordenada,  -- Contar cuántas veces ha sido ordenado cada producto
    SUM(pr.Pro_Precio * p.Ped_cantidad) AS total_ventas  -- Sumar el total de ventas de cada producto
FROM 
    pedidos p
INNER JOIN 
    productos pr ON p.Ped_id_producto = pr.idproductos  -- Relacionar pedidos con productos
GROUP BY 
    pr.Pro_Nombre  -- Agrupar por nombre de producto
ORDER BY 
    cantidad_ordenada DESC;  -- Ordenar de mayor a menor