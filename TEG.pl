
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

jugador(amarillo).  
jugador(magenta).
jugador(negro).
jugador(rojo).


paisesQueOcupa(magenta, [argentina, uruguay]).
paisesQueOcupa(negro, [chile, kamtchatka, australia, sumatra, java, borneo]).
paisesQueOcupa(amarillo, [brasil, alaska, yukon, canada, oregon, china, siberia, japon]).
objetivo(amarillo, [ocuparContinente(asia), ocuparPaises(20)]).
objetivo(rojo, [destruirJugador(negro)]).
objetivo(magenta, [destruirJugador(rojo)]).
objetivo(negro, [ocuparContinente(oceania), ocuparContinente(americaDelSur)]).


%1) cantidadPaises/2 que relaciona a un jugador con la cantidad de países que ocupa.z

cantidadPaises(Jugador,CantPaises):- paisesQueOcupa(Jugador,Paises),
                                                                    length(Paises,CantPaises).
cantidadPaises(Jugador,0):-jugador(Jugador),not(paisesQueOcupa(Jugador,_)).


%2) ocupa/2 que relaciona a un jugador con algún país que ocupa.
ocupa(Jugador,Pais):- paisesQueOcupa(Jugador,Paises),
                                       member(Pais,Paises).
 
/*3) estaPeleado/1 que se cumple para los continentes en los cuales todos los jugadores que siguen en juego ocupan algún país. Un jugador ya no está en juego si no ocupa ningún país.*/

estaPeleado(Continente):- continente(Continente),
                                               forall(estanEnJuego(Jugador),
                                               estaEnElContinente(Jugador,Continente)).

estaEnElContinente(Jugador, Continente):- paisContinente(Continente,Pais),ocupa(Jugador,Pais).

estanEnJuego(Jugador):-
cantidadPaises(Jugador,CantidadDePaises),CantidadDePaises > 0.


/*4)ocupaContinente/2 que relaciona un jugador y un continente si el jugador ocupa todos los países del mismo.*/

ocupaContinente(Jugador,Continente):- continente(Continente),jugador(Jugador),forall((paisContinente(Continente,Pais),ocupa(Jugador,Pais)).

%5)
seAtrinchero(Jugador):- jugador(Jugador),continente(Continente),estanEnJuego(Jugador),forall(ocupa(Jugador,Pais),paisContinente(Continente,Pais)).

%6)
capoCannoniere(Jugador):- jugador(Jugador),cantidadPaises(Jugador,CantPaises),
				 forall((jugador(Jugador2),Jugador\=Jugador2,
                                                 cantidadPaises(Jugador2,CantPaises2)),	
				 CantPaises>CantPaises2).






%7)  
ganador(Jugador):-  
objetivo(Jugador,Objetivos),		                  forall(member(Objetivo,Objetivos),cumpleObjetivo(Jugador,Objetivo)).

cumpleObjetivo(Jugador,ocuparContinente(Continente)):-
ocupaContinente(Jugador,Continente).

cumpleObjetivo(Jugador,ocuparPaises(CantidadDePaisesAOcupar)):-
cantidadPaises(Jugador,CantidadDePaises),
CantidadDePaises>=CantidadDePaisesAOcupar. 

cumpleObjetivo(Jugador,destruirJugador(Victima)):-
cantidadPaises(Victima,0).


