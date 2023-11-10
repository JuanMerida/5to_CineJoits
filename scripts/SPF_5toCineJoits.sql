-- 1)Se pide hacer los SP para dar de alta todas las entidades (menos Entrada y Cliente) con el prefijo ‘alta’.

DELIMITER $$
USE 5to_CineJoits $$
SELECT 'Creando Stored Procedure' AS 'Estado' $$
DROP PROCEDURE
IF EXISTS altaGenero $$
CREATE PROCEDURE altaGenero(OUT unIdGenero TINYINT, unNGenero VARCHAR(45))
BEGIN
INSERT INTO genero(Ngenero)
VALUES (unNGenero);
SET unIdGenero = LAST_INSERT_ID();
END $$
DELIMITER $$
DROP PROCEDURE
IF EXISTS altaPeliculas $$
CREATE PROCEDURE altaPeliculas(OUT unIdPelicula SMALLINT, unNombre VARCHAR(45), unIdGenero TINYINT, unFDL DATE)
BEGIN
INSERT INTO peliculas(nombre, idGenero, fechaDeLanzamiento)
VALUES(unNombre, unIdGenero, unFDL);
SET unIdPelicula = LAST_INSERT_ID;
END $$
DELIMITER $$
DROP PROCEDURE
IF EXISTS altaSala $$
CREATE PROCEDURE altasala(OUT unIdSala TINYINT, unPiso TINYINT, unaCapacidad smallint)
BEGIN
	INSERT into salas(piso,capacidad)
	VALUES(unpiso,unacapacidad );
	SET unIdSala = LAST_INSERT_ID();
END $$
DELIMITER $$
DROP PROCEDURE IF EXISTS altaProyecciones $$
CREATE PROCEDURE altaProyecciones (OUT unIdProyeccion INT, unaFechaHora DATETIME, unIdPelicula SMALLINT, unIdSala TINYINT)
BEGIN
INSERT INTO proyecciones (fechaHora, idPelicula, idSala)
VALUES (unaFechaHora, unIdPelicula, unIdSala);
SET unIdProyeccion = LAST_INSERT_ID();
END $$
-- 2)Se pide hacer el SP ‘registrarCliente’ que reciba los datos del cliente. Es importante guardar encriptada la contraseña del cliente usando SHA256.
DELIMITER $$
DROP PROCEDURE
IF EXISTS registrarCliente $$
CREATE PROCEDURE registrarCliente(unIdCliente SMALLINT, unNombre VARCHAR(45), unApellido VARCHAR(45), unEmail VARCHAR(45) )
BEGIN
INSERT INTO clientes(IdCliente, nombre, apellido, email, contrasenia)
VALUES(unIdCliente, unNombre, unApellido, unEmail, SHA2(contrasenia, 256));
END $$
-- 3)Se pide hacer el SP ‘venderEntrada’ que reciba por parámetro el id de la función, valor e identificación del cliente. Pensar en cómo hacer para darle valores consecutivos desde 1 al número de entrada por función.
DELIMITER $$
DROP PROCEDURE
IF EXISTS venderEntrada $$
CREATE PROCEDURE venderEntrada(unIdCliente SMALLINT,unValorEntrada INT, unIdProyeccion int)
BEGIN
UPDATE Entradas
SET numeroEntrada = numeroEntrada + 1
WHERE idProyeccion = unIdProyeccion;
END $$
-- 4)Realizar el SP ‘top10’ que reciba por parámetro 2 fechas, el SP tiene que devolver identificador y nombre de la película y la cantidad de entradas vendidas para la misma entre las 2 fechas. Ordenar por cantidad de entradas de mayor a menor.
DELIMITER $$
DROP PROCEDURE
IF EXISTS top10 $$
CREATE PROCEDURE top10 ( in fechaInicio DATETIME, in FechaFin DATETIME)
BEGIN
SELECT p.idPelicula, p.nombre, e.vendidas
FROM Peliculas p
INNER JOIN Proyecciones pr ON pr.idPelicula = p.idPelicula
INNER JOIN Entradas e on e.idProyeccion = pr.idProyeccion
WHERE fechaHora BETWEEN fechaInicio and FechaFin
GROUP BY p.idPelicula
ORDER BY numeroEntradas DESC
Limit 10;
END $$
-- 5)Realizar el SF llamado ‘RecaudacionPara’ que reciba por parámetro un identificador de película y 2 fechas, la función tiene que retornar la recaudación de la película entre esas 2 fechas.
DELIMITER $$
DROP FUNCTION
IF EXISTS RecaudacionPara $$
CREATE FUNCTION RecaudacionPara(unIdPelicula SMALLINT, fechaInicio DATETIME, FechaFin DATETIME)
RETURNs FlOAT reads SQL DATA
BEGIN
	DECLARE Recaudado FLOAT ;
	SELECT SUM(e.valorEntrada) into Recaudado	
FROM Entradas e
INNER JOIN Proyecciones p ON e.idProyeccion = p.idProyeccion
WHERE p.idPelicula = unIdPelicula
AND p.fechaHora BETWEEN fecha_inicio AND fecha_fin;
RETURN Recaudado;
END $$
