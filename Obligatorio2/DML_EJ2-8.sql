-- =============================================================================
-- 1. JUGADORES
-- =============================================================================
-- Casos principales
INSERT INTO jugador VALUES ('OrionMaster', 'Orion',    'orion@star.com',  TO_DATE('05/01/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('LyraMusic',   'Lyra',     'lyra@star.com',   TO_DATE('10/02/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('DracoFire',   'Draco',    'draco@star.com',  TO_DATE('15/03/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('VegaNova',    'Vega',     'vega@star.com',   TO_DATE('20/04/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('SiriusBlack', 'Sirius',   'sirius@star.com', TO_DATE('25/05/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('AndromedaX',  'Andromeda','andro@star.com',  TO_DATE('30/06/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('AlienInv',    'Alien',    'alien@ufo.com',   TO_DATE('01/01/2025','DD/MM/YYYY'));

-- Casos Borde(Agregados para fallar condiciones especificas)
INSERT INTO jugador VALUES ('RetroGamer',  'Retro',    'retro@game.com',  TO_DATE('01/01/2025','DD/MM/YYYY')); -- Falla fecha
INSERT INTO jugador VALUES ('LowBudget',   'Low',      'low@budget.com',  TO_DATE('01/11/2025','DD/MM/YYYY')); -- Falla config
INSERT INTO jugador VALUES ('TraderJoe',   'Joe',      'joe@trade.com',   TO_DATE('01/11/2025','DD/MM/YYYY')); -- Falla por hacer trueque
INSERT INTO jugador VALUES ('BobBuild',    'Bob',      'bob@build.com',   TO_DATE('01/11/2025','DD/MM/YYYY')); -- Falla por tipo recurso

-- =============================================================================
-- 2. PAISES (IDs 90-99)
-- =============================================================================
INSERT INTO pais VALUES (90, 'Australia');
INSERT INTO pais VALUES (91, 'Nueva Zelanda');
INSERT INTO pais VALUES (92, 'Indonesia');
INSERT INTO pais VALUES (93, 'Filipinas');
INSERT INTO pais VALUES (94, 'Malasia');
INSERT INTO pais VALUES (95, 'Singapur');
INSERT INTO pais VALUES (99, 'Argentina'); -- Util para activar sentencia 7

-- =============================================================================
-- 3. RECURSOS (IDs 9000+)
-- =============================================================================
INSERT INTO recurso VALUES (9001, 'Titanio',      'CONSTRUCCION'); 
INSERT INTO recurso VALUES (9002, 'Acero',        'CONSTRUCCION');
INSERT INTO recurso VALUES (9003, 'Hierro',       'CONSTRUCCION'); -- Util en sentencia 4
INSERT INTO recurso VALUES (9010, 'Gas Natural',  'CONSUMO');
INSERT INTO recurso VALUES (9011, 'Electricidad', 'CONSUMO');
INSERT INTO recurso VALUES (9020, 'Pesca',        'PBN'); -- Util para sentencia 2

-- =============================================================================
-- 4. PARTIDAS
-- =============================================================================
-- 90000: La "Batalla Principal" (Nov 2025, Config 2500, Con Trueques)
INSERT INTO partida VALUES (90000, 90, TO_DATE('05/11/2025','DD/MM/YYYY'), 2500); 
INSERT INTO partida VALUES (90000, 91, TO_DATE('05/11/2025','DD/MM/YYYY'), 2500); 
INSERT INTO partida VALUES (90000, 92, TO_DATE('05/11/2025','DD/MM/YYYY'), 2500); 
INSERT INTO partida VALUES (90000, 93, TO_DATE('05/11/2025','DD/MM/YYYY'), 2500); 
INSERT INTO partida VALUES (90000, 94, TO_DATE('05/11/2025','DD/MM/YYYY'), 2500); -- Para TraderJoe
INSERT INTO partida VALUES (90000, 99, TO_DATE('05/11/2025','DD/MM/YYYY'), 2500); 

-- 91000: La "Partida Limpia" (Nov 2025, Config 1000, SIN Trueques)
INSERT INTO partida VALUES (91000, 94, TO_DATE('10/11/2025','DD/MM/YYYY'), 1000); -- Malasia (Sirius)
INSERT INTO partida VALUES (91000, 95, TO_DATE('10/11/2025','DD/MM/YYYY'), 1000); -- Singapur (Andromeda)
INSERT INTO partida VALUES (91000, 90, TO_DATE('10/11/2025','DD/MM/YYYY'), 1000); -- Australia (BobBuild)

-- 92000: La "Partida Vieja" (Enero 2025 - Falla sentencia 3 por fecha)
INSERT INTO partida VALUES (92000, 90, TO_DATE('01/01/2025','DD/MM/YYYY'), 3000);

-- 93000: La "Partida Pobre" (Nov 2025 - Falla sentencia 5 por config < 1000)
INSERT INTO partida VALUES (93000, 94, TO_DATE('10/11/2025','DD/MM/YYYY'), 500);

-- =============================================================================
-- 5. VINCULACION JUGADORES (PPJ)
-- =============================================================================
-- Partida 90000 (Principal)
INSERT INTO paisPartidaJugador VALUES (90000, 90, 'OrionMaster', 'ANFITRION'); 
INSERT INTO paisPartidaJugador VALUES (90000, 91, 'LyraMusic',   'INVITADO');  
INSERT INTO paisPartidaJugador VALUES (90000, 92, 'DracoFire',   'INVITADO');  
INSERT INTO paisPartidaJugador VALUES (90000, 93, 'VegaNova',    'SE UNIO');   
INSERT INTO paisPartidaJugador VALUES (90000, 99, 'AlienInv',    'INVITADO');  
INSERT INTO paisPartidaJugador VALUES (90000, 94, 'TraderJoe',   'INVITADO'); -- Caso Borde Q8

-- Partida 91000 (Limpia)
INSERT INTO paisPartidaJugador VALUES (91000, 94, 'SiriusBlack', 'ANFITRION');
INSERT INTO paisPartidaJugador VALUES (91000, 95, 'AndromedaX',  'INVITADO');
INSERT INTO paisPartidaJugador VALUES (91000, 90, 'BobBuild',    'INVITADO'); -- Caso Borde Q8

-- Partida 92000 (Vieja)
INSERT INTO paisPartidaJugador VALUES (92000, 90, 'RetroGamer',  'INVITADO');

-- Partida 93000 (Pobre)
INSERT INTO paisPartidaJugador VALUES (93000, 94, 'LowBudget',   'ANFITRION');

-- =============================================================================
-- 6. INVENTARIOS
-- =============================================================================

-- ORION (Australia - 90000): Rico en todo.
INSERT INTO inventarioRecurso VALUES (90000, 90, 'OrionMaster', 9001, 1000);
INSERT INTO inventarioRecurso VALUES (90000, 90, 'OrionMaster', 9002, 1000);
INSERT INTO inventarioRecurso VALUES (90000, 90, 'OrionMaster', 9003, 1000);

-- LYRA (NZ - 90000): **GANADORA QUERY 7**. Stock Mínimo Absoluto.
INSERT INTO inventarioRecurso VALUES (90000, 91, 'LyraMusic',   9001, 10); -- Solo 10 unidades totales.

-- DRACO (Indonesia - 90000): Stock medio.
INSERT INTO inventarioRecurso VALUES (90000, 92, 'DracoFire',   9001, 500);
INSERT INTO inventarioRecurso VALUES (90000, 92, 'DracoFire',   9020, 500); -- PBN

-- VEGA (Filipinas - 90000): Stock alto.
INSERT INTO inventarioRecurso VALUES (90000, 93, 'VegaNova',    9003, 500);
INSERT INTO inventarioRecurso VALUES (90000, 93, 'VegaNova',    9001, 500);

-- ALIEN (Argentina - 90000): Stock medio. (Activa la Query 7).
INSERT INTO inventarioRecurso VALUES (90000, 99, 'AlienInv',    9001, 500);

-- TRADER JOE (Malasia - 90000): Recursos para fallar Q8 por trueque.
INSERT INTO inventarioRecurso VALUES (90000, 94, 'TraderJoe',   9001, 100);

-- SIRIUS & ANDROMEDA & BOB (Partida 91000)
INSERT INTO inventarioRecurso VALUES (91000, 94, 'SiriusBlack', 9001, 1000);
INSERT INTO inventarioRecurso VALUES (91000, 95, 'AndromedaX',  9011, 0);
INSERT INTO inventarioRecurso VALUES (91000, 90, 'BobBuild',    9002, 500);

-- LOW BUDGET (Partida 93000)
INSERT INTO inventarioRecurso VALUES (93000, 94, 'LowBudget',   9001, 100);
INSERT INTO inventarioRecurso VALUES (93000, 94, 'LowBudget',   9002, 100);
INSERT INTO inventarioRecurso VALUES (93000, 94, 'LowBudget',   9003, 100);

-- =============================================================================
-- 7. CONSTRUCCIONES
-- =============================================================================

-- QUERY 1: PUERTO XOR ASTILLERO
INSERT INTO construccion VALUES (90000, 90, 'OrionMaster', 9001, 1, 'PUERTO',    'CONSUME', 50); -- SI
INSERT INTO construccion VALUES (90000, 92, 'DracoFire',   9001, 2, 'PUERTO',    'CONSUME', 50); -- NO (Tiene ambos)
INSERT INTO construccion VALUES (90000, 92, 'DracoFire',   9001, 3, 'ASTILLERO', 'CONSUME', 50);
INSERT INTO construccion VALUES (91000, 94, 'SiriusBlack', 9001, 4, 'ASTILLERO', 'CONSUME', 50); -- SI
INSERT INTO construccion VALUES (91000, 94, 'SiriusBlack', 9001, 5, 'ASTILLERO', 'CONSUME', 50);

-- QUERY 5: CONSUMIR TODOS LOS RECURSOS DE CONSTRUCCION (Config > 1000)
-- Orion consume 9001 (arriba), 9002 y 9003. SI CUMPLE.
INSERT INTO construccion VALUES (90000, 90, 'OrionMaster', 9002, 5, 'USINAS', 'CONSUME', 50);
INSERT INTO construccion VALUES (90000, 90, 'OrionMaster', 9003, 6, 'USINAS', 'CONSUME', 50);

-- LowBudget consume todos, pero su partida (93000) tiene config 500. NO CUMPLE.
INSERT INTO construccion VALUES (93000, 94, 'LowBudget', 9001, 101, 'USINAS', 'CONSUME', 10);
INSERT INTO construccion VALUES (93000, 94, 'LowBudget', 9002, 102, 'USINAS', 'CONSUME', 10);
INSERT INTO construccion VALUES (93000, 94, 'LowBudget', 9003, 103, 'USINAS', 'CONSUME', 10);

-- QUERY 6: RECURSO MAS USADO (Sin Trueques)
-- Sirius (Partida 91000) usa Titanio (9001) masivamente.
INSERT INTO construccion VALUES (91000, 94, 'SiriusBlack', 9001, 10, 'USINAS', 'CONSUME', 100);
INSERT INTO construccion VALUES (91000, 94, 'SiriusBlack', 9001, 11, 'USINAS', 'CONSUME', 100);
INSERT INTO construccion VALUES (91000, 94, 'SiriusBlack', 9001, 12, 'USINAS', 'CONSUME', 100);

-- QUERY 8: AUTOSUFICIENTE (Sin Trueques)
-- Andromeda (91000): Produce Elec > Consume Elec. SI CUMPLE.
INSERT INTO construccion VALUES (91000, 95, 'AndromedaX', 9011, 20, 'USINAS', 'PRODUCE', 200);
INSERT INTO construccion VALUES (91000, 95, 'AndromedaX', 9011, 21, 'USINAS', 'CONSUME', 50);

-- TraderJoe (90000): Produce > Consume, pero hará trueque abajo. NO CUMPLE.
INSERT INTO construccion VALUES (90000, 94, 'TraderJoe', 9011, 30, 'USINAS', 'PRODUCE', 500);
INSERT INTO construccion VALUES (90000, 94, 'TraderJoe', 9011, 31, 'USINAS', 'CONSUME', 10);

-- BobBuild (91000): Produce > Consume, pero es ACERO (Cons). Query pide 'CONSUMO'. NO CUMPLE.
INSERT INTO construccion VALUES (91000, 90, 'BobBuild', 9002, 40, 'USINAS', 'PRODUCE', 500);
INSERT INTO construccion VALUES (91000, 90, 'BobBuild', 9002, 41, 'USINAS', 'CONSUME', 10);

-- =============================================================================
-- 8. TRUEQUES (Definen Q2, Q4, Q7 y eliminaciones de Q6/Q8)
-- =============================================================================

-- T1: PBN "Manchado" (Draco da Pesca). Elimina a Draco y Alien de Q2.
-- Habilita Q7 para partida 90000 (Alien=Argentina).
INSERT INTO trueque VALUES (901, 90000, 92, 'DracoFire', 9020, 90000, 99, 'AlienInv', 9001, 10, 10);

-- T2: Vega da 1 Hierro (A). Minimo Absoluto. Vega GANA Q4.
INSERT INTO trueque VALUES (902, 90000, 93, 'VegaNova', 9003, 90000, 91, 'LyraMusic', 9001, 1, 10);

-- T3: Orion da 100 Hierro (A). Pierde Q4 contra Vega.
INSERT INTO trueque VALUES (903, 90000, 90, 'OrionMaster', 9003, 90000, 91, 'LyraMusic', 9001, 100, 10);

-- T4: Caso Borde Q4. Andromeda da 1 Hierro pero como Jugador B. NO DEBE SALIR.
INSERT INTO trueque VALUES (904, 90000, 92, 'DracoFire', 9001, 90000, 91, 'AndromedaX', 9003, 50, 1);

-- T5: Caso Borde Q8. TraderJoe hace trueque, pierde autosuficiencia.
INSERT INTO trueque VALUES (905, 90000, 94, 'TraderJoe', 9001, 90000, 90, 'OrionMaster', 9001, 10, 10);