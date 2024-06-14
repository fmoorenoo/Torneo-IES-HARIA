DROP DATABASE IF EXISTS torneo_IESHaria;
CREATE DATABASE torneo_IESHaria;
USE torneo_IESHaria;

CREATE TABLE entrenador (
    codigo_entrenador INT PRIMARY KEY NOT NULL,
    nombre_entrenador VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    nacionalidad VARCHAR(50) NOT NULL
);

CREATE TABLE equipo (
  codigo_equipo INT PRIMARY KEY NOT NULL,
  nombre_equipo VARCHAR(50) UNIQUE NOT NULL,
  victorias INT NOT NULL,
  empates INT NOT NULL,
  derrotas INT DEFAULT NULL,
  goles_a_favor INT NOT NULL,
  goles_en_contra INT NOT NULL,
  fase_alcanzada VARCHAR(20) NOT NULL,
  curso VARCHAR(20) NOT NULL,
  codigo_entrenador INT NOT NULL,
  FOREIGN KEY (codigo_entrenador) REFERENCES entrenador (codigo_entrenador)
    ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE patrocinador (
  codigo_patrocinador INT NOT NULL,
  nombre_patrocinador VARCHAR(40) NOT NULL,
  codigo_equipo INT NOT NULL,
  FOREIGN KEY (codigo_equipo) REFERENCES equipo (codigo_equipo)
);

CREATE TABLE socio (
  codigo_socio INT NOT NULL,
  nombre_socio VARCHAR(40) NOT NULL,
  codigo_equipo INT NOT NULL,
  FOREIGN KEY (codigo_equipo) REFERENCES equipo (codigo_equipo)
);

CREATE TABLE goleador (
  codigo_goleador INT PRIMARY KEY NOT NULL,
  nombre_goleador VARCHAR(20) NOT NULL,
  goles INT NOT NULL,
  codigo_equipo INTEGER NOT NULL,
  FOREIGN KEY (codigo_equipo) REFERENCES equipo (codigo_equipo)
    ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE partido (
  codigo_partido INT PRIMARY KEY NOT NULL,
  fecha DATE NOT NULL,
  fase VARCHAR(20) NOT NULL,
  resultado VARCHAR(5) NOT NULL
);

CREATE TABLE partido_equipo (
  codigo_partido INT NOT NULL,
  codigo_equipo INT NOT NULL,
  PRIMARY KEY (codigo_partido, codigo_equipo),
  FOREIGN KEY (codigo_partido) REFERENCES partido (codigo_partido)
	ON DELETE RESTRICT ON UPDATE RESTRICT,
  FOREIGN KEY (codigo_equipo) REFERENCES equipo (codigo_equipo)
    ON DELETE RESTRICT ON UPDATE RESTRICT
);


##### TABLA ENTRENADOR #####
INSERT INTO entrenador (codigo_entrenador, nombre_entrenador, apellido1, apellido2, nacionalidad) VALUES 
(1, "Alejandro", "López", "Santos", "España"), 			(2, "Emilio", "Gómez", "Correa", "España"),
(3, "Diego", "Alcalde", "Agredano", "España"), 			(4, "Cristina", "Osuna", "Tavío", "España"), 	
(5, "Ana", "Hernández", "Betancort", "España"), 		(6, "Helena", "Peña", "Betancor", "España"), 	
(7, "Javier", "Sebastián", "Herrero", "España"), 		(8, "Xavi", "Hernández", "Creus", "España"), 	
(9, "Pep", "Guardiola", "Sala", "España"), 				(10, "José", "Mourinho", "Félix", "Portugal"), 	
(11, "Luis Enrique", "Martínez", "García", "España"), 	(12, "Jurgen", "Klopp", NULL, "Alemania"), 	
(13, "Carlo", "Ancelotti", NULL, "Italia"), 			(14, "Zinedine", "Zidane", NULL, "Francia"), 	
(15, "Diego Pablo", "Simeone", NULL, "Argentina"), 		(16, "Luis", "Aragonés", "Suárez", "España"), 
(17, "Antonio", "Montelongo", "Hernández", "España"), 	(18, "Lionel", "Sebastián", "Scaloni", "Argentina");


##### TABLA EQUIPO #####
INSERT INTO equipo (codigo_equipo, nombre_equipo, victorias, empates, derrotas, goles_a_favor, goles_en_contra, fase_alcanzada, curso, codigo_entrenador) VALUES 
(1, "Goofy", 1, 1, 2, 8, 13, "Fase de grupos", "1CFGS", 6), 			(2, "Los Galácticos", 3, 0, 3, 17, 19, "Semifinal", "PROFES", 4),
(3, "Los Pistolos", 6, 0, 0, 31, 11, "Final", "4A", 1), 				(4, "Cholismo", 4, 0, 3, 19, 8, "Final", "1BCT", 7),
(5, "Oreos", 3, 0, 1, 19, 7, "Cuartos", "CFGB", 2), 					(6, "Los Vikingos", 4, 0, 2, 14, 8, "Semifinal", "3B", 5),
(7, "Los Pechuguitas", 4, 0, 1, 15, 3, "Cuartos", "2A", 3), 			(8, "Mortadela", 4, 0, 1, 11, 6, "Cuartos", "1BHCS", 9),
(9, "Sebas FC", 3, 0, 2, 10, 11, "Cuartos", "2B", 8), 					(10, "Team Guiris", 2, 0, 2, 10, 7, "Fase de grupos", "1A", 13),
(11, "Sporting Coca Cola", 1, 0, 3, 5, 14, "Fase de grupos", "1C", 11), (12, "Águilas FC", 0, 0, 4, 0, 13, "Fase de grupos", "1B", 12),
(13, "Pomelos Seductores", 1, 0, 2, 2, 3, "Fase de grupos", "4B", 10), 	(14, "Achigüiches", 0, 0, 3, 1, 11, "Fase de grupos", "3A", 15),
(15, "Patata City", 1, 0, 2, 4, 13, "Fase de grupos", "1CFGM", 16), 	(16, "Los Máquinas", 0, 0, 3, 3, 12, "Fase de grupos", "DÍVER", 18),
(17, "Andytrynys", 1, 1, 2, 5, 9, "Fase de grupos", "2BACH", 14), 		(18, "Actimel", 1, 0, 3, 4, 10, "Fase de grupos", "2CFGM", 17);


##### TABLA SOCIO #####
INSERT INTO socio (codigo_socio, nombre_socio, codigo_equipo) VALUES
(1, 'Carlos Martínez', 1),
(2, 'Ana Gómez', 2),
(3, 'Luis Rodríguez', 3),
(4, 'María López', 4),
(5, 'José Fernández', 5),
(6, 'Lucía Sánchez', 6),
(7, 'Miguel Pérez', 7),
(8, 'Laura García', 8),
(9, 'Javier González', 9),
(10, 'Elena Díaz', 10),
(11, 'Pablo Torres', 11),
(12, 'Marta Ramírez', 12),
(13, 'Sergio Ruiz', 13),
(14, 'Carmen Morales', 14),
(15, 'David Jiménez', 15),
(16, 'Isabel Ortega', 16),
(17, 'Andrés Navarro', 17),
(18, 'Clara Castillo', 18);


##### TABLA PATROCINADOR #####
INSERT INTO patrocinador (codigo_patrocinador, nombre_patrocinador, codigo_equipo) VALUES
(1, 'Nike', 1),
(2, 'Adidas', 2),
(3, 'Puma', 3),
(4, 'Reebok', 4),
(5, 'Under Armour', 5),
(6, 'Coca-Cola', 6),
(7, 'Pepsi', 7),
(8, 'Red Bull', 8),
(9, 'Samsung', 9),
(10, 'Emirates', 10),
(11, 'Chevrolet', 11),
(12, 'Toyota', 12),
(13, 'Visa', 13),
(14, 'Mastercard', 14),
(15, 'Heineken', 15),
(16, 'Budweiser', 16),
(17, 'AIG', 17),
(18, 'Santander', 18);


##### TABLA GOLEADOR #####
INSERT INTO goleador (codigo_goleador, nombre_goleador, goles, codigo_equipo) VALUES 
# Goofy
(1, "Amaro", 5, 1), (2, "Fernando", 2, 1), (3, "Iriem", 1, 1),
# Los Pistolos
(4, "Jonás", 11, 3), (5, "Iriome", 10, 3), (6, "Aythami", 3, 3), (7, "Gael", 2, 3), (8, "Jaime", 2, 3), (9, "Jorge", 1, 3), (10, "Adexe", 1, 3), (11, "Yaudiel", 1, 3),
# Cholismo
(12, "Nicolás", 7, 4), (13, "Manuel", 4, 4), (14, "Carlos", 3, 4), (15, "Diego", 2, 4), (16, "Aarón", 2, 4), (17, "Yaimur", 1, 4),  
# Oreos
(18, "Andreas", 7, 5), (19, "Jorge", 5, 5), (20, "Camilo", 4, 5), (21, "Arian", 2, 5),
# Los Galácticos
(22, "Juan", 5, 2), (23, "Alberto", 4, 2), (24, "Juanma", 3, 2), (25, "Diego (MVP)", 3, 2), (26, "Mary", 1, 2),
# Los Pechuguitas
(27, "Pedro", 5, 7), (28, "Manuel", 3, 7), (29, "Yencey", 2, 7), (30, "Bruno", 1, 7), (31, "Gael", 1, 7),
# Los Vikingos
(32, "Yerimay", 4, 6), (33, "Gerardo", 4, 6), (34, "Josué", 3, 6), (35, "Rocco", 2, 6),
# Sebas FC
(36, "Óliver", 4, 9), (37, "Alejandro M.", 4, 9), (38, "Sebastián", 1, 9), (39, "Ezequiel", 1, 9),
# Team Guiris
(40, "Leo", 4, 10), (41, "Jacob", 3, 10), (42, "Carlos", 1, 10), (43, "Mahy", 2, 10),
# Andytrynys
(44, "Garoé", 3, 17), (45, "Ancor", 2, 17),
# Mortadela
(46, "Yanis", 3, 8), (47, "Angel", 2, 8), (48, "Pablo", 2, 8), (49, "Guayre", 1, 8),
# Los Máquinas
(50, "Joel", 2, 16), (51, "Acoydán", 1, 16),
# Sporting Coca Cola
(52, "Jerobe", 2, 11), (53, "Albano", 2, 11), (54, "León", 1, 11),
# Actimel
(55, "Airam", 2, 18), (56, "Gabriel", 2, 18),
# Achigüiches
(57, "Atchem", 1, 14),
# Pomelos Seductores
(58, "Pablo M.", 1, 13), (59, "Pablo R.", 1, 13),
# Patata City
(60, "Edu", 1, 15),
# Fabio
(61, "Fabio", 27, 1);


##### TABLA PARTIDO #####
INSERT INTO partido (codigo_partido, fecha, fase, resultado)
VALUES 
(1, '2024-01-22', 'Fase de grupos', '4-0'), (2, '2024-01-23', 'Fase de grupos', '0-8'),
(3, '2024-01-24', 'Fase de grupos', '0-3'), (4, '2024-01-25', 'Fase de grupos', '2-1'),
(5, '2024-01-26', 'Fase de grupos', '1-5'), (6, '2024-01-29', 'Fase de grupos', '1-2'),
(7, '2024-01-30', 'Fase de grupos', '1-3'), (8, '2024-01-31', 'Fase de grupos', '3-2'),
(9, '2024-02-01', 'Fase de grupos', '2-1'), (10, '2024-02-02', 'Fase de grupos', '0-3'),
(11, '2024-02-05', 'Fase de grupos', '1-3'), (12, '2024-02-06', 'Fase de grupos', '1-0'),
(13, '2024-02-07', 'Fase de grupos', '0-8'), (14, '2024-02-08', 'Fase de grupos', '2-7'),
(15, '2024-02-09', 'Fase de grupos', '2-1'), (16, '2024-02-19', 'Fase de grupos', '2-1'),
(17, '2024-02-20', 'Fase de grupos', '3-0'), (18, '2024-02-21', 'Fase de grupos', '7-1'),
(19, '2024-02-22', 'Fase de grupos', '1-2'), (20, '2024-02-23', 'Fase de grupos', '1-0'),
(21, '2024-02-26', 'Fase de grupos', '4-2'), (22, '2024-02-27', 'Fase de grupos', '0-4'),
(23, '2024-02-28', 'Fase de grupos', '1-4'), (24, '2024-02-29', 'Fase de grupos', '0-5'),
(25, '2024-03-01', 'Fase de grupos', '0-3'), (26, '2024-03-04', 'Fase de grupos', '1-0'),
(27, '2024-03-05', 'Fase de grupos', '0-3'), (28, '2024-03-06', 'Fase de grupos', '2-2'),
(29, '2024-03-07', 'Fase de grupos', '0-2'), (30, '2024-03-08', 'Fase de grupos', '0-3'),
(31, '2024-03-12', 'Fase de grupos', '7-0'), (32, '2024-03-13', 'Fase de grupos', '1-2'),
-- Cuartos
(33, '2024-04-01', 'Cuartos', '1-2'), (34, '2024-04-02', 'Cuartos', '4-2'),
(35, '2024-04-03', 'Cuartos', '9-2'), (36, '2024-04-04', 'Cuartos', '2-1'),
-- Semifinal
(37, '2024-04-08', 'Semifinal', '8-4'), (38, '2024-04-09', 'Semifinal', '2-1'),
-- Final
(39, '2024-04-18', 'Final', '2-2');


##### TABLA PARTIDO_EQUIPO #####
INSERT INTO partido_equipo (codigo_partido, codigo_equipo) VALUES 
-- Fase de grupos
(1, 10), (1, 12),      (2, 11), (2, 7),  	 (3, 14), (3, 6),      (4, 3), (4, 13),      (5, 15), (5, 5),      (6, 16), (6, 2),
(7, 10), (7, 9), 	   (8, 8), (8, 1), 	  	 (9, 18), (9, 4),      (10, 12), (10, 11),   (11, 6), (11, 3),     (12, 13), (12, 14),
(13, 15), (13, 2),     (14, 16), (14, 5),    (15, 17), (15, 18),   (16, 8), (16, 4),     (17, 9), (17, 12),    (18, 3), (18, 14),
(19, 10), (19, 7),     (20, 6), (20, 13),    (21, 10), (21, 11),   (22, 17), (22, 4),    (23, 18), (23, 1),    (24, 2), (24, 5),
(25, 16), (25, 15),    (26, 7), (26, 9),     (27, 18), (27, 8),    (28, 17), (28, 1),    (29, 11), (29, 9),    (30, 12), (30, 7),
(31, 4), (31, 1),      (32, 17), (32, 8),
-- Cuartos
(33, 7), (33, 4), (34, 6), (34, 5),
(35, 3), (35, 9), (36, 2), (36, 8),
-- Semifinal
(37, 3), (37, 2), (38, 4), (38, 6),
-- Final
(39, 4), (39, 3);


##### VIEWS #####
CREATE VIEW vista_equipos_jugadores AS
SELECT e.nombre_equipo, e.victorias, e.fase_alcanzada, g.nombre_goleador, g.goles
FROM equipo e join goleador g on e.codigo_equipo = g.codigo_equipo;

CREATE VIEW vista_equipos AS
SELECT nombre_equipo, fase_alcanzada FROM equipo;

CREATE VIEW vista_goleadores AS
SELECT nombre_goleador, goles FROM goleador;

CREATE VIEW vista_maximo_goleador AS
SELECT nombre_goleador, goles FROM goleador WHERE goles >= ALL (SELECT goles from goleador);

CREATE VIEW vista_entrenadores_equipos AS
SELECT e.nombre_entrenador, eq.nombre_equipo
FROM entrenador e join equipo eq on eq.codigo_entrenador = e.codigo_entrenador;


##### INDEXES ####
ALTER TABLE `torneo_iesharia`.`equipo` ADD INDEX(nombre_equipo);

ALTER TABLE `torneo_iesharia`.`equipo` ADD INDEX(victorias);

ALTER TABLE `torneo_iesharia`.`partido` ADD INDEX(resultado);

ALTER TABLE `torneo_iesharia`.`goleador` ADD INDEX(nombre_goleador);

ALTER TABLE `torneo_iesharia`.`entrenador` ADD INDEX(nombre_entrenador);



##### PROCEDURES #####

# Añadir equipos
DELIMITER //

CREATE PROCEDURE AgregarEquipo(
    IN codigo_equipo INT,
    IN nombre_equipo VARCHAR(50),
    IN victorias INT,
    IN empates INT,
    IN derrotas INT,
    IN goles_a_favor INT,
    IN goles_en_contra INT,
    IN fase_alcanzada VARCHAR(20),
    IN curso VARCHAR(20),
    IN codigo_entrenador INT
)
BEGIN
    INSERT INTO equipo (
        codigo_equipo, nombre_equipo, victorias, empates, derrotas,
        goles_a_favor, goles_en_contra, fase_alcanzada, curso, codigo_entrenador
    ) VALUES (
        codigo_equipo, nombre_equipo, victorias, empates, derrotas,
        goles_a_favor, goles_en_contra, fase_alcanzada, curso, codigo_entrenador
    );
END //

DELIMITER ;


# Actualizar datos de equipos
DELIMITER //

CREATE PROCEDURE ActualizarEstadisticasEquipo(
    IN codigo_equipo INT,
    IN victorias INT,
    IN empates INT,
    IN derrotas INT,
    IN goles_a_favor INT,
    IN goles_en_contra INT
)
BEGIN
    UPDATE equipo
    SET victorias = victorias,
        empates = empates,
        derrotas = derrotas,
        goles_a_favor = goles_a_favor,
        goles_en_contra = goles_en_contra
    WHERE codigo_equipo = codigo_equipo;
END //

DELIMITER ;


#Añadir un partido y asociar los equipos
DELIMITER //

CREATE PROCEDURE RegistrarPartido(
    IN codigo_partido INT,
    IN fecha DATE,
    IN fase VARCHAR(20),
    IN resultado VARCHAR(5),
    IN codigo_equipo1 INT,
    IN codigo_equipo2 INT
)
BEGIN
    INSERT INTO partido (codigo_partido, fecha, fase, resultado)
    VALUES (codigo_partido, fecha, fase, resultado);

    INSERT INTO partido_equipo (codigo_partido, codigo_equipo)
    VALUES (codigo_partido, codigo_equipo1), (codigo_partido, codigo_equipo2);
END //

DELIMITER ;



##### FUNCTIONS #####

# Calcular diferencia de goles de un equipo
DELIMITER //

CREATE FUNCTION CalcularDiferenciaGoles(codigo_equipo INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE goles_a_favor INT;
    DECLARE goles_en_contra INT;

    SELECT goles_a_favor, goles_en_contra
    INTO goles_a_favor, goles_en_contra
    FROM equipo
    WHERE codigo_equipo = codigo_equipo;

    RETURN goles_a_favor - goles_en_contra;
END //

DELIMITER ;


# Obtener nombre completo de un entrenador
DELIMITER //

CREATE FUNCTION ObtenerNombreCompletoEntrenador(codigo_entrenador INT)
RETURNS VARCHAR(150)
DETERMINISTIC
BEGIN
    DECLARE nombre VARCHAR(50);
    DECLARE apellido1 VARCHAR(50);
    DECLARE apellido2 VARCHAR(50);

    SELECT nombre_entrenador, apellido1, apellido2
    INTO nombre, apellido1, apellido2
    FROM entrenador
    WHERE codigo_entrenador = codigo_entrenador;

    RETURN CONCAT(nombre, ' ', apellido1, ' ', COALESCE(apellido2, ''));
END //

DELIMITER ;


# Calcular cuantos puntos tendría un equipo 
# (3 puntos por victoria, 1 punto por empate)
DELIMITER //

CREATE FUNCTION CalcularPuntosEquipo(codigo_equipo INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE victorias INT;
    DECLARE empates INT;
    DECLARE puntos INT;

    SELECT victorias, empates
    INTO victorias, empates
    FROM equipo
    WHERE codigo_equipo = codigo_equipo;

    SET puntos = (victorias * 3) + (empates);

    RETURN puntos;
END //

DELIMITER ;
