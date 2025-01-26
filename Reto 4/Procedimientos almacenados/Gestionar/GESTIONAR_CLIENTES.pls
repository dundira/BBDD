create or replace PROCEDURE gestionar_clientes(
    p_cliente_id IN NUMBER,
    p_nombre IN VARCHAR2 DEFAULT NULL,
    p_correo IN VARCHAR2 DEFAULT NULL
) AS
BEGIN
    -- Mostrar los datos actuales del cliente
    FOR r IN (
        SELECT *
        FROM clientes
        WHERE cliente_id = p_cliente_id
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Datos actuales:');
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.cliente_id || ' | Nombre: ' || r.nombre || ' | Correo: ' || r.correo);
    END LOOP;

    -- Actualizar los datos del cliente si se proporcionan nuevos valores
    UPDATE clientes
    SET nombre = NVL(p_nombre, nombre),
        correo = NVL(p_correo, correo)
    WHERE cliente_id = p_cliente_id;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Datos actualizados correctamente.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No se encontró el cliente con ID ' || p_cliente_id || '.');
    END IF;
END gestionar_clientes;
