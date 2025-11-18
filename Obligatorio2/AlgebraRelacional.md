
# Ejercicio 1
$$
RecId \leftarrow \Pi_{IdRecurso}\;\big(\sigma_{TipoRecurso ='Construccion'}(Recurso)​\big) \\
ConsId \leftarrow \Pi_{IdPais,TipoConstruccion}\;\big(Construccion \bowtie RecID​\big) \\
PaisId \leftarrow \Pi_{IdPais}\;\big(\sigma_{TipoConstruccion = 'Puerto'}(ConsId)​\big) \\
PaisId2 \leftarrow \Pi_{IdPais}\;\big(\sigma_{TipoConstruccion = 'Astillero'}(consId)​\big) \\
Puertos \leftarrow (PaisId) - (PaisId2) \\
Astilleros \leftarrow (PaisId2) - (PaisId) \\
\big(Pais \bowtie (Puertos \cup Astilleros)​\big) \\
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
PxP \leftarrow \Pi_{ConfiguracionConsumo}\;(Partida) \times (ConfiguracionCons)\big(\Pi_{ConfiguracionConsumo}\;(\rho_{pa2}(Partida))\big) \\
Menores \leftarrow (\sigma_{ConfiguracionConsumo < ConfiguracionCons}(PxP)) \\
NoMax \leftarrow \Pi_{ConfiguracionConsumo} (Menores) \\
Max \leftarrow \Pi_{ConfiguracionConsumo}\;(Partida - NoMax) \\
PartidaFilt \leftarrow \Pi_{IdPartida}\;\big(fech3 \bowtie Max\big) \\ 
Ali \leftarrow \Pi_{Alias}\;\big(invitados \bowtie PartidaFilt\big) \\ 
\Pi_{Alias,NombreJugador}\;\big(invitados \bowtie PartidaFilt\big)
$$

# Ejercicio 4
$$
RecId \leftarrow \Pi_{IdRecurso}\;\big(\sigma_{TipoRecurso = 'hierro'}(Recurso)​\big) \\
AliasA \leftarrow (Jugador,CantRec)\;\Pi_{JugadorA,CantidadRecursoA}\;\big(Trueque \bowtie_{Trueque.IdRecursoA = RecID.IdRecurso} RecID \big) \\
MaxCant \leftarrow (\gamma Max(CantRec))(AliasA) \\
\Pi_{Jugador}\;\big( AliasA \bowtie MaxCant \big)
$$


# Ejercicio 5
$$
RecConst \leftarrow \Pi_{idRecurso}\big(\sigma_{TipoRecurso = 'CONSTRUCCION'}(Recurso)\big) \\[4pt]
partiConsumo \leftarrow \Pi_{idPartida,idPais}\big(\sigma_{configuracionconsumo > 1000}(Partida)\big) \\[4pt]
ConstConsu \leftarrow \sigma_{tipoOperacion = 'CONSUME'}(Construccion) \\[4pt]
CtPartidaConsu \leftarrow ConstConsu \bowtie partiConsumo \\[4pt]
ConstRecConsumo \leftarrow \Pi_{idPartida,idPais,idRecurso}\big(CtPartidaConsu \bowtie RecConst\big) \\[4pt]
paisesConsumistas \leftarrow \Pi_{idPartida,idPais}\Big(\big(\Pi_{idPartida,idPais,idRecurso}(ConstRecConsumo)\big)\; \%\; RecConst\Big) \\[4pt]
Resultado \leftarrow \Pi_{Alias,NombreJugador}\Big( Jugador \bowtie \big( paisesConsumistas \bowtie_{(idPartida,idPais)} PaisPartidaJugador \big) \Big)
$$