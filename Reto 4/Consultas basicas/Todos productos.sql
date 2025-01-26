SELECT cliente_id, SUM(cantidad) AS total_cantidad
FROM pedidos
GROUP BY cliente_id;

