create or replace PROCEDURE borrar_producto(
    p_producto_id IN NUMBER
) AS
    v_pedidos_count NUMBER;
BEGIN
    -- Verificar si el producto tiene pedidos asociados
    SELECT COUNT(*)
    INTO v_pedidos_count
    FROM pedidos
    WHERE producto_id = p_producto_id;

    IF v_pedidos_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('El producto con ID ' || p_producto_id || ' tiene pedidos asociados. Elimine los pedidos antes de borrar este producto.');
    ELSE
        DELETE FROM productos WHERE producto_id = p_producto_id;

        IF SQL%ROWCOUNT > 0 THEN
            DBMS_OUTPUT.PUT_LINE('Producto con ID ' || p_producto_id || ' eliminado correctamente.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('No se encontró el producto con ID ' || p_producto_id || '.');
        END IF;
    END IF;
END borrar_producto;
