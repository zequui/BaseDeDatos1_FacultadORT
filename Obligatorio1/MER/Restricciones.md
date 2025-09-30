# Restricciones No Estrucutrales

## Gestión de partidas

- Cada **partida** debe tener un código único generado de forma aleatoria, el cual puede ser utilizado por otros jugadores para unirse a dicha **partida**. 
- Cada Jugador controla un **Pais** que le es asignado de 
forma aleatoria. 
- Los paises se delimitan de forma desigual tanto extension territorial como en recursos, En una **partida** no existen 2 paises con extension territorial y recursos identicos.

## Gestión de Recursos

- Los **recursos** de Un **Pais** pueden ser de tipo: construccion y consumo. 
    - Si es de construccion, el nombre debe ser: hierro (H), cemento (CE), aluminio (AL), plástico (PL), cobre (CO) y carbono (CB). 
    - Si es de consumo: petróleo (P), carbón (CA), alimentos (ALI) y energía eléctrica (kW).
- **CantXRonda** puede incluir reglas de disminución o suspensión de producción

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

## Gestión de transporte y comercio

 - El tipo de **Transporte** involucrado en un trueque debe pertenecer a:
    - barcos de carga: poseen capacidades de carga variables
    - trenes:  permiten movilizar grandes volúmenes
    - aviones de carga: ofrecen menor capacidad 

