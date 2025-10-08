
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