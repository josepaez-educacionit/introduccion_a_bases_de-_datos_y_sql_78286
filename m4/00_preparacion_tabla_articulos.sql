use gestioncomercial;

CREATE TABLE `articulos` (
  `ArticuloID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(75) NOT NULL,
  `Precio` double unsigned NOT NULL,
  `Stock` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ArticuloID`),
  UNIQUE KEY `ArticuloID` (`ArticuloID`)
);

INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Yerba Mate Taragüí', 2688.72, 330);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Fideos Matarazzo', 951.83, 45);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Aceite Natura', 3094.65, 332);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Arroz Gallo Oro', 976.06, 424);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Galletitas Criollitas', 1907.77, 239);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Leche La Serenísima', 2745.71, 308);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Dulce de Leche San Ignacio', 1789.56, 192);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Gaseosa Coca Cola', 255.48, 282);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Agua Mineral Eco de los Andes', 2299.79, 445);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Cerveza Quilmes', 3319.73, 353);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Harina Pureza', 1884.1, 258);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Mermelada Arcor', 1917.03, 137);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Pan Lactal Fargo', 2073.4, 203);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Sal Dos Anclas', 3529.9, 395);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Azúcar Ledesma', 4932.78, 78);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Queso Cremoso Ilolay', 4649.04, 168);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Café La Virginia', 2259.85, 306);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Mate Cocido Taragüí', 749.28, 95);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Jabón Ala', 4553.15, 161);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Shampoo Sedal', 2269.11, 160);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Detergente Magistral', 433.99, 192);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Papel Higiénico Higienol', 1288.56, 155);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Toallitas Always', 4041.34, 499);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Cereal Nesquik', 2832.37, 375);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Helado Grido', 4990.09, 500);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Manteca Sancor', 4360.97, 406);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Crema La Serenísima', 1552.52, 444);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Soda Villa del Sur', 2362.48, 448);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Vinagre de Alcohol Menoyo', 3263.54, 94);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Salsa Fileto Knorr', 3668.47, 17);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Gaseosa Pepsi', 704.44, 365);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Galletitas Chocolinas', 1283.19, 231);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Té Green Hills', 4498.8, 417);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Yogur Ser', 2299.45, 165);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Desodorante Rexona', 4305.76, 253);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Lavandina Ayudín', 4333.21, 396);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Pastas La Salteña', 3950.51, 153);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Hamburguesas Paty', 1287.33, 246);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Pan Rallado Preferido', 2425.15, 417);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Galletas Traviata', 4185.91, 287);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Fernet Branca', 1031.27, 428);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Vino Malbec Trapiche', 4442.77, 493);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Puré de Tomate Arcor', 4745.65, 489);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Jugo Tang', 4348.01, 121);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Galletitas Oreo', 1081.0, 382);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Queso Rallado La Paulina', 1586.17, 486);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Arvejas Noel', 4479.72, 74);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Aceitunas Nucete', 222.5, 296);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Salsa Golf Fanacoa', 4525.07, 339);
INSERT INTO articulos (Nombre, Precio, Stock) VALUES ('Mostaza Savora', 3864.75, 293);