create or replace PROCEDURE insertar_producto(
    p_nombre IN VARCHAR2,
    p_descripcion IN VARCHAR2,
    p_precio IN NUMBER
) AS
BEGIN
    INSERT INTO productos (nombre, descripcion, precio)
    VALUES (p_nombre, p_descripcion, p_precio);
    COMMIT;
END insertar_producto;
