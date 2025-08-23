use laboratorio;

-- Creamos la tabla Marcas, que almacena las diferentes marcas de productos
CREATE TABLE Marcas (
    idMarca INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Productos (
    idProducto INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Marca INT,
    Categoria VARCHAR(50),
    Presentacion VARCHAR(50),
    Stock INT,
    Disponible ENUM('SI', 'NO'),
    FOREIGN KEY (Marca) REFERENCES Marcas(idMarca)
);

-- Insertamos registros de ejemplo en la tabla Marcas
INSERT INTO Marcas (idMarca, Nombre) VALUES
(1, 'Apple'),
(2, 'Samsung'),
(3, 'Huawei'),
(4, 'LG'),
(5, 'Motorola'),
(6, 'Google'),
(7, 'HP'),
(8, 'Epson'),
(9, 'Kodak');

-- Insertamos registros de ejemplo en la tabla Productos
INSERT INTO Productos (idProducto, Nombre, Precio, Marca, Categoria, Presentacion, Stock, Disponible) VALUES
(1, 'iPhone 6', 499.99, 1, 'Smartphone', '16GB', 500, 'SI'),
(2, 'iPad Pro', 599.99, 1, 'Smartphone', '128GB', 300, 'SI'),
(3, 'Nexus 7', 299.99, 4, 'Smartphone', '32GB', 250, 'NO'),
(4, 'Galaxy S7', 459.99, 2, 'Smartphone', '64GB', 200, 'SI'),
(5, 'Impresora T23', 489.99, 8, 'Impresoras', 'Color', 180, 'NO'),
(6, 'Impresora T33', 399.00, 8, 'Impresoras', 'Color', 200, 'NO'),
(7, 'Lavarropa 7000', 1679.00, 4, 'Lavarropas', 'Automático', 100, 'SI'),
(8, 'Camara Digital 760', 649.00, 9, 'Fotografía', 'Sin detalle', 150, 'NO'),
(9, 'Notebook CQ40-300', 2999.00, 7, 'Notebooks', 'Intel Core i3', 100, 'SI');
