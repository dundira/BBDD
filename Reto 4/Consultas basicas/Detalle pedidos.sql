SELECT 
    p.pedidos_id,
    c.nombre AS cliente,
    prod.nombre AS producto,
    p.cantidad
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id
JOIN productos prod ON p.producto_id = prod.producto_id;
