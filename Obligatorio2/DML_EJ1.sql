------------------------------------------------------------
-- EJERCICIO 1 - CASOS DE PRUEBA
------------------------------------------------------------

-- === Jugadores ===
INSERT INTO jugador (Alias, nombreJugador, email, fechaRegistro)
SELECT 'p1','Player 1','p1@mail.com', DATE '2025-01-01' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM jugador WHERE alias='p1');

INSERT INTO jugador (Alias, nombreJugador, email, fechaRegistro)
SELECT 'p2','Player 2','p2@mail.com', DATE '2025-01-02' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM jugador WHERE alias='p2');

INSERT INTO jugador (Alias, nombreJugador, email, fechaRegistro)
SELECT 'p3','Player 3','p3@mail.com', DATE '2025-01-03' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM jugador WHERE alias='p3');

INSERT INTO jugador (Alias, nombreJugador, email, fechaRegistro)
SELECT 'p4','Player 4','p4@mail.com', DATE '2025-01-04' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM jugador WHERE alias='p4');

-- === Recursos dedicados a estos casos ===
-- CONSTRUCCION: 9101..9106  |  CONSUMO: 9201
INSERT INTO recurso (idRecurso,nombre,tipoRecurso)
SELECT 9101,'C_Hierro','CONSTRUCCION' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM recurso WHERE idRecurso=9101);

INSERT INTO recurso SELECT 9102,'C_Cemento','CONSTRUCCION' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM recurso WHERE idRecurso=9102);

INSERT INTO recurso SELECT 9103,'C_Aluminio','CONSTRUCCION' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM recurso WHERE idRecurso=9103);

INSERT INTO recurso SELECT 9104,'C_Plastico','CONSTRUCCION' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM recurso WHERE idRecurso=9104);

INSERT INTO recurso SELECT 9105,'C_Cobre','CONSTRUCCION' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM recurso WHERE idRecurso=9105);

INSERT INTO recurso SELECT 9106,'C_Carbono','CONSTRUCCION' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM recurso WHERE idRecurso=9106);

INSERT INTO recurso (idRecurso,nombre,tipoRecurso)
SELECT 9201,'U_Petroleo','CONSUMO' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM recurso WHERE idRecurso=9201);

-- === Países nuevos (901..910) ===
INSERT INTO pais (idPais,nombrePais)
SELECT 901,'Alandor' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM pais WHERE idPais=901);
INSERT INTO pais SELECT 902,'BoroniaX' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM pais WHERE idPais=902);
INSERT INTO pais SELECT 903,'CireniaX' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM pais WHERE idPais=903);
INSERT INTO pais SELECT 904,'Dorlonia' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM pais WHERE idPais=904);
INSERT INTO pais SELECT 905,'Erevix' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM pais WHERE idPais=905);
INSERT INTO pais SELECT 906,'Fresium' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM pais WHERE idPais=906);
INSERT INTO pais SELECT 907,'Gadoria' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM pais WHERE idPais=907);
INSERT INTO pais SELECT 908,'Hesperyx' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM pais WHERE idPais=908);
INSERT INTO pais SELECT 909,'Iberiona' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM pais WHERE idPais=909);
INSERT INTO pais SELECT 910,'Nullandia' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM pais WHERE idPais=910);

-- === Partidas (una por país, 91001..91010) ===
INSERT INTO partida (idPartida,idPais,fechaCreacion,configuracionConsumo)
SELECT 91001,901,DATE '2025-11-10',800 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM partida WHERE idPartida=91001 AND idPais=901);
INSERT INTO partida SELECT 91002,902,DATE '2025-11-10',800 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM partida WHERE idPartida=91002 AND idPais=902);
INSERT INTO partida SELECT 91003,903,DATE '2025-11-10',800 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM partida WHERE idPartida=91003 AND idPais=903);
INSERT INTO partida SELECT 91004,904,DATE '2025-11-10',800 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM partida WHERE idPartida=91004 AND idPais=904);
INSERT INTO partida SELECT 91005,905,DATE '2025-11-10',800 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM partida WHERE idPartida=91005 AND idPais=905);
INSERT INTO partida SELECT 91006,906,DATE '2025-11-10',800 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM partida WHERE idPartida=91006 AND idPais=906);
INSERT INTO partida SELECT 91007,907,DATE '2025-11-10',800 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM partida WHERE idPartida=91007 AND idPais=907);
INSERT INTO partida SELECT 91008,908,DATE '2025-11-10',800 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM partida WHERE idPartida=91008 AND idPais=908);
INSERT INTO partida SELECT 91009,909,DATE '2025-11-10',800 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM partida WHERE idPartida=91009 AND idPais=909);
INSERT INTO partida SELECT 91010,910,DATE '2025-11-10',800 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM partida WHERE idPartida=91010 AND idPais=910);

-- === País-Partida-Jugador (PPJ) ===
-- Caso normal: un jugador por país/partida
INSERT INTO paisPartidaJugador
SELECT 91001,901,'p1','ANFITRION' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM paisPartidaJugador WHERE idPartida=91001 AND idPais=901 AND alias='p1');

INSERT INTO paisPartidaJugador
SELECT 91002,902,'p1','ANFITRION' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM paisPartidaJugador WHERE idPartida=91002 AND idPais=902 AND alias='p1');

INSERT INTO paisPartidaJugador
SELECT 91003,903,'p1','ANFITRION' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM paisPartidaJugador WHERE idPartida=91003 AND idPais=903 AND alias='p1');

INSERT INTO paisPartidaJugador
SELECT 91004,904,'p1','ANFITRION' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM paisPartidaJugador WHERE idPartida=91004 AND idPais=904 AND alias='p1');

INSERT INTO paisPartidaJugador
SELECT 91005,905,'p1','ANFITRION' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM paisPartidaJugador WHERE idPartida=91005 AND idPais=905 AND alias='p1');

INSERT INTO paisPartidaJugador
SELECT 91006,906,'p1','ANFITRION' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM paisPartidaJugador WHERE idPartida=91006 AND idPais=906 AND alias='p1');

-- Caso multi-jugador (escenario "ambos" en el mismo país/partida)
INSERT INTO paisPartidaJugador
SELECT 91007,907,'p2','ANFITRION' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM paisPartidaJugador WHERE idPartida=91007 AND idPais=907 AND alias='p2');

INSERT INTO paisPartidaJugador
SELECT 91007,907,'p3','INVITADO' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM paisPartidaJugador WHERE idPartida=91007 AND idPais=907 AND alias='p3');

-- Resto
INSERT INTO paisPartidaJugador
SELECT 91008,908,'p1','ANFITRION' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM paisPartidaJugador WHERE idPartida=91008 AND idPais=908 AND alias='p1');

INSERT INTO paisPartidaJugador
SELECT 91009,909,'p1','ANFITRION' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM paisPartidaJugador WHERE idPartida=91009 AND idPais=909 AND alias='p1');

INSERT INTO paisPartidaJugador
SELECT 91010,910,'p4','ANFITRION' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM paisPartidaJugador WHERE idPartida=91010 AND idPais=910 AND alias='p4');

-- === Inventario básico para cada recurso que aparecerá en CONSTRUCCION ===
-- Alandor (901) - multirrecurso de CONSTRUCCION
INSERT INTO inventarioRecurso SELECT 91001,901,'p1',9101,100 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM inventarioRecurso WHERE idPartida=91001 AND idPais=901 AND alias='p1' AND idRecurso=9101);
INSERT INTO inventarioRecurso SELECT 91001,901,'p1',9102,100 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM inventarioRecurso WHERE idPartida=91001 AND idPais=901 AND alias='p1' AND idRecurso=9102);

-- BoroniaX (902) - astillero válido
INSERT INTO inventarioRecurso SELECT 91002,902,'p1',9103,100 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM inventarioRecurso WHERE idPartida=91002 AND idPais=902 AND alias='p1' AND idRecurso=9103);

-- CireniaX (903) - ambos válidos
INSERT INTO inventarioRecurso SELECT 91003,903,'p1',9101,100 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM inventarioRecurso WHERE idPartida=91003 AND idPais=903 AND alias='p1' AND idRecurso=9101);
INSERT INTO inventarioRecurso SELECT 91003,903,'p1',9102,100 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM inventarioRecurso WHERE idPartida=91003 AND idPais=903 AND alias='p1' AND idRecurso=9102);

-- Dorlonia (904) - puerto con CONSUMO (descartado)
INSERT INTO inventarioRecurso SELECT 91004,904,'p1',9201,100 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM inventarioRecurso WHERE idPartida=91004 AND idPais=904 AND alias='p1' AND idRecurso=9201);

-- Erevix (905) - astillero válido + puerto mixto
INSERT INTO inventarioRecurso SELECT 91005,905,'p1',9104,100 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM inventarioRecurso WHERE idPartida=91005 AND idPais=905 AND alias='p1' AND idRecurso=9104);
INSERT INTO inventarioRecurso SELECT 91005,905,'p1',9201,100 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM inventarioRecurso WHERE idPartida=91005 AND idPais=905 AND alias='p1' AND idRecurso=9201);
INSERT INTO inventarioRecurso SELECT 91005,905,'p1',9105,100 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM inventarioRecurso WHERE idPartida=91005 AND idPais=905 AND alias='p1' AND idRecurso=9105);

-- Fresium (906) - dos puertos: uno válido y uno mixto
INSERT INTO inventarioRecurso SELECT 91006,906,'p1',9106,100 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM inventarioRecurso WHERE idPartida=91006 AND idPais=906 AND alias='p1' AND idRecurso=9106);
INSERT INTO inventarioRecurso SELECT 91006,906,'p1',9201,100 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM inventarioRecurso WHERE idPartida=91006 AND idPais=906 AND alias='p1' AND idRecurso=9201);

-- Gadoria (907) - multi-jugador: puerto (p2) + astillero (p3)
INSERT INTO inventarioRecurso SELECT 91007,907,'p2',9101,100 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM inventarioRecurso WHERE idPartida=91007 AND idPais=907 AND alias='p2' AND idRecurso=9101);
INSERT INTO inventarioRecurso SELECT 91007,907,'p3',9102,100 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM inventarioRecurso WHERE idPartida=91007 AND idPais=907 AND alias='p3' AND idRecurso=9102);

-- Hesperyx (908) - astillero PRODUCE
INSERT INTO inventarioRecurso SELECT 91008,908,'p1',9103,100 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM inventarioRecurso WHERE idPartida=91008 AND idPais=908 AND alias='p1' AND idRecurso=9103);

-- Iberiona (909) - astillero multirrecurso (todo CONSTRUCCION)
INSERT INTO inventarioRecurso SELECT 91009,909,'p1',9104,100 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM inventarioRecurso WHERE idPartida=91009 AND idPais=909 AND alias='p1' AND idRecurso=9104);
INSERT INTO inventarioRecurso SELECT 91009,909,'p1',9105,100 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM inventarioRecurso WHERE idPartida=91009 AND idPais=909 AND alias='p1' AND idRecurso=9105);

-- Nullandia (910) - sin construcciones (no inventario requerido)

-- === CONSTRUCCIONES (los escenarios) ===

-- (A) Alandor: SOLO PUERTO válido (multirrecurso todo CONSTRUCCION) -> DEBE SALIR
INSERT INTO construccion SELECT 91001,901,'p1',9101,10001,'PUERTO','CONSUME',10 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM construccion WHERE idPartida=91001 AND idPais=901 AND alias='p1' AND idConstruccion=10001 AND idRecurso=9101);
INSERT INTO construccion SELECT 91001,901,'p1',9102,10001,'PUERTO','CONSUME',5 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM construccion WHERE idPartida=91001 AND idPais=901 AND alias='p1' AND idConstruccion=10001 AND idRecurso=9102);

-- (B) BoroniaX: SOLO ASTILLERO válido -> DEBE SALIR
INSERT INTO construccion SELECT 91002,902,'p1',9103,10002,'ASTILLERO','CONSUME',10 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM construccion WHERE idPartida=91002 AND idPais=902 AND alias='p1' AND idConstruccion=10002);

-- (C) CireniaX: PUERTO válido + ASTILLERO válido -> NO DEBE SALIR
INSERT INTO construccion SELECT 91003,903,'p1',9101,10003,'PUERTO','CONSUME',10 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM construccion WHERE idPartida=91003 AND idPais=903 AND alias='p1' AND idConstruccion=10003);
INSERT INTO construccion SELECT 91003,903,'p1',9102,10004,'ASTILLERO','CONSUME',10 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM construccion WHERE idPartida=91003 AND idPais=903 AND alias='p1' AND idConstruccion=10004);

-- (D) Dorlonia: PUERTO con CONSUMO -> NO DEBE SALIR
INSERT INTO construccion SELECT 91004,904,'p1',9201,10005,'PUERTO','CONSUME',10 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM construccion WHERE idPartida=91004 AND idPais=904 AND alias='p1' AND idConstruccion=10005);

-- (E) Erevix: ASTILLERO válido + PUERTO mixto (combina CONSTRUCCION+CONSUMO) + PUERTO -> NO DEBE SALIR
INSERT INTO construccion SELECT 91005,905,'p1',9104,10006,'PUERTO','CONSUME',5 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM construccion WHERE idPartida=91005 AND idPais=905 AND alias='p1' AND idConstruccion=10006 AND idRecurso=9104);
INSERT INTO construccion SELECT 91005,905,'p1',9201,10006,'PUERTO','CONSUME',5 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM construccion WHERE idPartida=91005 AND idPais=905 AND alias='p1' AND idConstruccion=10006 AND idRecurso=9201);
INSERT INTO construccion SELECT 91005,905,'p1',9105,10007,'ASTILLERO','CONSUME',10 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM construccion WHERE idPartida=91005 AND idPais=905 AND alias='p1' AND idConstruccion=10007);

-- (F) Fresium: dos PUERTOS (uno válido y uno mixto) -> DEBE SALIR
INSERT INTO construccion SELECT 91006,906,'p1',9106,10008,'PUERTO','CONSUME',10 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM construccion WHERE idPartida=91006 AND idPais=906 AND alias='p1' AND idConstruccion=10008);
INSERT INTO construccion SELECT 91006,906,'p1',9106,10009,'PUERTO','CONSUME',5 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM construccion WHERE idPartida=91006 AND idPais=906 AND alias='p1' AND idConstruccion=10009 AND idRecurso=9106);
INSERT INTO construccion SELECT 91006,906,'p1',9201,10009,'PUERTO','CONSUME',5 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM construccion WHERE idPartida=91006 AND idPais=906 AND alias='p1' AND idConstruccion=10009 AND idRecurso=9201);

-- (G) Gadoria: PUERTO (p2) + ASTILLERO (p3) -> NO DEBE SALIR
INSERT INTO construccion SELECT 91007,907,'p2',9101,10100,'PUERTO','CONSUME',10 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM construccion WHERE idPartida=91007 AND idPais=907 AND alias='p2' AND idConstruccion=10100);
INSERT INTO construccion SELECT 91007,907,'p3',9102,10101,'ASTILLERO','CONSUME',10 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM construccion WHERE idPartida=91007 AND idPais=907 AND alias='p3' AND idConstruccion=10101);

-- (H) Hesperyx: ASTILLERO valido -> DEBE SALIR
INSERT INTO construccion SELECT 91008,908,'p1',9103,10102,'ASTILLERO','PRODUCE',10 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM construccion WHERE idPartida=91008 AND idPais=908 AND alias='p1' AND idConstruccion=10102);

-- (I) Iberiona: ASTILLERO multirrecurso (todo CONSTRUCCION) -> DEBE SALIR
INSERT INTO construccion SELECT 91009,909,'p1',9104,10103,'ASTILLERO','CONSUME',5 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM construccion WHERE idPartida=91009 AND idPais=909 AND alias='p1' AND idConstruccion=10103 AND idRecurso=9104);
INSERT INTO construccion SELECT 91009,909,'p1',9105,10103,'ASTILLERO','CONSUME',5 FROM dual
WHERE NOT EXISTS (SELECT 1 FROM construccion WHERE idPartida=91009 AND idPais=909 AND alias='p1' AND idConstruccion=10103 AND idRecurso=9105);


--Salida:
--NOMBREPAIS                                             IDPAIS
---------------------------------------------------- ----------
--Alandor                                                   901
--BoroniaX                                                  902
--Fresium                                                   906
--Hesperyx                                                  908
--Iberiona                                                  909