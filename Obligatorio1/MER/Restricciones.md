# Restricciones No Estrucutrales

## Gestión de partidas

- Cada **partida** debe tener un código único generado de forma aleatoria, el cual puede ser utilizado por otros jugadores para unirse a dicha **partida**. 
- Cada Jugador controla un **Pais** que le es asignado de 
forma aleatoria. 
- Los paises se delimitan de forma desigual tanto extension territorial como en **recursos**, En una **partida** no existen 2 paises con extension territorial y **recursos** identicos.
- El **Turno** de un **Jugador** se asigna aleatorioamente al **Unirse** a una **Partida**.
- Por cada **Ronda** cada **Jugador** tiene su respectivo **Turno** , cuando todos los **Turnos** pasan se avanza una **Ronda** *(NumRonda)*.

## Gestión de Recursos
- *Reglas** Las reglas deben cumplirse, de ser necesario se modifica la cantidad del recurso o el consumo/gasto de tales
- Solo existe un **Recurso** Tipo PBN por pais.
- Si un **Pais** no llega a consumir 2k unidades de PBN (**Recurso** del tipo PBN) a lo largo de 10 rondas. Se le agregrara al CumplimientoBasico 2k unidades mas el 50% del CumplimientoBasico actual.
- Los **recursos** de Un **Pais** pueden ser de tipo: construccion , consumo o PBN. 
    - Si es de construccion, el nombre debe ser: hierro (H), cemento (CE), aluminio (AL), plástico (PL), cobre (CO) y carbono (CB). 
    - Si es de consumo: petróleo (P), carbón (CA), alimentos (ALI) y energía eléctrica (kW).
- Al inicio de una Partida los **Recursos** de un **Pais** son 3, cada uno de distinto *tipo*, (los de consumo y construccion se deciden de forma aleatoria).
- **CantXRonda** puede incluir reglas de disminución o suspensión de producción, ya que es el total consumo(sea positivo o negativo) de ese recurso por ronda.
- Cada **Pais** produce automáticamente diez mil unidades de su producto básico cada diez **Rondas** (se le agregan 10k unidades a cant de **Recuros(Tipo PBN)** si *numRonda* multiplo de 10 ). 


## Gestión de construcciones e infraestructura

- El **Gasto y Consumo** de una Construccion debe ser algun recurso del pais.

- Una Contruccion puede pertenecer a uno de 3 grupos.
    - ## Fabricas
        - Astilleros 
        - fábricas de aviones 
        - trenes
    - ## Infraestructura
        - Puertos
        - Vías férreas y estaciones
        - Telecomunicaciones
        - Manzanas de ciudad
    - ## Produccion
        - Usinas y represas
        - Plantaciones
- Cuando un Pais adquiere una Construccion, se le reduce de sus recursos el costo de tal.
- Si una Construccion Consume Recursos X Ronda, se le Restan al Pais.
## Gestión de transporte y comercio

 - El tipo de **Transporte** involucrado en un trueque debe pertenecer a:
    - **barcos de carga:** poseen capacidades de carga variables
    - **trenes:** permiten movilizar grandes volúmenes
    - **aviones de carga:** ofrecen menor capacidad 

## Gestion de Consumo
- CantXRonda de los recursos de tipo alimento y energia se ve proporcionalmente afectado por la cantidad de construcciones de tipo "manzanas de ciudad".
- Si un Pais NO cumple con su consumo de alimentos y energias en 10 Rondas, se agrega una Obvservacion al Pais.
- Si una Pais tiene mas de 2 obvservaciones seguidas Pierde.

## Gestion De Logros
