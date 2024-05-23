use torneo_iesharia;

DROP INDEX `codigo_equipo`;

# 5 ÍNDICES
ALTER TABLE `torneo_iesharia`.`equipo` ADD INDEX(nombre_equipo);

ALTER TABLE `torneo_iesharia`.`equipo` ADD INDEX(victorias);

ALTER TABLE `torneo_iesharia`.`partido` ADD INDEX(resultado);

ALTER TABLE `torneo_iesharia`.`goleador` ADD INDEX(nombre_goleador);

ALTER TABLE `torneo_iesharia`.`entrenador` ADD INDEX(nombre_entrenador);


# 5 VISTAS
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

