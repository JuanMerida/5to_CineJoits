-- 1)Realizar un trigger que verifique que al momento de insertar una entrada, no sobrepase la cantidad de entradas vendidas para la capacidad de la sala correspondiente a la proyección, en ese caso no se debe permitir la operación y se tiene que mostrar la leyenda “Sala Llena”.
DELIMITER $$
USE 5to_CineJoits $$
DROP TRIGGER IF EXISTS verificar $$
CREATE TRIGGER verificar AFTER INSERT ON Entradas
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
SELECT p.idPelicula, p.nombre, e.NumEntrada
FROM Peliculas p
INNER JOIN Proyecciones pr ON pr.idPelicula = p.idPelicula
INNER JOIN Entradas e on e.idProyeccion = pr.idProyeccion
WHERE fechaHora BETWEEN fechaInicio and FechaFin
GROUP BY p.idPelicula
ORDER BY numeroEntradas DESC
Limit 10;
END $$
