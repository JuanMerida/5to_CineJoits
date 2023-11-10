-- 1)Realizar un trigger que verifique que al momento de insertar una entrada, no sobrepase la cantidad de entradas vendidas para la capacidad de la sala correspondiente a la proyección, en ese caso no se debe permitir la operación y se tiene que mostrar la leyenda “Sala Llena”.
DELIMITER $$
USE 5to_CineJoits $$
SELECT 'Creando Triggers' AS 'Estado' $$
-- 1)Realizar un trigger que verifique que al momento de insertar una entrada, no sobrepase la cantidad de entradas vendidas para la capacidad de la sala correspondiente a la proyección, en ese caso no se debe permitir la operación y se tiene que mostrar la leyenda “Sala Llena”.


DELIMITER $$
DROP TRIGGER IF EXISTS verificar $$
CREATE TRIGGER verificar AFTER INSERT ON Entrada
FOR EACH ROW
BEGIN

IF(EXISTS (SELECT *
            FROM Sala
            WHERE idSala = idSala
            AND vendida = capacidad )) THEN
            SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Sala Llena';
END IF;
END $$
-- source inty2)Realizar un trigger para que cada vez que se da de alta una película nueva, se crea una proyección por cada sala y para la fecha y hora de creación.


DELIMITER $$
DROP TRIGGER IF EXISTS afInsPeliculas $$
CREATE TRIGGER afInsPeliculas AFTER INSERT ON Pelicula
FOR EACH ROW
BEGIN
	INSERT INTO Proyecciones (idSala, fechaHora, idPelicula)
		SELECT idSala, now(), new.idPelicula
		From Sala s;
END $$


