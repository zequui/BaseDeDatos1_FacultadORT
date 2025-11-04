# Restricciones 

## RNE

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


## RNE (Semántica)

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