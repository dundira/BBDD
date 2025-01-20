CREATE SCHEMA IF NOT EXISTS `miprimerabd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ; -- Creacion de base de datos
USE `miprimerabd` ; -- Seleccion de BD para su uso

CREATE TABLE IF NOT EXISTS `miprimerabd`.`categoria_producto` (
  `idCategoria_producto` INT NOT NULL AUTO_INCREMENT,
  `Categor_Prod` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCategoria_producto`)); -- Creacion de la tabla categoria_producto con sus columnas

CREATE TABLE IF NOT EXISTS `miprimerabd`.`clientes` (
  `idclientes` INT NOT NULL AUTO_INCREMENT,
  `Cli_nombre` VARCHAR(100) NOT NULL,
  `Cli_DNI` VARCHAR(9) NOT NULL,
  `Cli_Direccion` VARCHAR(150) NOT NULL,
  `Cli_Localidad` VARCHAR(45) NULL DEFAULT NULL,
  `Cli_Provincia` VARCHAR(45) NULL DEFAULT NULL,
  `Cli_Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idclientes`)); -- Creacion de la tabla clientes con sus columnas

CREATE UNIQUE INDEX `Cli_DNI_UNIQUE` ON `miprimerabd`.`clientes` (`Cli_DNI` ASC) VISIBLE; -- Creacion de indice en clientes relacionado al DNI para agilizar

CREATE UNIQUE INDEX `Cli_Email_UNIQUE` ON `miprimerabd`.`clientes` (`Cli_Email` ASC) VISIBLE; -- Creacion de indice en clientes relacionado al Email para agilizar

CREATE INDEX `idx_clientes_idclientes` ON `miprimerabd`.`clientes` (`idclientes` ASC) VISIBLE; -- Creacion de indice en clientes global

CREATE TABLE IF NOT EXISTS `miprimerabd`.`pedido_estado` (
  `idpedido_estado` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idpedido_estado`)); -- Creacion de la tabla pedido_estado con sus columnas

CREATE TABLE IF NOT EXISTS `miprimerabd`.`productos` (
  `idproductos` INT NOT NULL AUTO_INCREMENT,
  `Pro_Nombre` VARCHAR(100) NOT NULL,
  `Pro_Precio` DECIMAL(10,2) NULL DEFAULT '0.00',
  `Pro_Categor` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idproductos`),
  CONSTRAINT `Categor_Prod`
    FOREIGN KEY (`Pro_Categor`)
    REFERENCES `miprimerabd`.`categoria_producto` (`idCategoria_producto`)); -- Creacion de la tabla productos con sus columnas, asi como clave foranea en categoria_producto

CREATE INDEX `Categor_Prod_idx` ON `miprimerabd`.`productos` (`Pro_Categor` ASC) VISIBLE; -- Creacion de un indice por categoria

CREATE INDEX `idx_productos_idproductos` ON `miprimerabd`.`productos` (`idproductos` ASC) VISIBLE; -- Creacion de un indice de productos global

CREATE TABLE IF NOT EXISTS `miprimerabd`.`pedidos` (
  `idPedidos` INT NOT NULL AUTO_INCREMENT,
  `Ped_IDCliente` INT NULL DEFAULT NULL,
  `Ped_ID_Producto` INT NULL DEFAULT NULL,
  `Ped_Cantidad` INT NOT NULL,
  `Ped_Estado` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idPedidos`),
  CONSTRAINT `pedido_estado`
    FOREIGN KEY (`Ped_Estado`)
    REFERENCES `miprimerabd`.`pedido_estado` (`idpedido_estado`),
  CONSTRAINT `pedido_ID_Clientes`
    FOREIGN KEY (`Ped_IDCliente`)
    REFERENCES `miprimerabd`.`clientes` (`idclientes`),
  CONSTRAINT `pedido_ID_Producto`
    FOREIGN KEY (`Ped_ID_Producto`)
    REFERENCES `miprimerabd`.`productos` (`idproductos`)); -- Creacion de la tabla pedidos con sus columnas, asi como sus claves foraneas necesarias 

CREATE INDEX `pedido_usuario_id_idx` ON `miprimerabd`.`pedidos` (`Ped_IDCliente` ASC) VISIBLE;

CREATE INDEX `pedido_estado_idx` ON `miprimerabd`.`pedidos` (`Ped_Estado` ASC) VISIBLE;

CREATE INDEX `pedido_ID_Producto_idx` ON `miprimerabd`.`pedidos` (`Ped_ID_Producto` ASC) VISIBLE;

CREATE INDEX `idx_pedidos_idPedidos` ON `miprimerabd`.`pedidos` (`idPedidos` ASC) VISIBLE;



USE `miprimerabd` ;