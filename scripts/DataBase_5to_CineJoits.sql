DROP DATABASE IF EXISTS 5to_CineJoits;
CREATE DATABASE 5to_CineJoits;
USE 5to_CineJoits;
SELECT 'Creando BD' AS 'Estado';
CREATE TABLE
Genero(
idGenero TINYINT NOT NULL auto_increment,
Ngenero VARCHAR(45) NOT NULL,
PRIMARY KEY (idGenero),
CONSTRAINT UQ_Genero_genero UNIQUE (Ngenero)
);
CREATE TABLE
Pelicula (
idPelicula SMALLINT NOT NULL auto_increment,
nombre VARCHAR(45) NOT NULL,
idGenero TINYINT NOT NULL,
fechaDeLanzamiento DATE NOT NULL,
PRIMARY KEY (idPelicula),
CONSTRAINT FK_Peliculas_Genero FOREIGN KEY (idGenero) REFERENCES Genero (idGenero),
CONSTRAINT UQ_Peliculas_nombre UNIQUE (nombre)
);
CREATE TABLE
Sala (
idSala TINYINT NOT NULL auto_increment,
piso TINYINT NOT NULL,
capacidad SMALLINT NOT NULL,
PRIMARY KEY(idSala)
);
CREATE TABLE
Proyeccion (
idProyeccion INT NOT NULL auto_increment,
fechaHora DATETIME NOT NULL,
idPelicula SMALLINT NOT NULL,
idSala TINYINT NOT NULL,
PRIMARY KEY (idProyeccion),
CONSTRAINT FK_Proyecciones_Salas FOREIGN KEY (idSala) REFERENCES Sala (idSala),
CONSTRAINT FK_Proyecciones_Peliculas FOREIGN KEY (idPelicula) REFERENCES Pelicula (idPelicula)
);
CREATE TABLE
Cliente (
IdCliente SMALLINT NOT NULL,
Nombre VARCHAR(45) NOT NULL,
Apellido VARCHAR(45) NOT NULL,
Email VARCHAR(45) NOT NULL,
Contraseña VARCHAR(45) NOT NULL,
PRIMARY KEY (idCliente),
CONSTRAINT UQ_Clientes_email UNIQUE (email)
);
CREATE TABLE
Entrada (
NumEntrada INT NOT NULL,
IdCliente SMALLINT NOT NULL,
ValorEntrada INT NOT NULL,
IdProyeccion INT NOT NULL,
PRIMARY KEY (NumEntrada),
CONSTRAINT FK_Entradas_Clientes FOREIGN KEY (IdCliente) REFERENCES Cliente (IdCliente),
CONSTRAINT FK_Entradas_Proyecciones FOREIGN KEY (IdProyeccion) REFERENCES Proyeccion (IdProyeccion)
);