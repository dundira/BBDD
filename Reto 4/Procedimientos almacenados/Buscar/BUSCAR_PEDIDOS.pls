create or replace PROCEDURE buscar_pedidos(
    p_pedido_id IN NUMBER DEFAULT NULL,
    p_cliente_id IN NUMBER DEFAULT NULL,
    p_producto_id IN NUMBER DEFAULT NULL,
    p_cantidad_min IN NUMBER DEFAULT NULL,
    p_cantidad_max IN NUMBER DEFAULT NULL
) AS
BEGIN
    FOR r IN (
        SELECT *
        FROM pedidos
        WHERE (p_pedido_id IS NULL OR pedidos_id = p_pedido_id)
          AND (p_cliente_id IS NULL OR cliente_id = p_cliente_id)
          AND (p_producto_id IS NULL OR producto_id = p_producto_id)
          AND (p_cantidad_min IS NULL OR cantidad >= p_cantidad_min)
          AND (p_cantidad_max IS NULL OR cantidad <= p_cantidad_max)
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.pedidos_id || ' | Cliente ID: ' || r.cliente_id || ' | Producto ID: ' || r.producto_id || ' | Cantidad: ' || r.cantidad);
    END LOOP;
END buscar_pedidos;
