TEG
===
[functores, polimorfismo, listas, forall, inversibilidad, generación]

Se tiene la siguiente base de conocimientos que modela el estado actual de un tablero de TEG (sí, faltan 34 países, pueden completar libremente la base de conocimientos si quieren para que estén los 50).

continente(americaDelSur).
continente(americaDelNorte).
continente(asia).
continente(oceania).

paisContinente(americaDelSur,argentina).
paisContinente(americaDelSur,brasil).
paisContinente(americaDelSur,chile).
paisContinente(americaDelSur,uruguay).
paisContinente(americaDelNorte,alaska).
paisContinente(americaDelNorte,yukon).
paisContinente(americaDelNorte,canada).
paisContinente(americaDelNorte,oregon).
paisContinente(asia,kamtchatka).
paisContinente(asia,china).
paisContinente(asia,siberia).
paisContinente(asia,japon).
paisContinente(oceania,australia).
paisContinente(oceania,sumatra).
paisContinente(oceania,java).
paisContinente(oceania,borneo).

jugador(amarillo).  jugador(magenta).  
jugador(negro).     jugador(rojo).

paisesQueOcupa(magenta, [argentina, uruguay]).
paisesQueOcupa(negro, [chile, kamtchatka, australia, sumatra, java, borneo]).
paisesQueOcupa(amarillo, [brasil, alaska, yukon, canada, oregon, china, siberia, japon]).

objetivo(amarillo, [ocuparContinente(asia), ocuparPaises(20)]). 
objetivo(rojo, [destruirJugador(negro)]). 
objetivo(magenta, [destruirJugador(rojo)]). 
objetivo(negro, [ocuparContinente(oceania), ocuparContinente(americaDelSur)]). 


Se pide definir los siguientes predicados de modo que sean COMPLETAMENTE INVERSIBLES:

1. cantidadPaises/2 que relaciona a un jugador con la cantidad de países que ocupa. 
2. ocupa/2 que relaciona a un jugador con algún país que ocupa.
3. estaPeleado/1 que se cumple para los continentes en los cuales todos los jugadores que siguen en juego ocupan algún país. Un jugador ya no está en juego si no ocupa ningún país. 
4. ocupaContinente/2 que relaciona un jugador y un continente si el jugador ocupa todos los países del mismo.
5. seAtrinchero/1 que se cumple para los jugadores que ocupan países en un único continente.
6. capoCannoniere/1 que se cumple para el jugador que tiene ocupados más países. 
7. ganador/1: un jugador es ganador si logró todos sus objetivos.
Los objetivos se cumplen de la siguiente forma:
ocuparContinente: el jugador debe ocupar el continente indicado
ocuparPaises: el jugador debe ocupar al menos la cantidad de países indicada en total
destruirJugador: se cumple si el jugador indicado ya no ocupa ningún país
