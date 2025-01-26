SELECT 
    prod.nombre AS producto,
    SUM(p.cantidad) AS cantidad_total
FROM pedidos p
JOIN productos prod ON p.producto_id = prod.producto_id
GROUP BY prod.nombre;
