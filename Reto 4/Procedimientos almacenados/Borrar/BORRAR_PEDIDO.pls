create or replace PROCEDURE borrar_pedido(
    p_pedido_id IN NUMBER
) AS
BEGIN
    DELETE FROM pedidos WHERE pedidos_id = p_pedido_id;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Pedido con ID ' || p_pedido_id || ' eliminado correctamente.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No se encontró el pedido con ID ' || p_pedido_id || '.');
    END IF;
END borrar_pedido;
