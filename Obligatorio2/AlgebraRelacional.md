
# Ejercicio 1
$$
RecId \leftarrow \Pi_{IdRecurso}\;\big(\sigma_{TipoRecurso ='Construccion'}(Recurso)​\big) \\
ConsId \leftarrow \Pi_{IdPais,TipoConstruccion}\;\big(Construccion \bowtie RecID​\big) \\
PaisId \leftarrow \Pi_{IdPais}\;\big(\sigma_{TipoConstruccion = 'Puerto'}(ConsId)​\big) \\
PaisId2 \leftarrow \Pi_{IdPais}\;\big(\sigma_{TipoConstruccion = 'Astillero'}(consId)​\big) \\
Puertos \leftarrow \Pi*(PaisId) - \Pi*(PaisId2) \\
Astilleros \leftarrow \Pi*(PaisId2) - \Pi*(PaisId) \\
\Pi*\;\big(Pais \bowtie (Puertos \cup Astilleros)​\big) \\
$$
# Ejercicio 2
$$
RecPBN \leftarrow \Pi_{IdRecurso}(\sigma_{TipoRecurso = 'PBN'}(Recurso)) \\
ConsId1 \leftarrow \Pi_{JugadorA}\;\big(\;(Trueque \bowtie_{Trueque.IdRecursoA = RecPBN.IdRecurso} RecPBN​)\big) \\
ConsId2 \leftarrow \Pi_{JugadorB}\;\big(\;(Trueque \bowtie_{Trueque.IdRecursoB = RecPBN.IdRecurso} RecPBN​)\big) \\
TruDatos \leftarrow \Pi_{IdPartidaA,IdPaisA,JugadorA,IdPaisB,JugadorB}\;\big(\;Truque - (ConsId1 \cup ConsId2)\big) \\
NomPaisA \leftarrow (IdPartida, NombrePais, IdJugador)\Big( \Pi_{IdPartidaA,IdPaisA,JugadorA}\big(Pais \bowtie_{Pais.idPais = TruDatos.idPaisA} TruDatos\big)\Big) \\
NomPaisB \leftarrow (IdPartida, NombrePais, IdJugador)\Big( \Pi_{IdPartidaB,IdPaisB,JugadorB}\big(Pais \bowtie_{Pais.idPais = TruDatos.idPaisB} TruDatos\big)\Big) \\
Out \leftarrow NomPaisA \cup NomPaisB ​\\
\Pi_{IdPartida,NombrePais,FechaCreacion,IdJugador}\big(Partida \bowtie Out\big)
$$

# Ejercicio 3
$$
Invitados \leftarrow \Pi_{Alias, IdPArtida}\;\big(\sigma_{Rol = 'Invitado'}(PaisPartidaJugador)​\big) \\
fech3 \leftarrow \Pi_{IdPartida, FechaCreacion, ConfiguracionConsumo}\;\big(\sigma_{FechaCreacion >= (hoy - 90dias)}(Invitados \bowtie Partida)​\big) \\
PxP \leftarrow \Pi_{ConfiguracionConsumo}\;(Partida) \times \Pi_{ConfiguracionConsumo}\;(\rho_{pa2}(Partida)) \\
Menores \leftarrow \Pi * (\sigma_{¥1 < ¥2}(PxP)) \\
NoMax \leftarrow \Pi_{¥1} (Menores) \\
Max \leftarrow \Pi_{ConfiguracionConsumo}\;(Partida - NoMax) \\
PartidaFilt \leftarrow \Pi_{IdPartida}\;\big(fech3 \bowtie Max\big) \\ 
Ali \leftarrow \Pi_{Alias}\;\big(invitados \bowtie PartidaFilt\big) \\ 
\Pi_{Alias,NombreJugador}\;\big(invitados \bowtie PartidaFilt\big)
$$

# Ejercicio 4
$$
RecId \leftarrow \Pi_{IdRecurso}\;\big(\sigma_{TipoRecurso = 'hierro'}(Recurso)​\big) \\
AliasA \leftarrow (Jugador,cantRec)\;\Pi_{JugadorA,CantidadRecursoA}\;\big(IdRecursoA​ \bowtie RecID \big) \\
AliasB \leftarrow (Jugador,cantRec)\;\Pi_{JugadorB,CantidadRecursoB}\;\big(IdRecursoA​ \bowtie RecID \big) \\
AliYRec \leftarrow \Pi_{Jugador,cantRec}\;(AliasA) \cup \Pi_{Jugador,cantRec}\;(AliasB) \\
RecXRec \leftarrow \Pi_{Jugador,cantRec}\;(AliYRec) \times \Pi_{Jugador,cantRec}\;(\rho_{T2}(AliYRec)) \\
mayores \leftarrow \Pi * \big(\sigma_{¥3 > ¥4}(RecXRec)) \\
NoMin \leftarrow \Pi_{¥3} \big(mayores) \\
Todos \leftarrow \Pi_{cantRec}\;\big(AliYRec\big) \\
min \leftarrow \Pi_{cantRec}\;\big(Todos - NoMin\big) \\
\Pi_{Jugador}\;\big(AliYRec \bowtie min \big)
$$