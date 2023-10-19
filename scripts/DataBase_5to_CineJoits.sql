DROP DATABASE IF EXISTS 5to_CineJoits;
CREATE DATABASE 5to_CineJoits;
USE 5to_CineJoits;
CREATE TABLE
Genero (
idGenero TINYINT NOT NULL,
genero VARCHAR(45) NOT NULL,
PRIMARY KEY (idGenero),
CONSTRAINT UQ_Genero_genero UNIQUE (genero)
);
CREATE TABLE
Peliculas (
idPelicula SMALLINT NOT NULL,
nombre VARCHAR(45) NOT NULL,
idGenero TINYINT NOT NULL,
fechaDeLanzamiento DATE NOT NULL,
PRIMARY KEY (idPelicula),
CONSTRAINT FK_Peliculas_Genero FOREIGN KEY (idGenero) REFERENCES Genero (idGenero),
CONSTRAINT UQ_Peliculas_nombre UNIQUE (nombre)
);
CREATE TABLE
Salas (
idSala TINYINT NOT NULL,
piso TINYINT NOT NULL,
capacidad SMALLINT NOT NULL,
PRIMARY KEY(idSala)
);
CREATE TABLE
Proyecciones (
idProyeccion INT NOT NULL,
fechaHora DATETIME NOT NULL,
idPelicula SMALLINT NOT NULL,
idSala TINYINT NOT NULL,
PRIMARY KEY (idProyeccion),
CONSTRAINT FK_Proyecciones_Salas FOREIGN KEY (idSala) REFERENCES Salas (idSala),
CONSTRAINT FK_Proyecciones_Peliculas FOREIGN KEY (idPelicula) REFERENCES Peliculas (idPelicula)
);
CREATE TABLE
Clientes (
IdCliente SMALLINT NOT NULL,
nombre VARCHAR(45) NOT NULL,
apellido VARCHAR(45) NOT NULL,
email VARCHAR(45) NOT NULL,
contraseña VARCHAR(45) NOT NULL,
PRIMARY KEY (idCliente),
CONSTRAINT UQ_Clientes_email UNIQUE (email)
);
CREATE TABLE
Entradas (
numeroEntrada INT NOT NULL,
vendida SMALLINT NOT NULL,
idCliente SMALLINT NOT NULL,
valorEntrada INT NOT NULL,
idProyeccion INT NOT NULL,
PRIMARY KEY (numeroEntrada),
CONSTRAINT FK_Entradas_Clientes FOREIGN KEY (IdCliente) REFERENCES Clientes (idCliente),
CONSTRAINT FK_Entradas_Proyecciones FOREIGN KEY (idProyeccion) REFERENCES Proyecciones (idProyeccion)
);
