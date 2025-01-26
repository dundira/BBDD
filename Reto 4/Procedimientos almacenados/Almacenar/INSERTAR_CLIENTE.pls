create or replace PROCEDURE insertar_cliente(
    p_nombre IN VARCHAR2,
    p_correo IN VARCHAR2
) AS
BEGIN
    INSERT INTO clientes (nombre, correo)
    VALUES (p_nombre, p_correo);
    COMMIT;
END insertar_cliente;
