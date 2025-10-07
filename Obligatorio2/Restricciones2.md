## Restricciones 
* Restricciones de Dominio: DOM
* Restricciones de Identidad o Clave: CLA
* Restricción de Integridad de Relación: REL
* Restricción de Integridad Referencial: REF
* Restricción de Integridad Semántica: SEM

**Empresa**
- Rut es de tipo numérico de 12 dígitos [DOM]
- RazonSocial not NULL [REL]
- RazonSocial es tipo varchar de hasta 50 caracteres [DOM]
- CP es de tipo numérico y tiene exactamente 5 caracteres [DOM] [DOM]
- Todas las empresas son Constructoras o Subcontratistas, pero no ambas o ninguna
    - **Constructoras**
    - MTOP debe ser de tipo alfanumerico de hasta 10 caracteres [DOM]
    - Dom(CategorizaCON)= {A,B,C} [DOM]
    - **Subcontratistas**
    - NroRUPE debe ser de tipo alfanumerico de hasta 15 caracteres [DOM]
    - RubroPrincipal not NULL [REL]
    - Dom(RubroPrincipal) = {Electricidad, Carpintería, Climatización, Plomería, Pintura, Montaje de estructuras metálicas y Seguridad electrónica} [DOM]

**Participa**
- Rol not NULL [REL] **//////////////////////////////////////////////////////////////////**
    - **Roles**
    - Dom(nombreRol) = {Principal,Secundario, Proveedor Especializado Consultor Técnico, Diseñador/Arquitecto Asociado, Supervisor de Obra o UTE/Consorcio Asociado} [DOM]
    - %Participacion not NULL [REL]
    - %Participacion ∈ [0,100] [DOM]

### *Suposicion*
- Una empresa no puede participar en una obra, sin que exista ya una empresa que participe en la obra con rol principal (suposición realizada por la cardinalidad de la relación participa con contrato)

**Obra**
- ObraID es de tipo alfanumerico de exactamente 8 caracteres [DOM]
- Dom(TipoObra) = {Nueva, Reforma, Ampliacion} [DOM]
- TipoObra not NULL [REL]
- Todas las obras se categorizan como Nuevas y Reformas. Una obra puede estar en ambas o en ninguna 
    - **Obras_Nuevas**
    - Dom(RequiereHabilitacionBPS) = {Verdadero, Falso} [DOM]
    - **Reformas**
    - Dom(AfectaEstructura) = {Verdadero, Falso} [DOM]

**Etapa**
- NroEtapa se asigna de manera secuencial
- NombreEtapa not NULL [REL]
- Fecha de Inicio (Inicio) y Fecha de Fin (Fin) son de tipo date
- Fecha de Inicio y Fecha de Fin son not NULL [REL]
- Fecha de Inicio < Fecha de Fin

**Afecta**
- TipoIntevención not NULL [REL]
- Dom(TipoIntervención) = {Demolición, Instalación eléctrica, Colocación de pisos,Pintura, Montaje de estructuras o Reformas sanitarias} [DOM]
- DuraciónEstimada not NULL [REL]
- DuracionEstimada se expresa en horas de tipo numerico 
- DuracionEstimada > 0 [DOM]
- NivelImpacto not NULL [REL]
- Dom(NivelImpacto) = {Bajo, Medio, Alto} [DOM]

**Permsiso_Municipales**
- FechaOtorgamiento not NULL [REL]
- FechaOtorgamiento tipo date
- TipoPermiso not NULL [REL]
- Dom(TipoPermiso) = {Obra nueva, Reforma estructural, Ampliación, Habilitación comercial, permiso eléctrico, Permiso sanitario} [DOM]
- NroExpediente not NULL [REL]
- NroExpediente es de tipo alfanumerico de hasta 12 caracteres [DOM]
- FechaSolicitud tipo date [DOM]
- FechaOtorgamiento >= FechaSolicitud 
- Dom(Intendencia) = {Artigas, Canelones, Cerro Largo, Colonia, Durazno, Flores, Florida, Lavalleja, Maldonado, Montevideo, Paysandú, Río Negro, Rivera, Rocha, Salto, San José, Soriano, Tacuarembó y Treinta y Tres} [DOM]

**Especialidad**
- Nombre not NULL [REL]
- Nombre es de tipo alfanumerico de hasta 30 caracteres [DOM]
- Dom(Nombre) = {estructuras metálicas, hormigón, HVAC, electricidad, plomería, pintura} [DOM]

**Tiene_Especialidad**
- NivelExperiencia not NULL [REL]
- NivelExperiencia ∈ [1,10]

**Cerficiacion**
- Certificado es de tipo alfanumerico de hasta 10 caracteres [DOM]

**Contrato**
- Se genera un Contrato Asociado una vez una empresa participa de una obra con nombreRol == Principal
- MontoAdjudicado not NULL [REL]
- MontoAdjudicado de tipo numerico
- MontoAdjudicado > 0 [DOM]
- FechaFirma tipo date
- FechaFirma not NULL [REL]
- Dom(Modalidad) = {Licitación, Contratación Directa, Concurso de precios} [DOM]
- PlazoDias es de tipo numérico entero 
- PlazoDias > 0 [DOM]

**Garantía**
- dom(Tipo) = { Fianza bancaria, Póliza de seguro, Depósito en efectivo} [DOM]
- Monto es de tipo numerico
- Monto > 0
- FechasHasta not NULL [REL]
- FechaDesde not NULL [REL]
- FechaHasta y FechaDesde son de tipo date
- FechaDesde < FechaHasta

**Propietario**
- TipoDocumento y NroDocumento son de tipo alfanumerico
- El largo de NroDocumento debe de tener entre 6 y 12 caracteres [DOM]
- Dom(TipoDocumento) = {CI, RUT, Pasaporte} [DOM]
- No puede administrar más de tres shoppings activos en simultaneo
- No puede tener más de un shopping en un mismo departamento
- Si un propietario ya posee un shopping, para poder adquirir un nuevo shopping, debe de cumplir que la fecha actual sea mayor o igual a la fecha de Pertenencia del último shopping que adquirió + 2 años.


https://chatgpt.com/share/68e54efd-59a4-8007-984f-1ef7be7303b1