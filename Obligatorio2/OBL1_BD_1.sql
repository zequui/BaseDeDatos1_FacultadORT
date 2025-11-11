-- 1) Obtener todos los datos de los países que hayan construido puertos o astilleros, pero no ambos.
-- Considerar aquellas construcciones donde únicamente se utilizaron recursos del tipo construcción.

SELECT P.NombrePais, P.IdPais
FROM PAIS P
INNER JOIN CONSTRUCCION C ON C.IdPais = P.IdPais
WHERE C.TipoConstruccion IN ('PUERTO', 'ASTILLERO')
AND C.IdRecurso IN ( 
    SELECT IdRecurso FROM recurso WHERE TipoRecurso = 'CONSTRUCCION'
)

-- 2) Obtener el id de la partida, el nombre del país, la fecha de creación de la partida y el Alias de
-- los jugadores que no hayan realizado trueques de recursos del tipo producto básico nacional (PBN).

