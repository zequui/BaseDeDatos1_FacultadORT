
<!-- * Cosas que necesito para el markdown
* \Pi_{nombre, puntaje}(Jugadores) \\
* \Pi \sigma \neq \rightarrow  \bowtie \cup \\
-->
# Ejercicio 1
$$
\Pi_{IdRecurso}(\sigma_{TipoProducto \neq 'Construccion'}(Recurso)) \rightarrow RecId \\
\Pi_{IdPais,TipoConstruccion}(Construccion \bowtie RecID) \rightarrow ConsId \\
\Pi_{IdPais}(\sigma_{TipoConstruccion = 'Puerto'}(ConsId)) \rightarrow PaisId \\
\Pi_{IdPais}(\sigma_{TipoProducto = 'Astillero'}(consId)) \rightarrow PaisId2 \\
\Pi*(PaisId) - \Pi_{*}(PaisId2)\rightarrow Puertos \\
\Pi*(PaisId2) - \Pi_{*}(PaisId)  \rightarrow Astilleros \\
\Pi*(Pais \bowtie (Puertos \cup Astilleros)) \\
$$
# Ejercicio 2
<!-- TODO: queda por terminar el 2 porque encontre un error, y debo solucionarlo -->
$$
\Pi_{IdRecurso}(\sigma_{TipoRecurso \neq 'PBN'}(Recurso)) \rightarrow RecPBN \\
\Pi_{IdPartidaA,IdPaisA,IdJugadorA,IdPaisB,IdJugadorB}(Trueque \bowtie_{idRecursoA.Trueque = IdRecurso.RecPBN} RecPBN) \rightarrow ConsId1 \\
\Pi_{IdPartidaA,IdPaisA,IdJugadorA,IdPaisB,IdJugadorB}(Trueque \bowtie_{idRecursoB.Trueque = IdRecurso.RecPBN} RecPBN) \rightarrow ConsId2 \\
$$