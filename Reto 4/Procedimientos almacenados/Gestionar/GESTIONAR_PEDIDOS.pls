create or replace PROCEDURE gestionar_pedidos(
    p_pedido_id IN NUMBER,
    p_cliente_id IN NUMBER DEFAULT NULL,
    p_producto_id IN NUMBER DEFAULT NULL,
    p_cantidad IN NUMBER DEFAULT NULL
) AS
BEGIN
    -- Mostrar los datos actuales del pedido
    FOR r IN (
        SELECT *
        FROM pedidos
        WHERE pedidos_id = p_pedido_id
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Datos actuales:');
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.pedidos_id || ' | Cliente ID: ' || r.cliente_id || ' | Producto ID: ' || r.producto_id || ' | Cantidad: ' || r.cantidad);
    END LOOP;

    -- Actualizar los datos del pedido si se proporcionan nuevos valores
    UPDATE pedidos
    SET cliente_id = NVL(p_cliente_id, cliente_id),
        producto_id = NVL(p_producto_id, producto_id),
        cantidad = NVL(p_cantidad, cantidad)
    WHERE pedidos_id = p_pedido_id;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Datos actualizados correctamente.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No se encontró el pedido con ID ' || p_pedido_id || '.');
    END IF;
END gestionar_pedidos;
