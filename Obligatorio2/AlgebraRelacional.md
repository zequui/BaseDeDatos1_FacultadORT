
<!-- * Cosas que necesito para el markdown
* \Pi_{nombre, puntaje}(Jugadores) \\
* \Pi \sigma \neq \rightarrow  \bowtie \cup \big( \big) \times\\
-->
# Ejercicio 1
$$
\Pi_{IdRecurso}\;\big(\sigma_{TipoRecurso \neq 'Construccion'}(Recurso)​\big) \rightarrow RecId \\
\Pi_{IdPais,TipoConstruccion}\;\big(Construccion \bowtie RecID​\big) \rightarrow ConsId \\
\Pi_{IdPais}\;\big(\sigma_{TipoConstruccion = 'Puerto'}(ConsId)​\big) \rightarrow PaisId \\
\Pi_{IdPais}\;\big(\sigma_{TipoConstruccion = 'Astillero'}(consId)​\big) \rightarrow PaisId2 \\
\Pi*(PaisId) - \Pi*(PaisId2)\rightarrow Puertos \\
\Pi*(PaisId2) - \Pi*(PaisId)  \rightarrow Astilleros \\
\Pi*\;\big(Pais \bowtie (Puertos \cup Astilleros)​\big) \\
$$
# Ejercicio 2
<!-- TODO: Preguntar a la profe si estan bien los renombramientos, los joins y seleccion -->
$$
\Pi_{IdRecurso}(\sigma_{TipoRecurso \neq 'PBN'}(Recurso)) \rightarrow RecPBN \\
\Pi_{IdPartidaA,IdPaisA,JugadorA,IdRecursoA,IdPaisB,JugadorB,IdRecursoB}\;\big(\rho_{T1(IdRec:=idRecursoA)}\;\sigma_{T1.IdRec = RecPBN.IdRecurso}\;(Trueque \times RecPBN​)\big) \rightarrow ConsId1 \\
\Pi_{IdPartidaA,IdPaisA,JugadorA,IdRecursoA,IdPaisB,JugadorB,IdRecursoB}\;\big(\rho_{T2(IdRec:=idRecursoB)}\;\sigma_{T2.IdRec = RecPBN.IdRecurso}\;(ConsId1 \times RecPBN​)\big) \rightarrow ConsId2 \\
ConsId1 \;\cup\; ConsId2 \rightarrow TruDatos \\
\rho_{(IdPartida := IdPartidaA,\; IdJugador := JugadorA)}\Big( \Pi_{IdPartidaA,NombrePais,JugadorA}\big(Pais \bowtie_{Pais.idPais = TriDatos.idPais.A} TriDatos\big)\Big) \rightarrow NomPaisA \\
\rho_{(IdPartida := IdPartidaB,\; IdJugador := JugadorB)}\Big( \Pi_{IdPartidaB,NombrePais,JugadorB}\big(Pais \bowtie_{Pais.idPais = TriDatos.idPais.B} TriDatos\big)\Big) \rightarrow NomPaisB \\
NomPaisA \cup NomPaisB​ \rightarrow Out \\
\Pi_{IdPartida,NombrePais,FechaCreacion,IdJugador}\big(Partida \bowtie Out\big)
$$

# Ejercicio 3
$$
\Pi_{Alias, IdPArtida}\;\big(\sigma_{Rol \neq 'Invitado'}(PaisPartidaJugador)​\big) \rightarrow Invitados \\
\Pi_{IdPArtida, FechaCreacion, ConfiguracionConsumo}\;\big(\sigma_{FechaCreacion >= (hoy - 90dias)}(Invitados \bowtie Partida)​\big) \rightarrow fech3 \\
\Pi_{ConfiguracionConsumo}\;(Partida) \times \Pi_{ConfiguracionConsumo}\;(\rho_{pa2}(Partida)) \rightarrow PxP \\
\Pi * (\sigma_{¥1 < ¥2}(PxP)) \rightarrow Menores \\
\Pi_{¥1} (Menores) \rightarrow NoMax \\
\Pi_{ConfiguracionConsumo}\;(Partida - NoMax) \rightarrow max \\
\Pi_{IdPartida}\;\big(fech3 \bowtie Max\big) \rightarrow PartidaFilt \\ 
\Pi_{Alias}\;\big(invitados \bowtie PartidaFilt\big) \rightarrow Ali \\ 
\Pi_{Alias,NombreJugador}\;\big(invitados \bowtie PartidaFilt\big)
$$

# Ejercicio 4
$$
\Pi_{IdRecurso}\;\big(\sigma_{TipoRecurso = 'hierro'}(Recurso)​\big) \rightarrow RecId \\
\rho_{(Jugador := JugadorA,\; cantRec := CantidadRecursoA)}\;\Pi_{JugadorA,CantidadRecursoA}\;\big(IdRecursoA​ \bowtie RecID \big) \rightarrow AliasA \\
\rho_{(Jugador := JugadorA,\; cantRec := CantidadRecursoA)}\;\Pi_{JugadorB,CantidadRecursoB}\;\big(IdRecursoA​ \bowtie RecID \big) \rightarrow AliasB \\
\Pi_{Jugador,cantRec}\;(AliasA) \cup \Pi_{Jugador,cantRec}\;(AliasB) \rightarrow AliYRec \\
\Pi_{Jugador,cantRec}\;(AliYRec) \times \Pi_{Jugador,cantRec}\;(\rho_{T2}(AliYRec)) \rightarrow RecXRec \\
\Pi * \big(\sigma_{¥3 > ¥4}(RecXRec)) \rightarrow mayores \\
\Pi_{¥3} \big(mayores) \rightarrow NoMin \\
\Pi_{cantRec}\;\big(AliYRec\big) \rightarrow Todos \\
\Pi_{cantRec}\;\big(Todos - NoMin\big) \rightarrow min \\
\Pi_{Jugador}\;\big(AliYRec \bowtie min \big)
$$