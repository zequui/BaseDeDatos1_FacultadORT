-- 1) Obtener todos los datos de los países que hayan construido puertos o astilleros, pero no ambos.
-- Considerar aquellas construcciones donde únicamente se utilizaron recursos del tipo construcción.

SELECT P.NombrePais, P.IdPais
FROM pais P
INNER JOIN construccion C ON P.IdPais = C.IdPais
INNER JOIN recurso R ON C.IdRecurso = R.IdRecurso
WHERE R.TipoRecurso = 'CONSTRUCCION'
AND C.TipoConstruccion IN ('PUERTO', 'ASTILLERO')
GROUP BY P.NombrePais, P.IdPais
HAVING COUNT(DISTINCT C.TipoConstruccion) = 1;


-- 2) Obtener el id de la partida, el nombre del país, la fecha de creación de la partida y el Alias de
-- los jugadores que no hayan realizado trueques de recursos del tipo producto básico nacional (PBN).




-- 3) Obtener el nombre y alias de los jugadores que hayan participado en partidas creadas en los
-- últimos 3 meses y con la mayor configuración de consumo. Considerar aquellos jugadores que
-- participaron con el rol de invitado.

select j.alias, j.nombrejugador
from jugador j, paispartidajugador p, partida pa
where j.alias = p.alias
and pa.idpartida = p.idpartida
and p.rol = 'INVITADO'
and pa.fecha >= DATEADD(MONTH, -3, GETDATE()
and pa.configuracionconsumo  = (SELECT MAX(pa2.configuracionconsumo)
                                FROM partida pa2
                                JOIN paispartidajugador p2 ON pa2.idpartida = p2.idpartida
                                WHERE p2.rol = 'INVITADO'
                                AND pa2.fecha >= DATEADD(MONTH, -3, GETDATE()));
                                
-- 4) Obtener el alias de los jugadores cuyos países hayan intercambiado la menor cantidad del
-- recurso hierro en un trueque. Considerar los alias de los jugadores que participan en el trueque
-- únicamente como jugador A.

-- 5) Obtener el alias y nombre de jugadores cuyos países hayan consumido de todos los recursos
-- de tipo “CONSTRUCCIÓN”. Considerar únicamente las construcciones cuyo tipo de operación
-- es “CONSUME” y las partidas con una configuración de consumo que supere las 1.000
-- unidades.

-- 6) Obtener el nombre y tipo de recurso que se utilizó la mayor cantidad de veces en construcciones.
-- Considerar solamente aquellas construcciones de partidas creadas en los últimos 30 días y que
-- dichas partidas no hayan tenido ningún trueque.

-- 7) Listar para cada partida, el nombre de los países con el menor stock acumulado de recursos de
-- tipo “CONSTRUCCIÓN”. Considerar solamente las partidas que hayan realizado algún trueque
-- en los que participó el país “Uruguay”, “Brasil” o “Argentina”.

-- 8) Obtener el nombre de los países que son autosuficientes. Un país se considera autosuficiente
-- en una partida si el total de recursos de tipo “CONSUMO” que producen es mayor que el total
-- de recursos del mismo tipo que consumen. Considerar solo las partidas que aún no han tenido
-- ningún trueque. Mostrar el nombre del país y el id de la partida en la que cumpla esta condición.

-- 9) Obtener la partida, el país, el alias, el nombre de los jugadores y el rol, que participaron en
-- partidas creadas en el año 2025.
-- Incluir además una columna con la descripción del rol (”ANFITRION” deberá de aparecer
-- como “Creador de la partida”, si es “INVITADO” su descripción será “Invitado por el anfitrión” y
-- si el rol es “SE UNIO”, deberá ser descripto como “Se unió voluntariamente”).
-- Mostrar también la cantidad total de construcciones de tipo usina y el porcentaje que representa
-- dicha cantidad sobre el total de construcciones.
--          Finalmente, según el rol, mostrar:
--          ANFITRIÓN: stock acumulado de los recursos.
--          SE UNIÓ: cantidad de trueques en los que participó (del lado B del trueque).
--          INVITADO: la cantidad de construcciones realizadas.

-- 10) Para cada recurso, obtener la cantidad de partidas donde fue utilizado en los últimos 15 días.
-- Obtener la cantidad de construcciones para las que se utilizó este recurso. Obtener el nombre
-- del país que utilizó más veces el recurso y el que menos lo utilizó. 