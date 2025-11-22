

-- =========================
-- 00) PAISES (IDs 101..116)
-- =========================
INSERT INTO pais VALUES (101,'Argentina');
INSERT INTO pais VALUES (102,'Uruguay');
INSERT INTO pais VALUES (103,'Brasil');
INSERT INTO pais VALUES (104,'Chile');
INSERT INTO pais VALUES (105,'Perú');
INSERT INTO pais VALUES (106,'Colombia');
INSERT INTO pais VALUES (107,'México');
INSERT INTO pais VALUES (108,'Paraguay');
INSERT INTO pais VALUES (109,'Bolivia');
INSERT INTO pais VALUES (110,'Ecuador');
INSERT INTO pais VALUES (111,'Venezuela');
INSERT INTO pais VALUES (112,'Costa Rica');
INSERT INTO pais VALUES (113,'Panamá');
INSERT INTO pais VALUES (114,'Cuba');
INSERT INTO pais VALUES (115,'República Dominicana');
INSERT INTO pais VALUES (116,'Guatemala');

-- =========================
-- 01) JUGADORES
-- =========================
INSERT INTO jugador VALUES ('ArgPlayer','Carlos','arg@latam.com',TO_DATE('10/01/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('UruPlayer','Sofía','uru@latam.com',TO_DATE('11/01/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('BraPlayer','João','bra@latam.com',TO_DATE('12/01/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('ChiPlayer','Martín','chi@latam.com',TO_DATE('13/01/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('PerPlayer','Lucía','per@latam.com',TO_DATE('14/01/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('ColPlayer','Andrés','col@latam.com',TO_DATE('15/01/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('MexPlayer','Diego','mex@latam.com',TO_DATE('16/01/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('ParPlayer','Ana','par@latam.com',TO_DATE('17/01/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('BolPlayer','María','bol@latam.com',TO_DATE('18/01/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('EcuPlayer','Jorge','ecu@latam.com',TO_DATE('19/01/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('VenPlayer','Luis','ven@latam.com',TO_DATE('20/01/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('CRPlayer','Paula','cr@latam.com',TO_DATE('21/01/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('PaPlayer','Ricardo','pa@latam.com',TO_DATE('22/01/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('CubPlayer','Ernesto','cub@latam.com',TO_DATE('23/01/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('DoPlayer','Marta','do@latam.com',TO_DATE('24/01/2025','DD/MM/YYYY'));
INSERT INTO jugador VALUES ('GuaPlayer','Hugo','gua@latam.com',TO_DATE('25/01/2025','DD/MM/YYYY'));

-- =========================
-- 02) RECURSOS 
-- =========================
-- PBN
INSERT INTO recurso VALUES (7001,'Agua Potable','PBN');
INSERT INTO recurso VALUES (7002,'Medicinas','PBN');
INSERT INTO recurso VALUES (7003,'Ropa','PBN');
-- CONSTRUCCION
INSERT INTO recurso VALUES (5101,'Hierro','CONSTRUCCION');
INSERT INTO recurso VALUES (5102,'Cemento','CONSTRUCCION');
INSERT INTO recurso VALUES (5103,'Aluminio','CONSTRUCCION');
INSERT INTO recurso VALUES (5104,'Plástico','CONSTRUCCION');
INSERT INTO recurso VALUES (5105,'Cobre','CONSTRUCCION');
INSERT INTO recurso VALUES (5106,'Carbono','CONSTRUCCION');
-- CONSUMO
INSERT INTO recurso VALUES (6001,'Petróleo','CONSUMO');
INSERT INTO recurso VALUES (6002,'Carbón','CONSUMO');
INSERT INTO recurso VALUES (6003,'Alimentos','CONSUMO');
INSERT INTO recurso VALUES (6004,'Energía Eléctrica','CONSUMO');

-- =========================
-- 03) PARTIDAS
-- =========================
INSERT INTO partida VALUES (20001,102,TO_DATE('24/11/2025','DD/MM/YYYY'),5000);
INSERT INTO partida VALUES (20001,101,TO_DATE('24/11/2025','DD/MM/YYYY'),5000);
INSERT INTO partida VALUES (20001,103,TO_DATE('24/11/2025','DD/MM/YYYY'),5000);
INSERT INTO partida VALUES (20001,104,TO_DATE('24/11/2025','DD/MM/YYYY'),5000);
INSERT INTO partida VALUES (20002,105,TO_DATE('19/11/2025','DD/MM/YYYY'),1800);
INSERT INTO partida VALUES (20002,106,TO_DATE('19/11/2025','DD/MM/YYYY'),1800);
INSERT INTO partida VALUES (20003,107,TO_DATE('05/10/2025','DD/MM/YYYY'),1500);
INSERT INTO partida VALUES (20003,108,TO_DATE('05/10/2025','DD/MM/YYYY'),1500);
INSERT INTO partida VALUES (20003,109,TO_DATE('05/10/2025','DD/MM/YYYY'),1500);
INSERT INTO partida VALUES (20003,110,TO_DATE('05/10/2025','DD/MM/YYYY'),1500);
INSERT INTO partida VALUES (20004,111,TO_DATE('14/11/2025','DD/MM/YYYY'),2200);
INSERT INTO partida VALUES (20004,112,TO_DATE('14/11/2025','DD/MM/YYYY'),2200);
INSERT INTO partida VALUES (20004,113,TO_DATE('14/11/2025','DD/MM/YYYY'),2200);
INSERT INTO partida VALUES (20005,114,TO_DATE('22/11/2025','DD/MM/YYYY'),3000);
INSERT INTO partida VALUES (20005,115,TO_DATE('22/11/2025','DD/MM/YYYY'),3000);
INSERT INTO partida VALUES (20005,116,TO_DATE('22/11/2025','DD/MM/YYYY'),3000);
INSERT INTO partida VALUES (20006,101,TO_DATE('16/11/2025','DD/MM/YYYY'),2000);
INSERT INTO partida VALUES (20006,108,TO_DATE('16/11/2025','DD/MM/YYYY'),2000);
INSERT INTO partida VALUES (20007,111,TO_DATE('09/11/2025','DD/MM/YYYY'),900);

-- =========================
-- 04) PPJ (roles)
-- =========================
INSERT INTO paisPartidaJugador VALUES (20001,102,'UruPlayer','ANFITRION');
INSERT INTO paisPartidaJugador VALUES (20001,101,'ArgPlayer','INVITADO');
INSERT INTO paisPartidaJugador VALUES (20001,103,'BraPlayer','INVITADO');
INSERT INTO paisPartidaJugador VALUES (20001,104,'ChiPlayer','SE UNIO');
INSERT INTO paisPartidaJugador VALUES (20002,105,'PerPlayer','ANFITRION');
INSERT INTO paisPartidaJugador VALUES (20002,106,'ColPlayer','INVITADO');
INSERT INTO paisPartidaJugador VALUES (20003,107,'MexPlayer','ANFITRION');
INSERT INTO paisPartidaJugador VALUES (20003,108,'ParPlayer','INVITADO');
INSERT INTO paisPartidaJugador VALUES (20003,109,'BolPlayer','INVITADO');
INSERT INTO paisPartidaJugador VALUES (20003,110,'EcuPlayer','SE UNIO');
INSERT INTO paisPartidaJugador VALUES (20004,111,'VenPlayer','ANFITRION');
INSERT INTO paisPartidaJugador VALUES (20004,112,'CRPlayer','INVITADO');
INSERT INTO paisPartidaJugador VALUES (20004,113,'PaPlayer','SE UNIO');
INSERT INTO paisPartidaJugador VALUES (20005,114,'CubPlayer','ANFITRION');
INSERT INTO paisPartidaJugador VALUES (20005,115,'DoPlayer','INVITADO');
INSERT INTO paisPartidaJugador VALUES (20005,116,'GuaPlayer','SE UNIO');
INSERT INTO paisPartidaJugador VALUES (20006,101,'ArgPlayer','ANFITRION');
INSERT INTO paisPartidaJugador VALUES (20006,108,'ParPlayer','INVITADO');
INSERT INTO paisPartidaJugador VALUES (20007,111,'VenPlayer','ANFITRION');

-- =========================
-- 05) INVENTARIOS
-- =========================
INSERT INTO inventarioRecurso VALUES (20001,102,'UruPlayer',5101,100);
INSERT INTO inventarioRecurso VALUES (20001,102,'UruPlayer',5102,100);
INSERT INTO inventarioRecurso VALUES (20001,102,'UruPlayer',5103,100);
INSERT INTO inventarioRecurso VALUES (20001,102,'UruPlayer',5104,100);
INSERT INTO inventarioRecurso VALUES (20001,102,'UruPlayer',5105,100);
INSERT INTO inventarioRecurso VALUES (20001,102,'UruPlayer',5106,100);
INSERT INTO inventarioRecurso VALUES (20001,102,'UruPlayer',6004,100);
INSERT INTO inventarioRecurso VALUES (20001,101,'ArgPlayer',5101,100);
INSERT INTO inventarioRecurso VALUES (20001,101,'ArgPlayer',5102,100);
INSERT INTO inventarioRecurso VALUES (20001,101,'ArgPlayer',5103,100);
INSERT INTO inventarioRecurso VALUES (20001,101,'ArgPlayer',6001,100);
INSERT INTO inventarioRecurso VALUES (20001,101,'ArgPlayer',7001,100);
INSERT INTO inventarioRecurso VALUES (20001,101,'ArgPlayer',7003,50);
INSERT INTO inventarioRecurso VALUES (20001,103,'BraPlayer',5101,100);
INSERT INTO inventarioRecurso VALUES (20001,103,'BraPlayer',5104,100);
INSERT INTO inventarioRecurso VALUES (20001,103,'BraPlayer',6003,100);
INSERT INTO inventarioRecurso VALUES (20001,103,'BraPlayer',7002,100);
INSERT INTO inventarioRecurso VALUES (20001,104,'ChiPlayer',5102,100);
INSERT INTO inventarioRecurso VALUES (20001,104,'ChiPlayer',5101,50);
INSERT INTO inventarioRecurso VALUES (20001,104,'ChiPlayer',5104,50);
INSERT INTO inventarioRecurso VALUES (20002,105,'PerPlayer',5102,200);
INSERT INTO inventarioRecurso VALUES (20002,105,'PerPlayer',5103,100);
INSERT INTO inventarioRecurso VALUES (20002,105,'PerPlayer',5104,50);
INSERT INTO inventarioRecurso VALUES (20002,105,'PerPlayer',6004,0);
INSERT INTO inventarioRecurso VALUES (20002,106,'ColPlayer',5102,150);
INSERT INTO inventarioRecurso VALUES (20002,106,'ColPlayer',5103,60);
INSERT INTO inventarioRecurso VALUES (20002,106,'ColPlayer',6004,0);
INSERT INTO inventarioRecurso VALUES (20003,107,'MexPlayer',5102,100);
INSERT INTO inventarioRecurso VALUES (20003,107,'MexPlayer',5104,100);
INSERT INTO inventarioRecurso VALUES (20003,107,'MexPlayer',7001,50);
INSERT INTO inventarioRecurso VALUES (20003,107,'MexPlayer',6001,50);
INSERT INTO inventarioRecurso VALUES (20003,108,'ParPlayer',5103,100);
INSERT INTO inventarioRecurso VALUES (20003,109,'BolPlayer',5101,100);
INSERT INTO inventarioRecurso VALUES (20003,109,'BolPlayer',5103,100);
INSERT INTO inventarioRecurso VALUES (20003,110,'EcuPlayer',6004,50);
INSERT INTO inventarioRecurso VALUES (20004,111,'VenPlayer',5104,80);
INSERT INTO inventarioRecurso VALUES (20004,111,'VenPlayer',5105,80);
INSERT INTO inventarioRecurso VALUES (20004,111,'VenPlayer',6001,50);
INSERT INTO inventarioRecurso VALUES (20004,112,'CRPlayer',5104,60);
INSERT INTO inventarioRecurso VALUES (20004,112,'CRPlayer',6001,40);
INSERT INTO inventarioRecurso VALUES (20004,113,'PaPlayer',5105,40);
INSERT INTO inventarioRecurso VALUES (20005,114,'CubPlayer',5104,90);
INSERT INTO inventarioRecurso VALUES (20005,114,'CubPlayer',6001,90);
INSERT INTO inventarioRecurso VALUES (20005,115,'DoPlayer',5104,40);
INSERT INTO inventarioRecurso VALUES (20005,115,'DoPlayer',5105,30);
INSERT INTO inventarioRecurso VALUES (20005,116,'GuaPlayer',5105,50);
INSERT INTO inventarioRecurso VALUES (20006,101,'ArgPlayer',5103,100);
INSERT INTO inventarioRecurso VALUES (20006,101,'ArgPlayer',5102,100);
INSERT INTO inventarioRecurso VALUES (20006,108,'ParPlayer',5102,80);
INSERT INTO inventarioRecurso VALUES (20006,108,'ParPlayer',5104,50);
INSERT INTO inventarioRecurso VALUES (20007,111,'VenPlayer',5101,100);
INSERT INTO inventarioRecurso VALUES (20007,111,'VenPlayer',5102,100);
INSERT INTO inventarioRecurso VALUES (20007,111,'VenPlayer',5103,100);
INSERT INTO inventarioRecurso VALUES (20007,111,'VenPlayer',5104,100);
INSERT INTO inventarioRecurso VALUES (20007,111,'VenPlayer',5105,100);
INSERT INTO inventarioRecurso VALUES (20007,111,'VenPlayer',5106,100);

-- =========================
-- 06) CONSTRUCCIONES
-- =========================
-- EJ1: PUERTO OR ASTILLERO PERO NO AMBOS
INSERT INTO construccion VALUES (20003,107,'MexPlayer',5102,1001,'PUERTO','CONSUME',10);
INSERT INTO construccion VALUES (20003,107,'MexPlayer',5104,1002,'PUERTO','CONSUME',8);
INSERT INTO construccion VALUES (20003,108,'ParPlayer',5103,1003,'ASTILLERO','CONSUME',12);
INSERT INTO construccion VALUES (20003,109,'BolPlayer',5101,1004,'PUERTO','CONSUME',6);
INSERT INTO construccion VALUES (20003,109,'BolPlayer',5103,1005,'ASTILLERO','CONSUME',5);
INSERT INTO construccion VALUES (20003,110,'EcuPlayer',6004,1006,'PUERTO','CONSUME',4);

-- mexico y paraguay tienen o puerto o astillero, pero no ambos mientras que brasil tiene ambos
-- output esperado:
-- México	107
-- Paraguay	108

-- EJ5: UN PAIS QUE CONSUME TODOS LOS RECURSOS DE CONSTRUCCION (5101..5106) CUMPLIENDO CONSUMO Y SIN CUMPLIR CONSUMO > 1000
INSERT INTO construccion VALUES (20001,102,'UruPlayer',5101,2001,'USINAS','CONSUME',20);
INSERT INTO construccion VALUES (20001,102,'UruPlayer',5102,2002,'USINAS','CONSUME',20);
INSERT INTO construccion VALUES (20001,102,'UruPlayer',5103,2003,'USINAS','CONSUME',20);
INSERT INTO construccion VALUES (20001,102,'UruPlayer',5104,2004,'USINAS','CONSUME',20);
INSERT INTO construccion VALUES (20001,102,'UruPlayer',5105,2005,'USINAS','CONSUME',20);
INSERT INTO construccion VALUES (20001,102,'UruPlayer',5106,2006,'USINAS','CONSUME',20);
INSERT INTO construccion VALUES (20001,101,'ArgPlayer',5101,2011,'USINAS','CONSUME',15);
INSERT INTO construccion VALUES (20001,101,'ArgPlayer',5102,2012,'USINAS','CONSUME',15);
INSERT INTO construccion VALUES (20001,101,'ArgPlayer',5103,2013,'USINAS','CONSUME',15);
INSERT INTO construccion VALUES (20001,101,'ArgPlayer',5104,2014,'USINAS','CONSUME',15);
INSERT INTO construccion VALUES (20007,111,'VenPlayer',5101,2021,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (20007,111,'VenPlayer',5102,2022,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (20007,111,'VenPlayer',5103,2023,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (20007,111,'VenPlayer',5104,2024,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (20007,111,'VenPlayer',5105,2025,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (20007,111,'VenPlayer',5106,2026,'USINAS','CONSUME',10);

-- uruguay cumple consumo > 1000 y aargentina y venezuela no , pero consumen todos los recursos de construccion 
-- output esperado:
-- Uruplayer Sofia

-- EJ6: más usado sin trueques (Cemento)
INSERT INTO construccion VALUES (20002,105,'PerPlayer',5102,3001,'USINAS','CONSUME',25);
INSERT INTO construccion VALUES (20002,105,'PerPlayer',5102,3002,'USINAS','CONSUME',25);
INSERT INTO construccion VALUES (20002,105,'PerPlayer',5102,3003,'USINAS','CONSUME',25);
INSERT INTO construccion VALUES (20002,105,'PerPlayer',5103,3004,'USINAS','CONSUME',15);
INSERT INTO construccion VALUES (20002,105,'PerPlayer',5104,3005,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (20002,106,'ColPlayer',5102,3011,'USINAS','CONSUME',20);
INSERT INTO construccion VALUES (20002,106,'ColPlayer',5102,3012,'USINAS','CONSUME',20);
INSERT INTO construccion VALUES (20002,106,'ColPlayer',5103,3013,'USINAS','CONSUME',12);

-- EJ8: autosuficiencia (kW)
INSERT INTO construccion VALUES (20002,105,'PerPlayer',6004,4001,'USINAS','PRODUCE',300);
INSERT INTO construccion VALUES (20002,105,'PerPlayer',6004,4002,'USINAS','CONSUME',50);
INSERT INTO construccion VALUES (20002,106,'ColPlayer',6004,4011,'USINAS','PRODUCE',100);
INSERT INTO construccion VALUES (20002,106,'ColPlayer',6004,4012,'USINAS','CONSUME',120);

-- EJ9: métricas de rol
INSERT INTO construccion VALUES (20001,102,'UruPlayer',5102,5001,'PUERTO','CONSUME',5);
INSERT INTO construccion VALUES (20001,102,'UruPlayer',5102,5002,'ASTILLERO','CONSUME',5);
INSERT INTO construccion VALUES (20001,101,'ArgPlayer',5103,5011,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (20001,101,'ArgPlayer',5102,5012,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (20001,101,'ArgPlayer',5104,5013,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (20001,103,'BraPlayer',5104,5021,'USINAS','CONSUME',12);
INSERT INTO construccion VALUES (20001,103,'BraPlayer',5101,5022,'PUERTO','CONSUME',6);
INSERT INTO construccion VALUES (20001,104,'ChiPlayer',5102,5031,'USINAS','CONSUME',8);
INSERT INTO construccion VALUES (20004,111,'VenPlayer',5104,5101,'USINAS','CONSUME',9);
INSERT INTO construccion VALUES (20004,112,'CRPlayer',5104,5102,'PUERTO','CONSUME',7);

-- Verificamos cada caso dependiendo del rol  con y sin construcciones, truques donde solo participa como B , solo A o ambos y por ultimo stock acumulado de los recuros, con y sin recursos.
 

-- EJ10: últimos 15 días
INSERT INTO construccion VALUES (20001,102,'UruPlayer',5104,6001,'USINAS','CONSUME',7);
INSERT INTO construccion VALUES (20001,104,'ChiPlayer',5104,6002,'USINAS','CONSUME',7);
INSERT INTO construccion VALUES (20005,116,'GuaPlayer',5105,6011,'USINAS','CONSUME',5);
INSERT INTO construccion VALUES (20001,101,'ArgPlayer',6001,6021,'USINAS','CONSUME',11);
INSERT INTO construccion VALUES (20001,103,'BraPlayer',6001,6022,'USINAS','CONSUME',11);
INSERT INTO construccion VALUES (20002,105,'PerPlayer',5102,6031,'USINAS','CONSUME',10);
INSERT INTO construccion VALUES (20002,106,'ColPlayer',5102,6032,'USINAS','CONSUME',10);

-- =========================
-- 07) TRUEQUES
-- =========================
INSERT INTO trueque VALUES (10001,20001,101,'ArgPlayer',7001, 20001,103,'BraPlayer',7002, 10, 10);
INSERT INTO trueque VALUES (10002,20001,103,'BraPlayer',7002, 20001,102,'UruPlayer',5102, 5,  5);
INSERT INTO trueque VALUES (10008,20003,107,'MexPlayer',7001, 20003,108,'ParPlayer',5103, 3,  6);
INSERT INTO trueque VALUES (10003,20001,102,'UruPlayer',5101, 20001,101,'ArgPlayer',5102, 1, 10);
INSERT INTO trueque VALUES (10004,20001,103,'BraPlayer',5101, 20001,104,'ChiPlayer',5102, 2, 10);
INSERT INTO trueque VALUES (10005,20001,101,'ArgPlayer',5101, 20001,103,'BraPlayer',5104, 1,  5);
INSERT INTO trueque VALUES (10006,20001,102,'UruPlayer',5102, 20001,104,'ChiPlayer',5101, 7,  7);
INSERT INTO trueque VALUES (10007,20006,101,'ArgPlayer',5103, 20006,108,'ParPlayer',5102, 15, 10);

-- =============================================================
-- FIN
-- =============================================================
