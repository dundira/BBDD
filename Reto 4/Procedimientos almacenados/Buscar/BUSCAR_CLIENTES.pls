create or replace PROCEDURE buscar_clientes(
    p_cliente_id IN NUMBER DEFAULT NULL,
    p_nombre IN VARCHAR2 DEFAULT NULL,
    p_correo IN VARCHAR2 DEFAULT NULL
) AS
BEGIN
    FOR r IN (
        SELECT *
        FROM clientes
        WHERE (p_cliente_id IS NULL OR cliente_id = p_cliente_id)
          AND (p_nombre IS NULL OR LOWER(nombre) LIKE '%' || LOWER(p_nombre) || '%')
          AND (p_correo IS NULL OR LOWER(correo) LIKE '%' || LOWER(p_correo) || '%')
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.cliente_id || ' | Nombre: ' || r.nombre || ' | Correo: ' || r.correo);
    END LOOP;
END buscar_clientes;
