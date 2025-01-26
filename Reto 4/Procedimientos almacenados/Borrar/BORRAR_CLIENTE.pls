create or replace PROCEDURE borrar_cliente(
    p_cliente_id IN NUMBER
) AS
    v_pedidos_count NUMBER;
BEGIN
    -- Verificar si el cliente tiene pedidos asociados
    SELECT COUNT(*)
    INTO v_pedidos_count
    FROM pedidos
    WHERE cliente_id = p_cliente_id;

    IF v_pedidos_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('El cliente con ID ' || p_cliente_id || ' tiene pedidos asociados. Elimine los pedidos antes de borrar este cliente.');
    ELSE
        DELETE FROM clientes WHERE cliente_id = p_cliente_id;

        IF SQL%ROWCOUNT > 0 THEN
            DBMS_OUTPUT.PUT_LINE('Cliente con ID ' || p_cliente_id || ' eliminado correctamente.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('No se encontró el cliente con ID ' || p_cliente_id || '.');
        END IF;
    END IF;
END borrar_cliente;
