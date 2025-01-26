create or replace PROCEDURE buscar_productos(
    p_producto_id IN NUMBER DEFAULT NULL,
    p_nombre IN VARCHAR2 DEFAULT NULL,
    p_descripcion IN VARCHAR2 DEFAULT NULL,
    p_precio_min IN NUMBER DEFAULT NULL,
    p_precio_max IN NUMBER DEFAULT NULL
) AS
BEGIN
    FOR r IN (
        SELECT *
        FROM productos
        WHERE (p_producto_id IS NULL OR producto_id = p_producto_id)
          AND (p_nombre IS NULL OR LOWER(nombre) LIKE '%' || LOWER(p_nombre) || '%')
          AND (p_descripcion IS NULL OR LOWER(descripcion) LIKE '%' || LOWER(p_descripcion) || '%')
          AND (p_precio_min IS NULL OR precio >= p_precio_min)
          AND (p_precio_max IS NULL OR precio <= p_precio_max)
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.producto_id || ' | Nombre: ' || r.nombre || ' | Descripción: ' || r.descripcion || ' | Precio: ' || r.precio);
    END LOOP;
END buscar_productos;
