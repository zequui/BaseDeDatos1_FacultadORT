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

    SELECT pa.idpartida, p.NombrePais, pa.FechaCreacion, j.Alias
    FROM PARTIDA pa
    INNER JOIN PAIS p ON pa.idpais = p.idpais
    INNER JOIN paisPartidaJugador j ON pa.idpartida = j.idpartida
    INNER JOIN TRUEQUE t ON (
        (t.idpartidaa = pa.idpartida AND t.Jugadora = j.Alias)
        OR
        (t.idpartidab = pa.idpartida AND t.Jugadorb = j.Alias)
    )
    INNER JOIN RECURSO rA ON t.IdRecursoA = rA.IdRecurso
    INNER JOIN RECURSO rB ON t.IdRecursoB = rB.IdRecurso

    MINUS
    
    SELECT pa2.idpartida, p2.nombrepais, pa2.FechaCreacion, j2.Alias
    FROM 
        PARTIDA pa2
        INNER JOIN PAIS p2 ON pa2.idpais = p2.idpais
        INNER JOIN paisPartidaJugador j2 ON pa2.idpartida = j2.idpartida
        INNER JOIN TRUEQUE t2 ON (
            (t2.idpartidaa = pa2.idpartida AND t2.Jugadora = j2.Alias)
            OR
            (t2.idpartidab = pa2.idpartida AND t2.Jugadorb = j2.Alias)
        )
        INNER JOIN RECURSO rA2 ON t2.idrecursoa = rA2.idrecurso
        INNER JOIN RECURSO rB2 ON t2.idrecursob = rB2.idrecurso
    WHERE (rA2.TipoRecurso = 'PBN' OR rB2.TipoRecurso = 'PBN');


-- 3) Obtener el nombre y alias de los jugadores que hayan participado en partidas creadas en los
-- últimos 3 meses y con la mayor configuración de consumo. Considerar aquellos jugadores que
-- participaron con el rol de invitado.

-- ! NOTA: ASUMI QUE LA FECHA ACTUAL ES 05-NOV-25 PARA PODER CALCULAR LOS ULTIMOS 3 MESES YA QUE LA IMPLEMENTACION ANTERIOR NO FUNCIONABA
-- ! QUIZA PODEMOS CAMBIAR COMO USAMOS LA FECHA, EN EL LAB LO MENCIONO

SELECT J.ALIAS, J.NOMBREJUGADOR
FROM   JUGADOR J
JOIN   PAISPARTIDAJUGADOR PPJ ON J.ALIAS = PPJ.ALIAS
JOIN   PARTIDA P ON P.IDPARTIDA = PPJ.IDPARTIDA AND P.IDPAIS = PPJ.IDPAIS
WHERE  PPJ.ROL = 'INVITADO'
  AND  P.FECHACREACION >= '05-SEP-25'
  AND  P.CONFIGURACIONCONSUMO IN (
           SELECT MAX(CONFIGURACIONCONSUMO)
           FROM   PARTIDA
           WHERE  FECHACREACION >= '05-SEP-25' -- TOMANDO LA PARTIDA MAS RECIENTE = 05-NOV-25
       );
    
   
-- 4) Obtener el alias de los jugadores cuyos países hayan intercambiado la menor cantidad del
-- recurso hierro en un trueque. Considerar los alias de los jugadores que participan en el trueque
-- únicamente como jugador A.

SELECT DISTINCT p.alias
FROM PAISPARTIDAJUGADOR P
INNER JOIN TRUEQUE t ON t.jugadora = p.alias
INNER JOIN RECURSO r ON t.idrecursoa = r.idrecurso
WHERE UPPER(r.nombre) = 'HIERRO'
AND t.cantidadrecursoa = (
    SELECT MIN(t2.cantidadrecursoa)
    FROM TRUEQUE t2
    WHERE t2.idrecursoa IN (
        Select r2.idrecurso
        FROM RECURSO r2
        WHERE UPPER(r2.nombre) = 'HIERRO'
    )
);

-- 5) Obtener el alias y nombre de jugadores cuyos países hayan consumido de todos los recursos
-- de tipo “CONSTRUCCIÓN”. Considerar únicamente las construcciones cuyo tipo de operación
-- es “CONSUME” y las partidas con una configuración de consumo que supere las 1.000
-- unidades.

 -- ! CHICOS SE QUE SE VE RARO PERO LO DIMOS EL VIERNES 7 EN EL LAB POR SI QUIEREN VER LA LOGICA ESTA AL FINAL EN EL EJ16

SELECT J.ALIAS, J.NOMBREJUGADOR
FROM JUGADOR J
WHERE NOT EXISTS (
           SELECT 1
           FROM   RECURSO R
           WHERE  R.TIPORECURSO = 'CONSTRUCCION'
           AND NOT EXISTS (
                      SELECT 1
                      FROM CONSTRUCCION C
                      JOIN PARTIDA P ON P.IDPARTIDA = C.IDPARTIDA 
                       AND P.IDPAIS = C.IDPAIS
                      JOIN PAISPARTIDAJUGADOR PPJ ON PPJ.IDPARTIDA = C.IDPARTIDA 
                        AND PPJ.IDPAIS = C.IDPAIS 
                        AND PPJ.ALIAS = C.ALIAS
                      WHERE  C.IDRECURSO = R.IDRECURSO
                        AND  C.TIPOOPERACION = 'CONSUME'
                        AND  P.
                         > 1000
                        AND  PPJ.ALIAS = J.ALIAS
                  )
       );              
                    


-- 6) Obtener el nombre y tipo de recurso que se utilizó la mayor cantidad de veces en construcciones.
-- Considerar solamente aquellas construcciones de partidas creadas en los últimos 30 días y que
-- dichas partidas no hayan tenido ningún trueque.

-- ? Para fechas BETWEEN (SYSDATE - INTERVAL '3') MONTH AND SYSDATE 
SELECT r.Nombre, r.TipoRecurso
FROM recurso r
JOIN construccion c ON r.IdRecurso = c.IdRecurso
JOIN partida p ON c.IdPartida = p.IdPartida AND c.IdPais = p.IdPais
WHERE p.FechaCreacion >= '05-OCT-2025'
AND p.IdPartida NOT IN (
    SELECT IdPartidaA FROM trueque
    UNION
    SELECT IdPartidaB FROM trueque
)
GROUP BY r.Nombre, r.TipoRecurso
HAVING COUNT(*) >= ALL(
    SELECT COUNT(Cantidad)
    FROM construccion c2
    JOIN partida p2 ON c2.IdPartida = p2.IdPartida AND c2.IdPais = p2.IdPais
    WHERE p2.FechaCreacion >= '05-OCT-2025'
    AND p2.IdPartida NOT IN(
            SELECT IdPartidaA FROM trueque
            UNION
            SELECT IdPartidaB FROM trueque
    )
);


-- 7) Listar para cada partida, el nombre de los países con el menor stock acumulado de recursos de
-- tipo “CONSTRUCCIÓN”. Considerar solamente las partidas que hayan realizado algún trueque
-- en los que participó el país “Uruguay”, “Brasil” o “Argentina”.

    SELECT ppj.idpartida AS Partida, p.NombrePais AS Pais
    FROM PAISPARTIDAJUGADOR ppj
    INNER JOIN Pais p ON p.idpais = ppj.idpais
    INNER JOIN inventariorecurso ir ON ppj.idpartida = ir.idpartida AND ppj.idpais = ir.idpais
    INNER JOIN recurso r ON ir.idrecurso = r.idrecurso
    WHERE r.TipoRecurso = 'CONSTRUCCION'
    AND EXISTS (
        SELECT 1
        FROM TRUEQUE t
        INNER JOIN Pais pA ON t.idPaisA = pA.idPais
        INNER JOIN Pais pB ON t.idPaisB = pB.idPais
        WHERE (t.idpartidaA = ppj.idpartida OR t.idpartidaB = ppj.idpartida)
        AND (pA.nombrepais IN ('Uruguay','Brasil','Argentina')
            OR pB.nombrepais IN ('Uruguay','Brasil','Argentina'))
    )
    GROUP BY ppj.idpartida, p.NombrePais
    HAVING SUM(ir.STOCKACUMULADO) = (
        SELECT MIN(TotalStock)
        FROM (
            SELECT ppj2.idpais, SUM(ir2.STOCKACUMULADO) AS TotalStock
            FROM PAISPARTIDAJUGADOR ppj2
            INNER JOIN inventariorecurso ir2 ON ppj2.idpartida = ir2.idpartida AND ppj2.idpais = ir2.idpais
            INNER JOIN recurso r2 ON ir2.idrecurso = r2.idrecurso
            WHERE r2.TipoRecurso = 'CONSTRUCCION'
            AND ppj2.idpartida = ppj.idpartida
            GROUP BY ppj2.idpais
        )
    );

-- 8) Obtener el nombre de los países que son autosuficientes. Un país se considera autosuficiente
-- en una partida si el total de recursos de tipo “CONSUMO” que producen es mayor que el total
-- de recursos del mismo tipo que consumen. Considerar solo las partidas que aún no han tenido
-- ningún trueque. Mostrar el nombre del país y el id de la partida en la que cumpla esta condición.

SELECT p.nombrepais AS Pais,ir.idpartida as Partida
FROM PAIS p
INNER JOIN inventarioRecurso ir 
    ON ir.idPais = p.idpais
INNER JOIN PARTIDA pa 
    ON ir.idpartida = pa.idpartida
INNER JOIN RECURSO r 
    ON r.idrecurso = ir.idrecurso
WHERE NOT EXISTS (
    SELECT 1
    FROM TRUEQUE t
    WHERE (t.idpartidaA = ir.idpartida
        OR t.idpartidaB = ir.idpartida
    )
)
GROUP BY p.nombrepais,ir.idpartida,ir.idpais
HAVING 
    (
        SELECT SUM(c2.cantidadrecurso)
        FROM CONSTRUCCION c2
        INNER JOIN RECURSO r2 ON c2.idrecurso = r2.idrecurso
        WHERE c2.idpais = ir.idpais
        AND c2.idpartida = ir.idpartida
        AND r2.TipoRecurso = 'CONSUMO'
        AND c2.TipoOperacion = 'PRODUCE'
    )
    
    > 
    
    (
        SELECT SUM(c3.cantidadrecurso)
        FROM CONSTRUCCION c3
        INNER JOIN RECURSO r3 ON c3.idrecurso = r3.idrecurso
        WHERE c3.idpais = ir.idpais
        AND c3.idpartida = ir.idpartida
        AND r3.TipoRecurso = 'CONSUMO'
        AND c3.TipoOperacion = 'CONSUME'
    )
;

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


SELECT
    PPJ.alias,
    PPJ.idpartida,
    PPJ.idpais,
    PPJ.rol,
    J.nombrejugador,
    CASE PPJ.rol
        WHEN 'ANFITRION' THEN 'Creador de la partida' 
        WHEN 'INVITADO'  THEN 'Invitado por el anfitrión'
        WHEN 'SE UNIO'   THEN 'Se unió voluntariamente'
        ELSE 'Rol desconocido'
    END AS descripcion_rol,
    u.cantusi,
    (u.cantusi * 100.0) / t.total AS porcentaje,
     CASE ppj.rol
        WHEN 'ANFITRION' THEN (SELECT SUM(IR.stockacumulado)
                                FROM INVENTARIORECURSO IR
                                WHERE IR.alias = PPJ.ALIAS
                                )
        WHEN 'INVITADO' THEN (t.total)
        WHEN 'SE UNIO' THEN (
                    SELECT COUNT(*)
                    FROM TRUEQUE TR
                    WHERE TR.jugadorb = PPJ.alias
                )
            END AS DATOROL

FROM PAISPARTIDAJUGADOR PPJ
INNER JOIN JUGADOR J ON J.alias = PPJ.alias
INNER JOIN PARTIDA P ON P.idpartida = PPJ.idpartida AND P.idpais = PPJ.idpais
CROSS JOIN (SELECT COUNT(*) AS cantusi FROM construccion WHERE tipoconstruccion = 'USINAS') u
CROSS JOIN (SELECT COUNT(*) AS total FROM construccion) t
WHERE EXTRACT(YEAR FROM P.fechacreacion) = 2025
GROUP BY PPJ.alias, PPJ.idpartida, PPJ.idpais, PPJ.rol, J.nombrejugador, u.cantusi, t.total;





-- 10) Para cada recurso, obtener la cantidad de partidas donde fue utilizado en los últimos 15 días.
-- Obtener la cantidad de construcciones para las que se utilizó este recurso. Obtener el nombre
-- del país que utilizó más veces el recurso y el que menos lo utilizó. 


SELECT r.idrecurso, r.nombre, COUNT(DISTINCT ir.idpartida) AS partidas_usadas, COUNT(c.tipoconstruccion) AS contrucciones_usadas,

(
        SELECT pa.nombrepais
        FROM PAIS pa
        JOIN PARTIDA p2 ON p2.idpais = pa.idpais
        JOIN INVENTARIORECURSO ir2 ON ir2.idpartida = p2.idpartida
        WHERE ir2.idrecurso = r.idrecurso
        GROUP BY pa.nombrepais
        ORDER BY COUNT(*) DESC -- ORDENA DESCENDIENTE  
        FETCH FIRST 1 ROW ONLY -- FUERZA A SOLO MOSTRAR UNA FILA(LA PRIMERA) LINK: https://blogs.oracle.com/sql/how-to-select-the-top-n-rows-per-group-with-sql-in-oracle-database
    ) AS pais_mas_usos
    ,

(
        SELECT pa.nombrepais
        FROM PAIS pa
        JOIN PARTIDA p2 ON p2.idpais = pa.idpais
        JOIN INVENTARIORECURSO ir2 ON ir2.idpartida = p2.idpartida
        WHERE ir2.idrecurso = r.idrecurso
        GROUP BY pa.nombrepais
        ORDER BY COUNT(*) ASC -- ORDENA ASCENDIENTE  
        FETCH FIRST 1 ROW ONLY 
    ) AS pais_menos_usos

FROM RECURSO r
CROSS JOIN INVENTARIORECURSO ir -- USE CROSS JOIN PARA EVALUAR TODOS LOS RECURSOS INCLUSO SI NO SE USAN
LEFT JOIN PARTIDA p ON p.idpartida = ir.idpartida 
LEFT JOIN CONSTRUCCION C ON c.idrecurso = r.idrecurso -- USE LEFT JOIN POR SI NO SE USAN RECURSOS EN LA PARTIDA QUE APAREZCAN IGUAL
WHERE p.fechacreacion >= '29-OCT-2025'
GROUP BY r.idrecurso, r.nombre;
