use torneo_iesharia;

/* CONSULTAS PARA LA BASE DE DATOS */ 

#1 Muestra el nombre de los equipos que se quedaron en la fase de grupos"
SELECT nombre_equipo FROM equipo WHERE fase_alcanzada = "Fase de grupos";

#2 Muestra el nombre y las victorias de los equipos que lleven 3 o más victorias"
SELECT nombre_equipo, victorias FROM equipo WHERE victorias >= 3 ORDER BY victorias DESC;

#3 Muestra el equipo cuyo patrocinador es "Emirates"
SELECT nombre_equipo FROM equipo e
JOIN patrocinador p ON e.codigo_equipo = p.codigo_equipo WHERE  nombre_patrocinador = "Emirates";

#4 Todos los goleadores de "Los Galácticos"
SELECT g.nombre_goleador, g.goles FROM goleador g
JOIN equipo e ON g.codigo_equipo = e.codigo_equipo
WHERE e.codigo_equipo = 2;

#5 Muestra el nombre, los goles y el nombre del equipo de todos los goleadores
SELECT nombre_goleador, goles, e.nombre_equipo FROM goleador g 
JOIN equipo e ON g.codigo_equipo = e.codigo_equipo order by goles DESC;

#6 Muestra el nombre_equipo y el nombre_patrocinador de los equipos cuyo patrocinador empiece por A
SELECT e.nombre_equipo, p.nombre_patrocinador FROM equipo e 
JOIN patrocinador p ON e.codigo_equipo = p.codigo_equipo WHERE nombre_patrocinador LIKE "A%";

#7 Muestra el jugador con más goles que empiece por la letra "A" (Usando ALL o ANY)
SELECT nombre_goleador, goles FROM goleador
WHERE nombre_goleador LIKE 'F%' and goles >= ALL (select goles from goleador);

#8 Muestra el nombre y el equipo y sus victorias de los goleadores cuyo equipo tenga al menos 17 goles a favor
select g.nombre_goleador, e.nombre_equipo, e.victorias from goleador g
join equipo e on g.codigo_equipo = e.codigo_equipo
where goles_a_favor >= 17;

#9 Muestra el nombre del socio cuyo equipo tiene de entrenador a Diego
select nombre_socio from socio s
join equipo e on s.codigo_equipo = e.codigo_equipo
where codigo_entrenador = (select codigo_entrenador from entrenador where nombre_entrenador ="Diego");


#10 Muestra el nombre, el primer apellido y el equipo de los entrenadores que pasaron de la fase de grupos (Usando IN o NOT IN)
SELECT e.nombre_entrenador, e.apellido1, eq.nombre_equipo FROM entrenador e
JOIN equipo eq ON e.codigo_entrenador = eq.codigo_entrenador
where fase_alcanzada NOT IN ("Fase de grupos");