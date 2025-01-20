DECLARE @ProductID INT;
DECLARE @ProductName VARCHAR(100);
DECLARE @ProductCount INT;

-- Cursor para recorrer los productos
DECLARE product_cursor CURSOR FOR
    SELECT idproductos, Pro_Nombre 
    FROM productos;

-- Abrir el cursor
OPEN product_cursor;

-- Obtener el primer producto
FETCH NEXT FROM product_cursor INTO @ProductID, @ProductName;

-- Bucle para contar cuántas veces se ha pedido cada producto
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Contamos cuántas veces se ha pedido el producto
    SELECT @ProductCount = COUNT(*) 
    FROM pedidos 
    WHERE Ped_ID_Producto = @ProductID;
    
    -- Imprimir el nombre del producto y cuántas veces se ha pedido
    PRINT 'Producto: ' + @ProductName + ', Cantidad Pedida: ' + CAST(@ProductCount AS VARCHAR);
    
    -- Obtener el siguiente producto
    FETCH NEXT FROM product_cursor INTO @ProductID, @ProductName;
END;

-- Cerrar y liberar el cursor
CLOSE product_cursor;
DEALLOCATE product_cursor;