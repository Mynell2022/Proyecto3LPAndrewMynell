verboMaquina(haga).
verboMaquina(hacer).
verboMaquina(haz).

formasSuma(suma).
formasSuma(sumar).
formasSuma(sume).
formasResta(resta).
formasResta(restar).
formasResta(reste).
formasDivision(division).
formasDivision(dividir).
formasDivision(divide).
formasMultiplicacion(multiplicacion).
formasMultiplicacion(multiplicar).
formasMultiplicacion(multiplique).
formasModulo(modulo).
formasPotencia(elevado).
formasPotencia(eleva).
formasPotencia(elevar).
formasPotencia(eleve).
formasPotencia(potencia).
formasPotencia(potenciado).
formasRaiz(raiz).
formasRaizNumero(cuadrada).
formasRaizNumero(cuadrado).

formasCodigo(codifique).
formasCodigo(codigo).
formasCodigo(escriba).
formasCodigo(escribe).

chatbot() :-
    write('Bienvenido'),
    nl,
    chatbotAux().

chatbotAux() :-
    write('¿Hay algo en lo que pueda ayudarte?'),
    nl,
    read_line_to_string(user_input, Entrada),
    tokenizar(Entrada, Palabras),
    analizarOperaciones(Palabras, Operacion),
    analizarRealizar(Palabras, Realizar),
    analizarCrear(Palabras, Crear),nl,
    write(Operacion),nl,write(Realizar),nl,write(Crear),nl,
    analizarAccionRealizar(Operacion, Realizar, Crear, Palabras).

tokenizar(Texto, Palabras) :-
    atom_string(Atom, Texto),
    re_replace('[^a-zA-Z0-9 ]'/g, '', Atom, Resultado),  % Elimina caracteres no alfanuméricos
    atomic_list_concat(Palabras, ' ', Resultado).

analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasSuma(Palabra), !, Accion = suma.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasResta(Palabra), !, Accion = resta.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasDivision(Palabra), !, Accion = division.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasMultiplicacion(Palabra), !, Accion = multiplicacion.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasModulo(Palabra), !, Accion = modulo.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasPotencia(Palabra), !, Accion = potencia.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasRaiz(Palabra), !, member(PalabraAux, Palabras), formasRaizNumero(PalabraAux), !, Accion = raiz.
analizarOperaciones(_, Accion) :- Accion = nada.

analizarRealizar(Palabras, Accion) :- member(Palabra, Palabras), verboMaquina(Palabra), !, Accion = realizar.
analizarRealizar(_, Accion) :- Accion = nada.

analizarCrear(Palabras, Accion) :- member(Palabra, Palabras), formasCodigo(Palabra), !, Accion = crear.
analizarCrear(_, Accion) :- Accion = nada.

analizarAccionRealizar(suma, realizar, crear, Entrada) :- 
    write('Claro, aqui tienes el codigo de la suma: '),
    write(Entrada).

analizarAccionRealizar(resta, realizar, crear, Entrada) :- 
    write('Claro, aqui tienes el codigo de la resta: '),
    write(Entrada).

analizarAccionRealizar(division, realizar, crear, Entrada) :- 
    write('Claro, aqui tienes el codigo de la division: '),
    write(Entrada).

analizarAccionRealizar(multiplicacion, realizar, crear, Entrada) :- 
    write('Claro, aqui tienes el codigo de la multiplicacion: '),
    write(Entrada).

analizarAccionRealizar(modulo, realizar, crear, Entrada) :- 
    write('Claro, aqui tienes el codigo del modulo: '),
    write(Entrada).

analizarAccionRealizar(potencia, realizar, crear, Entrada) :- 
    write('Claro, aqui tienes el codigo del modulo: '),
    write(Entrada).

analizarAccionRealizar(raiz, realizar, crear, Entrada) :- 
    write('Claro, aqui tienes el codigo de la raiz cuadrada: '),
    write(Entrada).

analizarAccionRealizar(suma, realizar, _, Entrada) :-
    write('Claro, aqui tienes la respuesta de la suma: '),
    write(Entrada).

analizarAccionRealizar(resta, realizar, _, Entrada) :-
    write('Claro, aqui tienes la respuesta de la resta: '),
    write(Entrada).

analizarAccionRealizar(multiplicacion, realizar, _, Entrada) :-
    write('Claro, aqui tienes la respuesta de la multiplicacion: '),
    write(Entrada).

analizarAccionRealizar(division, realizar, _, Entrada) :-
    write('Claro, aqui tienes la respuesta de la division: '),
    write(Entrada).

analizarAccionRealizar(modulo, realizar, _, Entrada) :-
    write('Claro, aqui tienes la respuesta del modulo: '),
    write(Entrada).

analizarAccionRealizar(potencia, realizar, _, Entrada) :-
    write('Claro, aqui tienes la respuesta de la potencia: '),
    write(Entrada).

analizarAccionRealizar(raiz, realizar, _, Entrada) :-
    write('Claro, aqui tienes la respuesta de la raiz cuadrada: '),
    write(Entrada).

analizarAccionRealizar(suma, _, crear, Entrada) :-
    write('Claro, aqui tienes el codigo de la suma: '),
    write(Entrada).

analizarAccionRealizar(resta, _, crear, Entrada) :-
    write('Claro, aqui tienes el codigo de la resta: '),
    write(Entrada).

analizarAccionRealizar(multiplicacion, _, crear, Entrada) :-
    write('Claro, aqui tienes el codigo de la resta: '),
    write(Entrada).

analizarAccionRealizar(division, _, crear, Entrada) :-
    write('Claro, aqui tienes el codigo de la resta: '),
    write(Entrada).

analizarAccionRealizar(modulo, _, crear, Entrada) :-
    write('Claro, aqui tienes el codigo de la resta: '),
    write(Entrada).

analizarAccionRealizar(potencia, _, crear, Entrada) :-
    write('Claro, aqui tienes el codigo de la resta: '),
    write(Entrada).

analizarAccionRealizar(raiz, _, crear, Entrada) :-
    write('Claro, aqui tienes el codigo de la resta: '),
    write(Entrada).

analizarAccionRealizar(suma, _, _, Entrada) :-
    write('Claro, aqui tienes la respuesta de la suma: '),
    write(Entrada).

analizarAccionRealizar(resta, _, _, Entrada) :-
    write('Claro, aqui tienes la respuesta de la resta: '),
    write(Entrada).

analizarAccionRealizar(multiplicacion, _, _, Entrada) :-
    write('Claro, aqui tienes la respuesta de la multiplicacion: '),
    write(Entrada).

analizarAccionRealizar(division, _, _, Entrada) :-
    write('Claro, aqui tienes la respuesta de la division: '),
    write(Entrada).

analizarAccionRealizar(modulo, _, _, Entrada) :-
    write('Claro, aqui tienes la respuesta del modulo: '),
    write(Entrada).

analizarAccionRealizar(potencia, _, _, Entrada) :-
    write('Claro, aqui tienes la respuesta de la potencia: '),
    write(Entrada).

analizarAccionRealizar(raiz, _, _, Entrada) :-
    write('Claro, aqui tienes la respuesta de la raiz: '),
    write(Entrada).

analizarAccionRealizar(_, _, _, _) :-
    write('Lo siento, pero no puedo resolver tu solicitud.').

suma_lista([], 0).
suma_lista([X|Xs], Suma) :-
    suma_lista(Xs, Resto),
    Suma is X + Resto.

resta_lista([], 0).
resta_lista([X|Xs], Resta) :-
    resta_lista(Xs, Resto),
    Resta is X - Resto.

multiplicacion_lista([], 1).
multiplicacion_lista([X|Xs], Producto) :-
    multiplicacion_lista(Xs, Resto),
    Producto is X * Resto.

division_lista([], 0).
division_lista([X|Xs], Division) :-
    division_lista(Xs, Resto),
    Resto \= 0,
    Division is X / Resto.

modulo_lista([], 0).
modulo_lista([X|Xs], Modulo) :-
    modulo_lista(Xs, Resto),
    integer(Resto),
    Modulo is X mod Resto.

potencia(Base, Exponente, Resultado) :-
    Resultado is Base ** Exponente.

raiz_cuadrada(Numero, Raiz) :-
    Raiz is sqrt(Numero).

longitud_lista([], 0).
longitud_lista([_|Xs], Longitud) :-
    longitud_lista(Xs, Resto),
    Longitud is Resto + 1.

concatenacion_listas([], Lista, Lista).
concatenacion_listas([X|Xs], Lista2, [X|Resultado]) :-
    concatenacion_listas(Xs, Lista2, Resultado).

reverso_lista(Lista, Reverso) :-
    reverso_auxiliar(Lista, [], Reverso).

reverso_auxiliar([], Acumulador, Acumulador).
reverso_auxiliar([X|Xs], Acumulador, Reverso) :-
    reverso_auxiliar(Xs, [X|Acumulador], Reverso).

primer_elemento([X|_], X).

ultimo_elemento([X], X).
ultimo_elemento([_|Xs], Ultimo) :-
    ultimo_elemento(Xs, Ultimo).

maximo_lista([X], X).
maximo_lista([X|Xs], Max) :-
    maximo_lista(Xs, MaxResto),
    Max is max(X, MaxResto).

minimo_lista([X], X).
minimo_lista([X|Xs], Min) :-
    minimo_lista(Xs, MinResto),
    Min is min(X, MinResto).

nesimo_elemento([X|_], 1, X).
nesimo_elemento([_|Xs], N, Elemento) :-
    N > 1,
    N1 is N - 1,
    nesimo_elemento(Xs, N1, Elemento).

existe_elemento([X|_], X).
existe_elemento([_|Xs], Elemento) :-
    existe_elemento(Xs, Elemento).

eliminar_elemento([], _, []).
eliminar_elemento([X|Xs], X, Resultado) :-
    eliminar_elemento(Xs, X, Resultado).
eliminar_elemento([Y|Xs], X, [Y|Resultado]) :-
    X \= Y,
    eliminar_elemento(Xs, X, Resultado).

insertar_predicados([]).
insertar_predicados([Predicado|Resto]) :-
    assert(Predicado),
    insertar_predicados(Resto).

imprimir_predicados :-
    current_predicate(_, Predicado),
    functor(Predicado, Nombre, _),
    write(Nombre), nl,
    fail.
imprimir_predicados :- !.