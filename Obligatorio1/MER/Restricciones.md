# Restricciones No Estrucutrales

## Gestión de partidas
- Un **jugador** al unirse a una **partida** se toma registro de su *rol*, si fue invitado o se unio de forma autonoma.
- Cada **partida** debe tener un código único generado de forma aleatoria, el cual puede ser utilizado por otros jugadores para unirse a dicha **partida**. 
- El **turno** de un **jugador** se asigna aleatorioamente al **unirse** a una **partida**.
- Cada Jugador controla un **pais** que le es asignado de forma aleatoria. 
- Los paises se delimitan de forma desigual tanto extension territorial como en **recursos**, En una **partida** no existen 2 paises con extension territorial y **recursos** identicos.
- Por cada **ronda** cada **jugador** tiene su respectivo **turno** , cuando todos los **turnos** pasan se avanza una **R+ronda** *(NumRonda)*.

## Gestión de Recursos
- *Reglas** Las reglas deben cumplirse, de ser necesario se modifica la cantidad del recurso o el consumo/gasto de tales.
- Solo existe un **recurso** Tipo PBN por pais.
- cada vez que aumenta *numRonda* de **ronda**, aumenta *rondaConsumo* de la relacion entre **pais** y **recurso**.
- si *rondaConsumo* es multiplo de 10, se le aumentan 10k unidades de PBN(*cantRec* de **recurso** de *tipo* PBN).
- si una vez llegada a una *rondaConsumo* multiplo de 10, la suma de todos los consumos del **recurso** tipo PBN desde la ultima ronda multiplo de 10 no es mayor o igual a 2k. Se le agregara al atributo *deuda* de **pais**, 2k de las 10 rondas y luego un 50% de recargo.
- Los **recursos** de Un **Pais** pueden ser de *tipo*: construccion , consumo o PBN. 
    - Si es de construccion, el *nombreRec* debe ser: hierro (H), cemento (CE), aluminio (AL), plástico (PL), cobre (CO) y carbono (CB). 
    - Si es de consumo: petróleo (P), carbón (CA), alimentos (ALI) y energía eléctrica (kW).
- Al inicio de una Partida los **Recursos** de un **Pais** son 3, cada uno de distinto *tipo*, (los de consumo y construccion se deciden de forma aleatoria).
- *CantXRonda* puede incluir *reglas* de disminución o suspensión de producción, ya que es el total consumo(sea positivo o negativo) de ese recurso por ronda.

## Gestión de construcciones e infraestructura

- El **Gasto y Consumo** de una Construccion debe ser algun recurso del pais.

- Una Contruccion puede pertenecer a uno de 3 grupos.
    - ### Fabricas
        - Astilleros 
        - fábricas de aviones 
        - trenes
    - ### Infraestructura
        - Puertos
        - Vías férreas y estaciones
        - Telecomunicaciones
        - Manzanas de ciudad
    - ### Produccion
        - Usinas y represas
        - Plantaciones
- Cuando un Pais adquiere una Construccion, se le reduce de sus recursos el costo de tal.
- Si una Construccion Consume Recursos X Ronda, se le Restan al Pais.
- si un **pais** adquiere una **construccion**. se le resta a sus recursos la cantidad del recursos correspondiente a la construccion en concreto.
- si una vez llegada a una *rondaConsumo* multiplo de 10, la suma de todos los consumos del **recurso** tipo PBN desde la ultima ronda multiplo de 10 no es mayor o igual a 2k. Se le agregara al atributo *deuda* de **pais**, 2k de las 10 rondas y luego un 50% de recargo.

## Gestión de transporte y comercio

 - El tipo de **Transporte** involucrado en un trueque debe pertenecer a:
    - **barcos de carga:** poseen capacidades de carga variables
    - **trenes:** permiten movilizar grandes volúmenes
    - **aviones de carga:** ofrecen menor capacidad 
- En cada truque se debe seleccionar un **Pais** *Responsable*
- La cantidad de **Recursos** del **pais** *incluida* en el **Truque** debe ser posible(NO ser mas de los recursos que tiene y poder trasladar esa cantidad con la capacidad fijada) 

## Gestion de Consumo
- CantXRonda de los recursos de tipo alimento y energia se ve proporcionalmente afectado por la cantidad de construcciones de tipo "manzanas de ciudad".
- Si un **Pais** NO cumple con su consumo de alimentos y energias en 10 Rondas, se agrega una Obvservacion al **Pais**.
- Si una **Pais** tiene mas de 2 *obvservaciones* :, *Perdio* su atributo que se le asigna al unirse, lo marcara como que ha perdido y no podra seguir jugando.
- *ConsumoManzanas* inidica la cantidad de recursos que debe consumir cada pais cada 10 rondas.

## Gestion De Logros
