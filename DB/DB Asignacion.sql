CREATE DATABASE Asignacion
USE Asignacion

CREATE TABLE Grupo(
	idGrupo INT NOT NULL AUTO_INCREMENT,
    nombreGrupo VARCHAR (50) NOT NULL,
    PRIMARY KEY (idGrupo)
);

CREATE TABLE Curso(
	idCurso INT NOT NULL AUTO_INCREMENT,
    nombreCurso VARCHAR (50) NOT NULL,
    PRIMARY KEY (idCurso)
);

CREATE TABLE Detalle(
	idDetalle INT NOT NULL AUTO_INCREMENT,
	idGrupo INT NOT NULL,
    idCurso INT NOT NULL,
	PRIMARY KEY (idDetalle),
	FOREIGN KEY (idGrupo) REFERENCES Grupo(idGrupo),
    FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
);




/*VERIFICAR SI EXISTE, SI NO EXISTE, LO AGREGA*/
INSERT INTO Grupo(nombreGrupo)
SELECT "EL NOMBRE DEL GRUPO"
FROM dual
WHERE NOT EXISTS(SELECT nombreGrupo FROM Grupo WHERE nombreGrupo = "nombre grupo" LIMIT 1)




/*AGREGAR*/
DELIMITER //
CREATE PROCEDURE SP_addGrupo(IN nombre_grupo VARCHAR (50))
	BEGIN
	INSERT INTO Grupo(nombreGrupo) VALUES (nombre_grupo);
	END
    /*CALL SP_addGrupo('IN6AM');
	SELECT * FROM Grupo;*/
    
    
DELIMITER //
CREATE PROCEDURE SP_addCurso(IN nombre_curso VARCHAR (50))
	BEGIN
	INSERT INTO Curso(nombreCurso) VALUES (nombre_curso);
	END
    /*CALL SP_addCurso('Taller');
	SELECT * FROM Curso;*/