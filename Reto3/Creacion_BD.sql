-- Creación de la base de datos
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'miprimerabd')
BEGIN
    CREATE DATABASE miprimerabd;
END;
GO

-- Selección de la base de datos
USE miprimerabd;
GO

-- Creación de la tabla categoria_producto
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'categoria_producto') AND type = 'U')
BEGIN
    CREATE TABLE categoria_producto (
        idCategoria_producto INT IDENTITY(1,1) NOT NULL,
        Categor_Prod NVARCHAR(45) NULL,
        PRIMARY KEY (idCategoria_producto)
    );
END;
GO

-- Creación de la tabla clientes
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'clientes') AND type = 'U')
BEGIN
    CREATE TABLE clientes (
        idclientes INT IDENTITY(1,1) NOT NULL,
        Cli_nombre NVARCHAR(100) NOT NULL,
        Cli_DNI NVARCHAR(9) NOT NULL UNIQUE,
        Cli_Direccion NVARCHAR(150) NOT NULL,
        Cli_Localidad NVARCHAR(45) NULL,
        Cli_Provincia NVARCHAR(45) NULL,
        Cli_Email NVARCHAR(45) NOT NULL UNIQUE,
        PRIMARY KEY (idclientes)
    );
END;
GO

-- Creación de la tabla pedido_estado
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'pedido_estado') AND type = 'U')
BEGIN
    CREATE TABLE pedido_estado (
        idpedido_estado INT IDENTITY(1,1) NOT NULL,
        Nombre NVARCHAR(45) NULL,
        PRIMARY KEY (idpedido_estado)
    );
END;
GO

-- Creación de la tabla productos
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'productos') AND type = 'U')
BEGIN
    CREATE TABLE productos (
        idproductos INT IDENTITY(1,1) NOT NULL,
        Pro_Nombre NVARCHAR(100) NOT NULL,
        Pro_Precio DECIMAL(10,2) NULL DEFAULT 0.00,
        Pro_Categor INT NULL,
        PRIMARY KEY (idproductos),
        CONSTRAINT FK_Categoria_Producto FOREIGN KEY (Pro_Categor)
        REFERENCES categoria_producto (idCategoria_producto)
    );
END;
GO

-- Creación de la tabla pedidos
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'pedidos') AND type = 'U')
BEGIN
    CREATE TABLE pedidos (
        idPedidos INT IDENTITY(1,1) NOT NULL,
        Ped_IDCliente INT NULL,
        Ped_ID_Producto INT NULL,
        Ped_Cantidad INT NOT NULL,
        Ped_Estado INT NULL,
        PRIMARY KEY (idPedidos),
        CONSTRAINT FK_Pedido_Estado FOREIGN KEY (Ped_Estado)
        REFERENCES pedido_estado (idpedido_estado),
        CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (Ped_IDCliente)
        REFERENCES clientes (idclientes),
        CONSTRAINT FK_Pedido_Producto FOREIGN KEY (Ped_ID_Producto)
        REFERENCES productos (idproductos)
    );
END;
GO

-- Creación de índices
CREATE INDEX IDX_Clientes_idclientes ON clientes (idclientes);
CREATE INDEX IDX_Productos_Pro_Categor ON productos (Pro_Categor);
CREATE INDEX IDX_Productos_idproductos ON productos (idproductos);
CREATE INDEX IDX_Pedidos_Ped_IDCliente ON pedidos (Ped_IDCliente);
CREATE INDEX IDX_Pedidos_Ped_Estado ON pedidos (Ped_Estado);
CREATE INDEX IDX_Pedidos_Ped_ID_Producto ON pedidos (Ped_ID_Producto);
CREATE INDEX IDX_Pedidos_idPedidos ON pedidos (idPedidos);
GO