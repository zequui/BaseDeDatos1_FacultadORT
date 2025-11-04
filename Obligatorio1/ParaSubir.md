# Ejercicio 1 - MER

![Imagen MER](Obligatorio1/MER/MER.drawio.png)

# Restricciones No Estructurales

## Gestión de partidas
- Un **jugador** al unirse a una **partida** queda registrado con su *rol*, indicando si fue invitado o si se unió de forma autónoma.
- La *capital* de un **país** es única.
- Cada **partida** debe tener un código único generado de forma aleatoria, el cual puede ser utilizado por otros jugadores para unirse a dicha **partida**. 
- El **orden de turnos** se asigna aleatoriamente al inicio de la **partida** y se mantiene fijo durante toda la misma.
- Cada **jugador** controla un **país** que le es asignado de forma aleatoria. 
- Los países se delimitan de forma desigual tanto en extensión territorial como en **recursos**. En una **partida** no existen 2 países con extensión territorial y **recursos** idénticos.
- Por cada **ronda**, cada **jugador** tiene su respectivo **turno**. Cuando todos los **turnos** finalizan, se avanza a una nueva **ronda** (*NumRonda*).

## Gestión de Recursos
- **Reglas:** deben cumplirse; de ser necesario, se modifica la cantidad del recurso o el consumo/gasto de tales.
- Solo existe un **recurso** de tipo PBN por **país**.
- Cada vez que aumenta *numRonda* de **ronda**, aumenta *rondaConsumo* de la relación entre **país** y **recurso**.
- Si *rondaConsumo* es múltiplo de 10, se le agregan **10.000 unidades** de PBN (*cantRec* de **recurso** de *tipo* PBN).
- Si una vez llegada a una *rondaConsumo* múltiplo de 10, la suma de todos los consumos del **recurso** tipo PBN desde la última ronda múltiplo de 10 no es mayor o igual a **2.000**, se le agregará al atributo *deuda* de **país** 2.000 unidades más un 50% de recargo.
- Los **recursos** de un **país** pueden ser de *tipo*: construcción, consumo o PBN. 
    - Si es de construcción, el *nombreRec* debe ser: hierro (H), cemento (CE), aluminio (AL), plástico (PL), cobre (CO) y carbono (CB). 
    - Si es de consumo: petróleo (P), carbón (CA), alimentos (ALI) y energía eléctrica (kW).
- Al inicio de una **partida**, los **recursos** de un **país** son 3, cada uno de distinto *tipo* (los de consumo y construcción se asignan de forma aleatoria).
- Cada vez que *NumRonda* avanza, se le agrega a *cantRec* la misma cantidad que *cantXRonda*.
- Al inicio de la **partida** se asigna a *cantXRonda* una cantidad generada a partir del **recurso**.
- Cada vez que aumenta *numRonda* de **ronda**, aumenta *RondaProduce* de la relación **produce** entre **construcción** de tipo *producción* y **recurso**.
- Cada vez que *NumRonda* avanza, se le suma a *cantRec* de un **recurso** producido por una **construcción** de categoría *producción* la misma cantidad de *CantidadProducción*.
- Cada vez que aumenta *numRonda* de **ronda**, aumenta *rondaUsa* de la relación **usa** entre **construcción** y **recurso**.
- Cada vez que aumenta *rondaUsa* de **usa**, se le resta a *cantRec* de **recurso** el valor de *uso*.

## Gestión de construcciones e infraestructura
- El **gasto y consumo** de una **construcción** debe corresponder a algún recurso del país.
- Una **construcción** puede pertenecer a uno de 3 grupos:
    - ### Fábricas
        - Astilleros 
        - Fábricas de aviones 
        - Trenes
    - ### Infraestructura
        - Puertos
        - Vías férreas y estaciones
        - Telecomunicaciones
        - Manzanas de ciudad
    - ### Producción
        - Usinas y represas
        - Plantaciones
- (Si una **construcción** es de categoría *Fábrica*, debe ser de tipo Astilleros, Fábricas de aviones o Trenes; lo mismo aplica para Infraestructura y Producción.)
- Cuando un **país** adquiere una **construcción**, se le descuenta de sus **recursos** (*cantRec*) la misma cantidad que *cantGasta* de la relación *gasta*.

## Gestión de transporte y comercio
- El tipo de **transporte** involucrado en un trueque debe pertenecer a:
    - **Barcos de carga:** poseen capacidades de carga variables.
    - **Trenes:** permiten movilizar grandes volúmenes.
    - **Aviones de carga:** ofrecen menor capacidad.
- En cada **trueque** se debe seleccionar un **país responsable**.
- La cantidad de **recursos** de un **país** incluida en el **trueque** debe ser posible (no debe superar los recursos disponibles y debe poder trasladarse con la capacidad fijada). 

## Gestión de consumo
- *CantXRonda* de los recursos de tipo alimentos y energía se ve proporcionalmente afectado por la cantidad de construcciones de tipo "manzanas de ciudad". La proporción *consumoManzana* se define cuando un jugador crea una partida.
- Si un **país** no cumple con su consumo de alimentos y energías en 10 rondas, se agrega una **observación** al **país**.
- Si tras transcurrir 10 rondas se saldaron todas las *deudas* de un **pais** las *observaciones* se reinician a 0.
- Si un **país** acumula más de 2 **observaciones** , se considera que ha perdido la partida y no podrá seguir jugando.

## Gestión de logros
- Los **logros** se desbloquean al cumplir hitos predefinidos.
- Cada **logro** otorga una medalla al **jugador** que controla el **pais** que obtuvo tal **logro**, aumentando el atributo *medallas* de un **jugador**.

# Ejercicio 2 - MR

**Empresa** (`Rut`, `RazonSocial`, Calle, Nro, Ciudad, Departamento, CP, FechaRegistro)
- Pk: Rut
- Ak: RazonSocial


**Constructura** (`Rut`, `RegistroMTOP`, categoriaCON)
- Pk: Rut
- Ak: RegistroMTOP
- Fk: Rut -> Empresa 


**Subcontratista** (`Rut`, `NroRUPE`, RubroPrincipal)
- Pk: Rut 
- Ak: NroRUPE
- Fk: Rut -> Empresa 


**Email** (`mail, Rut`)
- Pk: mail,Rut
- Fk: Rut -> Empresa


**Telefono** (`numero, RUT`)
- Pk: numero, Rut
- Fk: Rut -> Empresa


**Shopping** (`ShoppingID`, NombreShopping, AñoApertura, Calle, Nro, Ciudad, Departamento, CP)
- Pk: ShoppingID


**Obra** (`ObraId`, NombreObra, TipoObra, PresupuetoEstimado, FechaInicioPrevista, FechaFinPrevista, Estado, RestriccionHorarioObra, ShoppingID)
PK: ObraId
- Fk: ShoppingID -> Shopping

**Reforma** (`ObraID`, AfectaEstructura)
- Pk: ObraID
- Fk: ObraID -> Obra


**Obra_Nueva**(`ObraID`, RequiereHabilitacionBPS)
- Pk: ObraID
- Fk: ObraID -> Obra


**Subcontrata** (`NroRUPE, ObraId`)
- Pk: NroRUPE,ObraId
- Fk: NroRUPE -> Subcontratista
- Fk: ObraId -> Obra


**Participa_Contrato** ( `Rut, ObraID`>, %Participacion, FechaInicio, FechaFin, `ContratoID`, MontoAdjudicado, FechaFirma, PlazoDias, Modalidad, FormaPago, FechaSjudicacion, CondicionesEspeciales)
- Pk: Rut, ObraID
- Ak: ContratoID
- Fk: Rut -> Empresa
- Fk: ObraId -> Empresa

**Garantia** (`GarantiaID`, Tipo, Monto, FechaDesde, FechaHasta)
- Pk: GarantiaID

**GarantizadoPor** (`Rut, ObraID, GarantiaID`)
- Pk: Rut,ObraID,GarantiaID
- Fk: Rut,ObraID -> Participa_Contrato


**Rol** (`nombreRol, Rut, ObraId`)
- Pk: nombreRol, Rut,ObraId
- Fk: Rut,ObraId -> Participa


**Especialidad** (`EspId`, Nombre, Descripcion)
- Pk: EspId


**TieneEspecialidad** (`Rut, EspId`, NivelExperiencia)
- Pk: Rut, EspId
- Fk: Rut -> Empresa
- Fk: EspId -> Especialidad


**Certificacion** (`Certificado, Rut,EspId`)
- Pk: Certificado, Rut,EspId
- Fk: Rut -> Empresa
- Fk: EspId -> Especialidad


**Permiso_Municipal** (`PermisoID`, ObraID, NroExpediente, TipoPermiso, Intendencia, FechaSolicitud, FechaOtorgamiento)
- Pk: PermisoID
- Fk: ObraID -> Obra

**Local_Comercial** (`NroLocal, ShoppingID`, superficieM2, piso )
- Pk: NroLocal, ShoppingID
- Fk: ShoppingID -> Shopping

**Etapa** (`ObraID, Nrotapa,` NombreEtapa, Inicio, Fin)
- Pk: NroEtapa, ObraID
- Fk: ObraId -> Obra

**Hito** (`NroHito, NroEtapa, ObraID`, NombreHito, FechaCompromiso, FechaReal)
- Pk: NroHito, NroEtapa, ObraID
- Fk: NroEtapa, ObraID -> Etapa

**Observaciones** (`idObs, NroHito, NroEtapa, ObraID`, descripcion)
Pk: idObs, NroHito, NroEtapa, ObraID
Fk: NroHito, NroEtapa, ObraID -> Hito

**Afecta** (`NroLocal, ShoppingID, NroHito, NroEtapa, ObraID`, TipoIntervencion, DuracionEstimada, NivelImpacto)
Pk: NroLocal, ShoppingID, NroHito, NroEtapa, ObraID
Fk: NroHito, NroEtapa, ObraID -> Hito
Fk: NroLocal, ShoppingID -> Local_Comercial

**Propietario** (`TipoDocumento, NroDocumento`, Nombre, Email, TipoTel, NroTel)
Pk: TipoDocumento, NroDocumento

**LePertenece** (`ShoppingID, TipoDocumento, NroDocumento`, Fecha)
Pk: ShoppingID, TipoDocumento, NroDocumento
Fk: TipoDocumento, NroDocumento -> Propietario
Fk: ShoppingID -> Shopping

## Restricciones Estructurales

**Empresa**
- Rut es pk [CLA]
- Rut es de tipo numérico de 12 dígitos [DOM]
- RazonSocial not NULL [REL]
- RazonSocial es tipo varchar de hasta 50 caracteres [DOM]
- CP es de tipo numérico y tiene exactamente 5 caracteres [DOM]
    - **Constructoras**
    - MTOP debe ser de tipo alfanumerico de hasta 10 caracteres [DOM]
    - Dom(CategorizaCON) = {A,B,C} [DOM]
    - Rut -> Empresa es fk [REF]
    - RegistroMTOP es ak [CLA]
    - **Subcontratistas**
    - NroRUPE debe ser de tipo alfanumerico de hasta 15 caracteres [DOM]
    - RubroPrincipal not NULL [REL]
    - Dom(RubroPrincipal) = {Electricidad, Carpintería, Climatización, Plomería, Pintura, Montaje de estructuras metálicas y Seguridad electrónica} [DOM]
    - Rut -> Empresa es fk [REF]
    - NroRUPE es ak [CLA]

**Participa_Contrato**
- Rol not NULL [REL] 
    - **Roles**
    - Dom(nombreRol) = {Principal,Secundario, Proveedor Especializado Consultor Técnico, Diseñador/Arquitecto Asociado, Supervisor de Obra o UTE/Consorcio Asociado} [DOM]
- %Participacion not NULL [REL]
- %Participacion ∈ [0,100] [DOM]
- MontoAdjudicado not NULL [REL]
- MontoAdjudicado de tipo numerico [DOM]
- MontoAdjudicado > 0 [DOM]
- FechaFirma tipo date [DOM]
- FechaFirma not NULL [REL]
- Dom(Modalidad) = {Licitación, Contratación Directa, Concurso de precios} [DOM]
- PlazoDias es de tipo numérico entero [DOM]
- PlazoDias > 0 [DOM]
- Rut -> Empresa es fk [REF]
- ObraID -> Obra es fk [REF]
- Rut, ObraID es pk [CLA]

### *Suposicion*
- Una empresa no puede participar en una obra, sin que exista ya una empresa que participe en la obra con rol principal (suposición realizada por la cardinalidad de la relación participa con contrato) [REL]

**Obra**
- ObraID es pk [CLA]
- ObraID es de tipo alfanumerico de exactamente 8 caracteres [DOM]
- Dom(TipoObra) = {Nueva, Reforma, Ampliacion} [DOM]
- TipoObra not NULL [REL]
- ShoppingID -> Shopping es fk [REF]
    - **Obras_Nuevas**
    - Dom(RequiereHabilitacionBPS) = {Verdadero, Falso} [DOM]
    - **Reformas**
    - Dom(AfectaEstructura) = {Verdadero, Falso} [DOM]

**Etapa**
- NombreEtapa not NULL [REL]
- Fecha de Inicio (Inicio) y Fecha de Fin (Fin) son de tipo date [DOM]
- Fecha de Inicio y Fecha de Fin son not NULL [REL]

**Afecta**
- TipoIntevención not NULL [REL]
- Dom(TipoIntervención) = {Demolición, Instalación eléctrica, Colocación de pisos,Pintura, Montaje de estructuras o Reformas sanitarias} [DOM]
- DuraciónEstimada not NULL [REL]
- DuracionEstimada se expresa en horas de tipo numerico [DOM]
- DuracionEstimada > 0 [DOM]
- NivelImpacto not NULL [REL]
- Dom(NivelImpacto) = {Bajo, Medio, Alto} [DOM]
- NroLocal, ShoppingID -> Local_Comercial es fk [REF]

**Permsiso_Municipales**
- FechaOtorgamiento not NULL [REL]
- FechaOtorgamiento tipo date [DOM]
- TipoPermiso not NULL [REL]
- Dom(TipoPermiso) = {Obra nueva, Reforma estructural, Ampliación, Habilitación comercial, permiso eléctrico, Permiso sanitario} [DOM]
- NroExpediente not NULL [REL]
- NroExpediente es de tipo alfanumerico de hasta 12 caracteres [DOM]
- FechaSolicitud tipo date [DOM]
- Dom(Intendencia) = {Artigas, Canelones, Cerro Largo, Colonia, Durazno, Flores, Florida, Lavalleja, Maldonado, Montevideo, Paysandú, Río Negro, Rivera, Rocha, Salto, San José, Soriano, Tacuarembó y Treinta y Tres} [DOM]
- ObraID -> Obra es fk [REF]
- PermisoID es pk [CLA]

**Especialidad**
- Nombre not NULL [REL]
- Nombre es de tipo alfanumerico de hasta 30 caracteres [DOM]
- Dom(Nombre) = {estructuras metálicas, hormigón, HVAC, electricidad, plomería, pintura} [DOM]
- EspID es pk [CLA]

**Tiene_Especialidad**
- NivelExperiencia not NULL [REL]
- NivelExperiencia ∈ [1,10] [DOM]
- Rut -> Empresa es fk [REF]
- EspID -> Especialidad [REF]
- Rut,EspID es pk [CLA]

**Cerficiacion**
- Certificado es de tipo alfanumerico de hasta 10 caracteres [DOM]
- Rut -> Empresa es fk [REF]
- EspID -> Especialidad [REF]
- Certificado, Rut, EspID [CLA]

**Garantía**
- dom(Tipo) = { Fianza bancaria, Póliza de seguro, Depósito en efectivo} [DOM]
- Monto es de tipo numerico [DOM]
- Monto > 0 [DOM]
- FechasHasta not NULL [REL]
- FechaDesde not NULL [REL]
- FechaHasta y FechaDesde son de tipo date [DOM]
- GrantiaID es pk [CLA]

**Propietario**
- TipoDocumento y NroDocumento son de tipo alfanumerico [DOM]
- El largo de NroDocumento debe de tener entre 6 y 12 caracteres [DOM]
- Dom(TipoDocumento) = {CI, RUT, Pasaporte} [DOM]
- TipoDocimento, NroDocumento es pk [CLA]


## Restricciones No Estructurales (Semántica)

**Empresa**
- Todas las empresas son Constructoras o Subcontratistas, pero no ambas o ninguna [SEM]

**Participa_Contrato**
- Se genera un Contrato Asociado una vez una empresa participa de una obra con nombreRol == Principal [SEM]

**Obra**
- Todas las obras se categorizan como Nuevas y Reformas. Una obra puede estar en ambas o en ninguna [SEM]

**Etapa**
- NroEtapa se asigna de manera secuencial [SEM]
- Fecha de Inicio < Fecha de Fin [SEM]

**Permsiso_Municipales**
- FechaOtorgamiento >= FechaSolicitud [SEM]

**Garantía**
- FechaDesde < FechaHasta [SEM]
- Cada garantia respalda un contrato [SEM]

**Propietario**
- No puede administrar más de tres shoppings activos en simultaneo [SEM]
- No puede tener más de un shopping en un mismo departamento [SEM]
- Si un propietario ya posee un shopping, para poder adquirir un nuevo shopping, debe de cumplir que la fecha actual sea mayor o igual a la fecha de Pertenencia del 
último shopping que adquirió + 2 años. [SEM]