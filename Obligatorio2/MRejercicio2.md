
**Empresa** (<u>Rut</u>, `RazonSocial`, Calle, Nro, Ciudad, Departamento, CP, FechaRegistro)
- Pk: Rut
- Ak: RazonSocial


**Constructura** (<u>Rut</u>, RegistroMTOP, categoriaCON)
- Pk: Rut
- Ak: RegistroMTOP
- Fk: Rut -> Empresa 


**Subcontratista** (<u>Rut</u>, NroRUPE, RubroPrincipal)
- Pk: Rut 
- Ak: NroRUPE
- Fk: Rut -> Empresa 


**Email** (<u>mail,Rut</u>)
- Pk: mail,Rut
- Fk: Rut -> Empresa


**Telefono** (<u>numero, RUT</u>)
- Pk: numero, Rut
- Fk: Rut -> Empresa


**Shopping** (<u>ShoppingID</u>, NombreShopping, AñoApertura, Calle, Nro, Ciudad, Departamento, CP)
- Pk: ShoppingID


**Obra** (<u>ObraId</u>, NombreObra, TipoObra, PresupuetoEstimado, FechaInicioPrevista, FechaFinPrevista, Estado, RestriccionHorarioObra, ShoppingID)
PK: ObraId
- Fk: ShoppingID -> Shopping


**Etapa** (<u>NroEtapa</u>,)

**Reforma** (<u>ObraID</u>, AfectaEstructura)
- Pk: ObraID
- Fk: ObraID -> Obra


**Obra_Nueva**(<u>ObraID</u>, RequiereHabilitacionBPS)
- Pk: ObraID
- Fk: ObraID -> Obra


**Subcontrata** (<u>NroRUPE</u>,<u>ObraId</u>)
- Pk: NroRUPE,ObraId
- Fk: NroRUPE -> Subcontratista
- Fk: ObraId -> Obra


**Participa_Contrato** ( <u>Rut</u>, <u>ObraID</u>>, %Participacion, FechaInicio, FechaFin, <u>>ContratoID</u>>, MontoAdjudicado, FechaFirma, PlazoDias, Modalidad, FormaPago, FechaSjudicacion, CondicionesEspeciales)
- Pk: Rut, ObraID
- Ak: ContratoID
- Fk: Rut -> Empresa
- Fk: ObraId -> Empresa

**GarantizadoPor** ( <u>Rut,ObraID</u>,<u>GarantiaID</u>)
- Pk: Rut,ObraID,GarantiaID
- Fk: Rut,ObraID -> Participa_Contrato

**Garantia** (<u>GarantiaID</u>, Tipo, Monto, FechaDesde, FechaHasta)
- Pk: GarantiaID


**Rol** (<u>nombreRol</u>, Rut,ObraId)
- Pk: nombreRol, Rut,ObraId
- Fk: Rut,ObraId -> Participa


**Especialidad** (<u>EspId</u>, Nombre, Descripcion)
- Pk: EspId


**TieneEspecialidad** (<u>Rut</u>, <u>EspId</u>, NivelExperiencia)
- Pk: Rut, EspId
- Fk: Rut -> Empresa
- Fk: EspId -> Especialidad


**Certificacion** (<u>certificado</u>, <u>Rut</u>,<u>EspId</u>)
- Pk: certificado, Rut,EspId
- Fk: Rut -> Empresa
- Fk: EspId -> Especialidad


**Permiso_Municipal** (<u>PermisoID</u>, ObraID, NroExpediente, TipoPermiso, Intendencia, FechaSolicitud, FechaOtorgamiento)
- Pk: PermisoID
- Fk: ObraID -> Obra


**Local_Comercial** (<u>NroLocal</u>, superficieM2, piso, <u>ShoppingID</u>)
- Pk: NroLocal, ShoppingID
- Fk: ShoppingID -> Shopping
