SELECT 
    c.cliente_id,
    c.nombre AS cliente,
    SUM(p.cantidad) AS total_comprado
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id
GROUP BY c.cliente_id, c.nombre
ORDER BY total_comprado DESC;
