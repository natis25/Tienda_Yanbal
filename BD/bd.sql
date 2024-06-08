-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-06-08 02:17:04.103

-- tables
-- Table: Categoria
CREATE TABLE Categoria (
    cCat int  NOT NULL,
    Categoria varchar(100)  NOT NULL,
    CONSTRAINT Categoria_pk PRIMARY KEY (cCat)
);

-- Table: Consultora
CREATE TABLE Consultora (
    cConsultoria int  NOT NULL,
    Nombre char(100)  NOT NULL,
    Telefono int  NOT NULL,
    CONSTRAINT Consultora_pk PRIMARY KEY (cConsultoria)
);

-- Table: Producto
CREATE TABLE Producto (
    cProducto int  NOT NULL,
    Nombre char(100)  NOT NULL,
    Stock int  NOT NULL,
    Precio decimal(10,2)  NOT NULL,
    Descripcion varchar(100)  NOT NULL,
    cCat int  NOT NULL,
    CONSTRAINT Producto_pk PRIMARY KEY (cProducto)
);

-- Table: ProductoVenta
CREATE TABLE ProductoVenta (
    cPV int  NOT NULL,
    Cantidad int  NOT NULL,
    cProducto int  NOT NULL,
    cVenta int  NOT NULL,
    CONSTRAINT ProductoVenta_pk PRIMARY KEY (cPV)
);

-- Table: Usuario
CREATE TABLE Usuario (
    cUsuario int  NOT NULL,
    Nombre char(100)  NOT NULL,
    Contrasenia varchar(100)  NOT NULL,
    CONSTRAINT Usuario_pk PRIMARY KEY (cUsuario)
);

-- Table: Venta
CREATE TABLE Venta (
    cVenta int  NOT NULL,
    Fecha date  NOT NULL,
    Total decimal(10,2)  NOT NULL,
    cConsultoria int  NOT NULL,
    cUsuario int  NOT NULL,
    CONSTRAINT Venta_pk PRIMARY KEY (cVenta)
);

-- foreign keys
-- Reference: ProductoVenta_Producto (table: ProductoVenta)
ALTER TABLE ProductoVenta ADD CONSTRAINT ProductoVenta_Producto FOREIGN KEY ProductoVenta_Producto (cProducto)
    REFERENCES Producto (cProducto);

-- Reference: ProductoVenta_Venta (table: ProductoVenta)
ALTER TABLE ProductoVenta ADD CONSTRAINT ProductoVenta_Venta FOREIGN KEY ProductoVenta_Venta (cVenta)
    REFERENCES Venta (cVenta);

-- Reference: Producto_TipoProducto (table: Producto)
ALTER TABLE Producto ADD CONSTRAINT Producto_TipoProducto FOREIGN KEY Producto_TipoProducto (cCat)
    REFERENCES Categoria (cCat);

-- Reference: Venta_Consultora (table: Venta)
ALTER TABLE Venta ADD CONSTRAINT Venta_Consultora FOREIGN KEY Venta_Consultora (cConsultoria)
    REFERENCES Consultora (cConsultoria);

-- Reference: Venta_Usuario (table: Venta)
ALTER TABLE Venta ADD CONSTRAINT Venta_Usuario FOREIGN KEY Venta_Usuario (cUsuario)
    REFERENCES Usuario (cUsuario);


