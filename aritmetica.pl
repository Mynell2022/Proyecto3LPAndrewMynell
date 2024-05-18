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

division_lista([X], X).
division_lista([], 1).
division_lista([X,Y|Resto], Division) :-
    Y =\= 0,  % Asegura que no estamos dividiendo por cero
    Z is X / Y,  % Divide X por Y
    division_lista([Z|Resto], Division).  % Llama recursivamente a la función con el resultado y el resto de la lista

modulo_lista([], 0).
modulo_lista([X], X).
modulo_lista([X, Y|Xs], Modulo) :-
    Y \= 0,
    Temp is X mod Y,
    modulo_lista([Temp|Xs], Modulo).

potencia_lista([X], X).
potencia_lista([], 1).
potencia_lista([X,Y|Resto], Resultado) :-
    Z is X**Y,  % Eleva X a la potencia Y
    potencia_lista([Z|Resto], Resultado).

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