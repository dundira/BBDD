create or replace PROCEDURE insertar_pedido(
    p_cliente_id IN NUMBER,
    p_producto_id IN NUMBER,
    p_cantidad IN NUMBER
) AS
BEGIN
    INSERT INTO pedidos (cliente_id, producto_id, cantidad)
    VALUES (p_cliente_id, p_producto_id, p_cantidad);
    COMMIT;
END insertar_pedido;
