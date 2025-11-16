ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';

-- ! AGREGACIONES PARA CUMPLIR CON LA CONSULTA DEL EJERCICIO 1 Y BASE

-- === JUGADORES ===
INSERT INTO jugador VALUES ('ana',   'Ana',   'ana@x.com',   TO_DATE('10/01/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('beto',  'Beto',  'beto@x.com',  TO_DATE('11/02/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('cami',  'Cami',  'cami@x.com',  TO_DATE('12/03/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('dani',  'Dani',  'dani@x.com',  TO_DATE('13/04/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('emi',   'Emi',   'emi@x.com',   TO_DATE('14/04/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('fer',   'Fer',   'fer@x.com',   TO_DATE('15/04/2025','DD/MM/YYYY'));

-- === PAISES ===
INSERT INTO pais VALUES (10, 'Uruguay');
INSERT INTO pais VALUES (20, 'Brasil');
INSERT INTO pais VALUES (30, 'Argentina');
INSERT INTO pais VALUES (40, 'Chile');
INSERT INTO pais VALUES (50, 'Peru');
INSERT INTO pais VALUES (60, 'Paraguay');

-- === RECURSOS ===
-- CONSTRUCCION
INSERT INTO recurso VALUES (101, 'Hierro',   'CONSTRUCCION');
INSERT INTO recurso VALUES (102, 'Cemento',  'CONSTRUCCION');
INSERT INTO recurso VALUES (103, 'Aluminio', 'CONSTRUCCION');
INSERT INTO recurso VALUES (104, 'Plastico', 'CONSTRUCCION');
INSERT INTO recurso VALUES (105, 'Cobre',    'CONSTRUCCION');
INSERT INTO recurso VALUES (106, 'Carbono',  'CONSTRUCCION');

-- CONSUMO
INSERT INTO recurso VALUES (201, 'Petroleo', 'CONSUMO');
INSERT INTO recurso VALUES (202, 'Carbon',   'CONSUMO');
INSERT INTO recurso VALUES (203, 'Alimentos','CONSUMO');
INSERT INTO recurso VALUES (204, 'kW',       'CONSUMO');

-- PBN
INSERT INTO recurso VALUES (301, 'Agua',     'PBN');
INSERT INTO recurso VALUES (302, 'Medicinas','PBN');
INSERT INTO recurso VALUES (303, 'Ropa',     'PBN');

-- === PARTIDAS (fechas variadas 2025) ===
-- Para filtros "últimos 30 días" y "últimos 3 meses" ajusta si corrés esto más adelante.
INSERT INTO partida VALUES (1000, 10, TO_DATE('01/10/2025','DD/MM/YYYY'),  800);
INSERT INTO partida VALUES (1000, 20, TO_DATE('01/10/2025','DD/MM/YYYY'),  800);
INSERT INTO partida VALUES (1000, 30, TO_DATE('01/10/2025','DD/MM/YYYY'),  800);

INSERT INTO partida VALUES (2000, 10, TO_DATE('15/10/2025','DD/MM/YYYY'), 1200);
INSERT INTO partida VALUES (2000, 20, TO_DATE('15/10/2025','DD/MM/YYYY'), 1200);
INSERT INTO partida VALUES (2000, 30, TO_DATE('15/10/2025','DD/MM/YYYY'), 1200);

INSERT INTO partida VALUES (3000, 40, TO_DATE('25/09/2025','DD/MM/YYYY'), 1500);
INSERT INTO partida VALUES (3000, 50, TO_DATE('25/09/2025','DD/MM/YYYY'), 1500);

INSERT INTO partida VALUES (4000, 60, TO_DATE('01/07/2025','DD/MM/YYYY'), 2000); -- fuera de 3 meses
INSERT INTO partida VALUES (5000, 10, TO_DATE('05/11/2025','DD/MM/YYYY'),  950); -- dentro de 30 días
INSERT INTO partida VALUES (5000, 20, TO_DATE('05/11/2025','DD/MM/YYYY'),  950);

-- === PAIS-PARTIDA-JUGADOR (roles variados) ===
-- Partida 1000 (Uruguay, Brasil, Argentina)
INSERT INTO paisPartidaJugador VALUES (1000, 10, 'ana',  'ANFITRION');
INSERT INTO paisPartidaJugador VALUES (1000, 20, 'beto', 'INVITADO');
INSERT INTO paisPartidaJugador VALUES (1000, 30, 'cami', 'SE UNIO');

-- Partida 2000 (Uruguay, Brasil, Argentina) - alto consumo
INSERT INTO paisPartidaJugador VALUES (2000, 10, 'dani','INVITADO');
INSERT INTO paisPartidaJugador VALUES (2000, 20, 'emi', 'INVITADO');
INSERT INTO paisPartidaJugador VALUES (2000, 30, 'fer', 'INVITADO');

-- Partida 3000 (Chile, Peru)
INSERT INTO paisPartidaJugador VALUES (3000, 40, 'ana', 'ANFITRION');
INSERT INTO paisPartidaJugador VALUES (3000, 50, 'beto','SE UNIO');

-- Partida 4000 (Paraguay)
INSERT INTO paisPartidaJugador VALUES (4000, 60, 'cami','ANFITRION');

-- Partida 5000 (Uruguay, Brasil)
INSERT INTO paisPartidaJugador VALUES (5000, 10, 'ana', 'ANFITRION');
INSERT INTO paisPartidaJugador VALUES (5000, 20, 'beto','SE UNIO');

-- === INVENTARIOS (stock suficiente para construir/truequear) ===
-- Cargamos múltiples recursos por jugador/país/partida
-- Uruguay 1000,2000,5000 (ana/dani/ana)
INSERT INTO inventarioRecurso VALUES (1000,10,'ana',101,300);
INSERT INTO inventarioRecurso VALUES (1000,10,'ana',102,300);
INSERT INTO inventarioRecurso VALUES (1000,10,'ana',201,200);
INSERT INTO inventarioRecurso VALUES (1000,10,'ana',204,100);

INSERT INTO inventarioRecurso VALUES (2000,10,'dani',101,500);
INSERT INTO inventarioRecurso VALUES (2000,10,'dani',102,500);
INSERT INTO inventarioRecurso VALUES (2000,10,'dani',103,500);
INSERT INTO inventarioRecurso VALUES (2000,10,'dani',201,600);
INSERT INTO inventarioRecurso VALUES (2000,10,'dani',202,600);
INSERT INTO inventarioRecurso VALUES (2000,10,'dani',204,600);

INSERT INTO inventarioRecurso VALUES (5000,10,'ana',101,200);
INSERT INTO inventarioRecurso VALUES (5000,10,'ana',102,200);

-- Brasil 1000,2000,5000 (beto/emi/beto)
INSERT INTO inventarioRecurso VALUES (1000,20,'beto',101,300);
INSERT INTO inventarioRecurso VALUES (1000,20,'beto',102,300);
INSERT INTO inventarioRecurso VALUES (1000,20,'beto',201,150);

INSERT INTO inventarioRecurso VALUES (2000,20,'emi',101,400);
INSERT INTO inventarioRecurso VALUES (2000,20,'emi',104,400);
INSERT INTO inventarioRecurso VALUES (2000,20,'emi',203,300);
INSERT INTO inventarioRecurso VALUES (2000,20,'emi',204,300);

INSERT INTO inventarioRecurso VALUES (5000,20,'beto',103,200);
INSERT INTO inventarioRecurso VALUES (5000,20,'beto',104,200);

-- Argentina 1000,2000 (cami/fer)
INSERT INTO inventarioRecurso VALUES (1000,30,'cami',101,150);
INSERT INTO inventarioRecurso VALUES (1000,30,'cami',102,150);
INSERT INTO inventarioRecurso VALUES (2000,30,'fer', 201,200);
INSERT INTO inventarioRecurso VALUES (2000,30,'fer', 204,200);

-- Chile 3000 (ana)
INSERT INTO inventarioRecurso VALUES (3000,40,'ana',101,200);
INSERT INTO inventarioRecurso VALUES (3000,40,'ana',102,200);
INSERT INTO inventarioRecurso VALUES (3000,40,'ana',201,100);
INSERT INTO inventarioRecurso VALUES (3000,40,'ana',204,100);

-- Peru 3000 (beto)
INSERT INTO inventarioRecurso VALUES (3000,50,'beto',103,200);
INSERT INTO inventarioRecurso VALUES (3000,50,'beto',104,200);
INSERT INTO inventarioRecurso VALUES (3000,50,'beto',203,100);

-- Paraguay 4000 (cami)
INSERT INTO inventarioRecurso VALUES (4000,60,'cami',101,100);
INSERT INTO inventarioRecurso VALUES (4000,60,'cami',201,100);

-- Consulta 1 ______________________________________________________________

-- (1) Solo PUERTO → Uruguay en partida 1000 (recurso de CONSTRUCCION)
INSERT INTO construccion VALUES (1000,10,'ana',101,  1,'PUERTO','CONSUME',50);

-- (2) Solo ASTILLERO → Brasil en partida 1000 (recurso de CONSTRUCCION)
INSERT INTO construccion VALUES (1000,20,'beto',102, 2,'ASTILLERO','CONSUME',40);

-- (3) Ambos → Chile en partida 3000 (NO debe salir)
INSERT INTO construccion VALUES (3000,40,'ana',101, 3,'PUERTO','CONSUME',30);
INSERT INTO construccion VALUES (3000,40,'ana',102, 4,'ASTILLERO','CONSUME',20);

-- (4) PUERTO usando recurso de CONSUMO (NO computa por la consigna)
INSERT INTO inventarioRecurso VALUES (1000,30,'cami',201,100); -- asegura FK
INSERT INTO construccion VALUES (1000,30,'cami',201, 5,'PUERTO','CONSUME',10);

-- (5) Construcciones irrelevantes (no afectan XOR PUERTO/ASTILLERO)
INSERT INTO construccion VALUES (1000,10,'ana',103, 6,'PLANTACION','PRODUCE',15);
INSERT INTO construccion VALUES (2000,20,'emi',104, 7,'USINAS',    'PRODUCE',25);

-- Consulta 5 ______________________________________________________________

-- A) Uruguay (dani) en partida 2000 (configuracionConsumo=1200) consume TODOS (101..106) → SALE
INSERT INTO inventarioRecurso VALUES (2000,10,'dani',104,100);
INSERT INTO inventarioRecurso VALUES (2000,10,'dani',105,100);
INSERT INTO inventarioRecurso VALUES (2000,10,'dani',106,100);

INSERT INTO construccion VALUES (2000,10,'dani',101,11,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (2000,10,'dani',102,12,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (2000,10,'dani',103,13,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (2000,10,'dani',104,14,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (2000,10,'dani',105,15,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (2000,10,'dani',106,16,'USINAS','CONSUME',10);

-- B) Brasil (emi) en 2000 consume algunos, falta al menos uno → NO SALE
INSERT INTO construccion VALUES (2000,20,'emi',101,17,'USINAS','CONSUME',5);
INSERT INTO construccion VALUES (2000,20,'emi',102,18,'USINAS','CONSUME',5);
INSERT INTO construccion VALUES (2000,20,'emi',103,19,'USINAS','CONSUME',5);
-- falta 104/105/106

-- C) Argentina (fer) en 2000 produce todos (no consume) → NO cuenta
INSERT INTO inventarioRecurso VALUES (2000,30,'fer',101,50);
INSERT INTO inventarioRecurso VALUES (2000,30,'fer',102,50);
INSERT INTO inventarioRecurso VALUES (2000,30,'fer',103,50);
INSERT INTO inventarioRecurso VALUES (2000,30,'fer',104,50);
INSERT INTO inventarioRecurso VALUES (2000,30,'fer',105,50);
INSERT INTO inventarioRecurso VALUES (2000,30,'fer',106,50);

INSERT INTO construccion VALUES (2000,30,'fer',101,21,'USINAS','PRODUCE',7);
INSERT INTO construccion VALUES (2000,30,'fer',102,22,'USINAS','PRODUCE',7);
INSERT INTO construccion VALUES (2000,30,'fer',103,23,'USINAS','PRODUCE',7);
INSERT INTO construccion VALUES (2000,30,'fer',104,24,'USINAS','PRODUCE',7);
INSERT INTO construccion VALUES (2000,30,'fer',105,25,'USINAS','PRODUCE',7);
INSERT INTO construccion VALUES (2000,30,'fer',106,26,'USINAS','PRODUCE',7);

-- D) Uruguay (ana) en 5000 (configuracionConsumo=950) consume todos → NO SALE por umbral
INSERT INTO construccion VALUES (5000,10,'ana',101,31,'USINAS','CONSUME',4);
INSERT INTO construccion VALUES (5000,10,'ana',102,32,'USINAS','CONSUME',4);
INSERT INTO construccion VALUES (5000,10,'ana',103,33,'USINAS','CONSUME',4);
INSERT INTO construccion VALUES (5000,10,'ana',104,34,'USINAS','CONSUME',4);
INSERT INTO construccion VALUES (5000,10,'ana',105,35,'USINAS','CONSUME',4);
INSERT INTO construccion VALUES (5000,10,'ana',106,36,'USINAS','CONSUME',4);

-- Consulta 9 ______________________________________________________________

-- A) Uruguay (dani) en partida 2000 (configuracionConsumo=1200) consume TODOS (101..106) → SALE
INSERT INTO inventarioRecurso VALUES (2000,10,'dani',104,100);
INSERT INTO inventarioRecurso VALUES (2000,10,'dani',105,100);
INSERT INTO inventarioRecurso VALUES (2000,10,'dani',106,100);

INSERT INTO construccion VALUES (2000,10,'dani',101,11,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (2000,10,'dani',102,12,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (2000,10,'dani',103,13,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (2000,10,'dani',104,14,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (2000,10,'dani',105,15,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (2000,10,'dani',106,16,'USINAS','CONSUME',10);

-- B) Brasil (emi) en 2000 consume algunos, falta al menos uno → NO SALE
INSERT INTO construccion VALUES (2000,20,'emi',101,17,'USINAS','CONSUME',5);
INSERT INTO construccion VALUES (2000,20,'emi',102,18,'USINAS','CONSUME',5);
INSERT INTO construccion VALUES (2000,20,'emi',103,19,'USINAS','CONSUME',5);
-- falta 104/105/106

-- C) Argentina (fer) en 2000 produce todos (no consume) → NO cuenta
INSERT INTO inventarioRecurso VALUES (2000,30,'fer',101,50);
INSERT INTO inventarioRecurso VALUES (2000,30,'fer',102,50);
INSERT INTO inventarioRecurso VALUES (2000,30,'fer',103,50);
INSERT INTO inventarioRecurso VALUES (2000,30,'fer',104,50);
INSERT INTO inventarioRecurso VALUES (2000,30,'fer',105,50);
INSERT INTO inventarioRecurso VALUES (2000,30,'fer',106,50);

INSERT INTO construccion VALUES (2000,30,'fer',101,21,'USINAS','PRODUCE',7);
INSERT INTO construccion VALUES (2000,30,'fer',102,22,'USINAS','PRODUCE',7);
INSERT INTO construccion VALUES (2000,30,'fer',103,23,'USINAS','PRODUCE',7);
INSERT INTO construccion VALUES (2000,30,'fer',104,24,'USINAS','PRODUCE',7);
INSERT INTO construccion VALUES (2000,30,'fer',105,25,'USINAS','PRODUCE',7);
INSERT INTO construccion VALUES (2000,30,'fer',106,26,'USINAS','PRODUCE',7);

-- D) Uruguay (ana) en 5000 (configuracionConsumo=950) consume todos → NO SALE por umbral
INSERT INTO construccion VALUES (5000,10,'ana',101,31,'USINAS','CONSUME',4);
INSERT INTO construccion VALUES (5000,10,'ana',102,32,'USINAS','CONSUME',4);
INSERT INTO construccion VALUES (5000,10,'ana',103,33,'USINAS','CONSUME',4);
INSERT INTO construccion VALUES (5000,10,'ana',104,34,'USINAS','CONSUME',4);
INSERT INTO construccion VALUES (5000,10,'ana',105,35,'USINAS','CONSUME',4);
INSERT INTO construccion VALUES (5000,10,'ana',106,36,'USINAS','CONSUME',4);

-- Trueques en distintas partidas (mismo año 2025)
-- lado B: alias que sea "SE UNIO" en esa partida para medir su cantidad

-- En 1000: cami es SE UNIO por Argentina (idPais=30).
INSERT INTO inventarioRecurso VALUES (1000,30,'cami',201,50);
INSERT INTO inventarioRecurso VALUES (1000,20,'beto',201,50);
INSERT INTO trueque VALUES (
  900001,              -- idTrueque
  1000,20,'beto',201,  -- A: Brasil-beto-Petroleo
  1000,30,'cami',201,  -- B: Argentina-cami-Petroleo
  10, 12               -- cantidades
);

-- Otro trueque donde B vuelve a ser cami (suma 2)
INSERT INTO inventarioRecurso VALUES (1000,30,'cami',203,40);
INSERT INTO inventarioRecurso VALUES (1000,10,'ana',203,40);
INSERT INTO trueque VALUES (
  900002,
  1000,10,'ana',203,
  1000,30,'cami',203,
  5, 7
);

-- En 2000: fer es INVITADO, no SE UNIO (su métrica de trueques B no aplica)
INSERT INTO inventarioRecurso VALUES (2000,30,'fer',201,20);
INSERT INTO inventarioRecurso VALUES (2000,20,'emi',201,20);
INSERT INTO trueque VALUES (
  900003,
  2000,20,'emi',201,
  2000,30,'fer',201,
  3, 4
);

-- En 5000: beto es SE UNIO (lado B una vez)
INSERT INTO inventarioRecurso VALUES (5000,20,'beto',101,50);
INSERT INTO inventarioRecurso VALUES (5000,10,'ana',101,50);
INSERT INTO trueque VALUES (
  900004,
  5000,10,'ana',101,
  5000,20,'beto',101,
  2, 1
);

-- ! AGREGACIONES PARA CUMPLIR CON LA CONSULTA DEL EJERCICIO 2

INSERT INTO jugador VALUES ('ana', 'Ana Torres', 'ana@email.com', TO_DATE('01/11/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('beto', 'Beto Silva', 'beto@email.com', TO_DATE('02/11/2025','DD/MM/YYYY'));

INSERT INTO pais VALUES (10, 'Chile');
INSERT INTO pais VALUES (20, 'Perú');

INSERT INTO partida VALUES (5000, 10, TO_DATE('03/11/2025','DD/MM/YYYY'), 50);
INSERT INTO partida VALUES (5000, 20, TO_DATE('03/11/2025','DD/MM/YYYY'), 50);

INSERT INTO paisPartidaJugador VALUES (5000, 10, 'ana', 'ANFITRION');
INSERT INTO paisPartidaJugador VALUES (5000, 20, 'beto', 'INVITADO');


INSERT INTO recurso VALUES (101, 'Madera', 'CONSTRUCCION');
INSERT INTO recurso VALUES (301, 'Comida', 'CONSUMO');


INSERT INTO inventarioRecurso VALUES (5000, 10, 'ana', 101, 100);
INSERT INTO inventarioRecurso VALUES (5000, 20, 'beto', 301, 50);


INSERT INTO TRUEQUE VALUES (900005, 5000, 10, 'ana', 101, 5000, 20, 'beto', 301, 2, 1);

-- ! AGREGACIONES PARA CUMPLIR CON LA CONSULTA DEL EJERCICIO 3
INSERT INTO PAISPARTIDAJUGADOR VALUES (3000, 40, 'emi', 'INVITADO');

-- ! AGREGACION DE CASOS PARA COMPROBAR EJ 6
-- Partida reciente SIN trueques (debe contar)
INSERT INTO partida VALUES (6000, 10, TO_DATE('10/11/2025','DD/MM/YYYY'), 1000);
INSERT INTO paisPartidaJugador VALUES (6000, 10, 'ana', 'ANFITRION');
INSERT INTO inventarioRecurso VALUES (6000, 10, 'ana',101,500);
INSERT INTO inventarioRecurso VALUES (6000, 10, 'ana',102,500);
INSERT INTO inventarioRecurso VALUES (6000, 10, 'ana',103,500);
-- Construcciones (Hierro usado 3 veces, Cemento 1 vez)
INSERT INTO construccion VALUES (6000,10,'ana',101,100,'PUERTO','CONSUME',50);
INSERT INTO construccion VALUES (6000,10,'ana',101,101,'ASTILLERO','CONSUME',30);
INSERT INTO construccion VALUES (6000,10,'ana',101,102,'PLANTACION','CONSUME',20);
INSERT INTO construccion VALUES (6000,10,'ana',102,103,'PUERTO','CONSUME',10);

-- Partida reciente CON trueque (NO debe contar)
INSERT INTO partida VALUES (7000, 20, TO_DATE('12/11/2025','DD/MM/YYYY'), 900);
INSERT INTO paisPartidaJugador VALUES (7000, 20, 'beto', 'ANFITRION');
INSERT INTO inventarioRecurso VALUES (7000, 20, 'beto',101,200);
INSERT INTO inventarioRecurso VALUES (7000, 20, 'beto',102,200);
INSERT INTO construccion VALUES (7000,20,'beto',101,200,'PUERTO','CONSUME',10);
INSERT INTO trueque VALUES (910000,7000,20,'beto',101,7000,20,'beto',102,1,1);

--* Output esperado:
--* Nombre   | TipoRecurso
--* Hierro   | CONSTRUCCION

-- ! AGREGACION DE CASOS PARA COMPROBAR EJ 7
-- Partida con trueque y Uruguay/Brasil
INSERT INTO partida VALUES (8000,10,TO_DATE('08/11/2025','DD/MM/YYYY'),500);
INSERT INTO partida VALUES (8000,20,TO_DATE('08/11/2025','DD/MM/YYYY'),500);
INSERT INTO partida VALUES (8000,30,TO_DATE('08/11/2025','DD/MM/YYYY'),500);
INSERT INTO paisPartidaJugador VALUES (8000,10,'ana','ANFITRION');
INSERT INTO paisPartidaJugador VALUES (8000,20,'beto','INVITADO');
INSERT INTO paisPartidaJugador VALUES (8000,30,'cami','SE UNIO');
-- Inventarios con distintos stocks de CONSTRUCCION
INSERT INTO inventarioRecurso VALUES (8000,10,'ana',101,300); -- Uruguay
INSERT INTO inventarioRecurso VALUES (8000,20,'beto',101,100); -- Brasil
INSERT INTO inventarioRecurso VALUES (8000,30,'cami',101,200); -- Argentina
-- Trueque que involucra Uruguay
INSERT INTO trueque VALUES (920000,8000,10,'ana',101,8000,20,'beto',101,5,5);


--* Output esperado:
--* Partida | Pais
--* 8000    | Brasil


-- ! AGREGACION DE CASOS PARA COMPROBAR EJ 8
-- Partida sin trueques
INSERT INTO partida VALUES (9000,40,TO_DATE('09/11/2025','DD/MM/YYYY'),700);
INSERT INTO paisPartidaJugador VALUES (9000,40,'ana','ANFITRION');
INSERT INTO inventarioRecurso VALUES (9000,40,'ana',201,500); -- Petroleo (CONSUMO)
INSERT INTO inventarioRecurso VALUES (9000,40,'ana',202,500); -- Carbon (CONSUMO)
-- Construcciones: produce 300, consume 100
INSERT INTO construccion VALUES (9000,40,'ana',201,300,'USINAS','PRODUCE',200);
INSERT INTO construccion VALUES (9000,40,'ana',202,301,'USINAS','PRODUCE',100);
INSERT INTO construccion VALUES (9000,40,'ana',201,302,'PUERTO','CONSUME',50);
INSERT INTO construccion VALUES (9000,40,'ana',202,303,'PUERTO','CONSUME',50);

-- Otro país en misma partida que consume más
INSERT INTO partida VALUES (9000,50,TO_DATE('09/11/2025','DD/MM/YYYY'),700);
INSERT INTO paisPartidaJugador VALUES (9000,50,'beto','INVITADO');
INSERT INTO inventarioRecurso VALUES (9000,50,'beto',201,500);
INSERT INTO construccion VALUES (9000,50,'beto',201,304,'PUERTO','CONSUME',200);
INSERT INTO construccion VALUES (9000,50,'beto',201,305,'USINAS','PRODUCE',100);

--* Output esperado:
--* Pais   | Partida
--* Chile  | 9000

-- ! OUTPUT ESPERADO PARA EL EJERCICIO 10 (NO AGREGUE NADA PORQUE LAS ANTERIORES CUBREN TODO) 
-- ? OUTPUT ESPERADO GENERADO CON IA
IDRECURSO | NOMBRE       | PARTIDAS_USADAS | CONSTRUCCIONES_USADAS | PAIS_MAS_USOS | PAIS_MENOS_USOS
-----------------------------------------------------------------------------------------------------
101       | Hierro       | 5               | 448                   | Brasil        | Chile
102       | Cemento      | 5               | 256                   | Brasil        | Chile
103       | Aluminio     | 5               | 64                    | Uruguay       | Chile
104       | Plastico     | 5               | 96                    | Brasil        | Chile
105       | Cobre        | 5               | 64                    | Argentina     | Argentina
106       | Carbono      | 5               | 64                    | Argentina     | Argentina
201       | Petroleo     | 5               | 128                   | Argentina     | Paraguay
202       | Carbon       | 5               | 64                    | Argentina     | Argentina
203       | Alimentos    | 5               | 0                     | Argentina     | Chile
204       | kW           | 5               | 0                     | Argentina     | Chile
301       | Agua         | 5               | 0                     | Brasil        | Brasil
302       | Medicinas    | 5               | 0                     | (NULL)        | (NULL)
303       | Ropa         | 5               | 0                     | (NULL)        | (NULL)
