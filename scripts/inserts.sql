DELIMITER ;
USE 5to_CineJoits;
SELECT 'Creando inserts' AS 'Estado';
INSERT into Genero(Ngenero)
    VALUES("Accion"),
        ("Comedia");

INSERT INTO Pelicula(nombre, idGenero, fechaDeLanzamiento)
    VALUES("Five Nights at Freddy's", 1, "2023/10/27"),
        ("Jhon Wick", 2,"2019/09/12");

INSERT INTO Sala(piso, capacidad)
    VALUES(2,30),
    (1,10);


INSERT INTO Proyeccion(fechaHora, idPelicula, idSala)
    VALUES('2023/11/27 15:30:00', 1, 1),
        ('2023/11/27 16:30:00',1,2)