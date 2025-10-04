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
- Si un **país** acumula más de 2 **observaciones**, se considera que ha perdido la partida y no podrá seguir jugando.

## Gestión de logros
- Los **logros** se desbloquean al cumplir hitos predefinidos.
- Cada **logro** otorga una medalla al **jugador** que controla el **pais** que obtuvo tal **logro**, aumentando el atributo *medallas* de un **jugador**.
