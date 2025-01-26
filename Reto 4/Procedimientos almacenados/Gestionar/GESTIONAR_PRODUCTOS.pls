create or replace PROCEDURE gestionar_productos(
    p_producto_id IN NUMBER,
    p_nombre IN VARCHAR2 DEFAULT NULL,
    p_descripcion IN VARCHAR2 DEFAULT NULL,
    p_precio IN NUMBER DEFAULT NULL
) AS
BEGIN
    -- Mostrar los datos actuales del producto
    FOR r IN (
        SELECT *
        FROM productos
        WHERE producto_id = p_producto_id
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Datos actuales:');
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.producto_id || ' | Nombre: ' || r.nombre || ' | Descripción: ' || r.descripcion || ' | Precio: ' || r.precio);
    END LOOP;

    -- Actualizar los datos del producto si se proporcionan nuevos valores
    UPDATE productos
    SET nombre = NVL(p_nombre, nombre),
        descripcion = NVL(p_descripcion, descripcion),
        precio = NVL(p_precio, precio)
    WHERE producto_id = p_producto_id;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Datos actualizados correctamente.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No se encontró el producto con ID ' || p_producto_id || '.');
    END IF;
END gestionar_productos;
