NOTAS EN LAS INSERCIONES DE DATOS:

	- Se utiliza el comando COMMIT para asegurar que los datos se guardan permanentemente


NOTAS EN LAS BUSQUEDAS DE DATOS

	- Se pueden dejar los comandos NULL para no buscar por esos campos
	- Se utilizan clausulas LIKE para buscar coincidencias dentro de los campos, sin necesidad de ser coincidencias completas.
	- Utilizamos el comando DBMS_OUTPUT.PUT_LINE para que los resultados aparezcan en la consola


NOTAS EN LA MODIFICACION DE DATOS

	- Se usan clausulas NVL para mantener los valores actuales en caso de no proporcionarse nuevos
	- Idem uso de DBMS_OUTPUT.PUT_LINE


NOTAS EN EL BORRADO DE DATOS

	- Existe una verificación previa en los clientes y productos por si tienen pedidos asociados, asegurando que no se rompa la integridad referencial.
	- Informa al usuario en el caso de que el cliente o el producto tengan dependencias, asi como si no encuentra el registro a borrar.