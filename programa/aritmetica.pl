%Entradas: Una lista de numeros
%Salidas: Suma de los numeros
%Restricciones: No puede poseer atomos o algun otro valor que no sea numerico
%Objetivo: Manejar sumas del usuario
suma_lista([], 0).
suma_lista([X|Xs], Suma) :-
    suma_lista(Xs, Resto),
    Suma is X + Resto.

%Entradas: Una lista de numeros
%Salidas: Resta de los numeros
%Restricciones: No puede poseer atomos o algun otro valor no numerico
%Objetivo: Manejar restas del usuario
resta_lista([], Resta, Resta).
resta_lista([X|Xs], Acum, Resta) :-
    NuevoAcum is Acum - X,
    resta_lista(Xs, NuevoAcum, Resta).

%Entradas: Una lista de numeros
%Salidas: Multiplicacion de los numeros
%Restricciones: No puede poseer atomos o algun otro valor no numerico
%Objetivo: Manejar multiplicaciones del usuario
multiplicacion_lista([], 1).
multiplicacion_lista([X|Xs], Producto) :-
    multiplicacion_lista(Xs, Resto),
    Producto is X * Resto.

%Entradas: Una lista de numeros
%Salidas: Division de los numeros
%Restricciones: No puede poseer atomos o algun otro valor no numerico
%Objetivo: Manejar divisiones del usuario
division_lista([X], X).
division_lista([], 1).
division_lista([X,Y|Resto], Division) :-
    Y =\= 0,  % Asegura que no estamos dividiendo por cero
    Z is X / Y,  % Divide X por Y
    division_lista([Z|Resto], Division).  % Llama recursivamente a la función con el resultado y el resto de la lista

%Entradas: Una lista de numeros
%Salidas: Modulo consecutivo de los numeros
%Restricciones: No puede poseer atomos o algun otro valor no numerico
%Objetivo: Manejar modulos del usuario
modulo_lista([], 0).
modulo_lista([X], X).
modulo_lista([X, Y|Xs], Modulo) :-
    Y \= 0,
    Temp is X mod Y,
    modulo_lista([Temp|Xs], Modulo).

%Entradas: Una lista de numeros
%Salidas: Potencia consecutiva de los numeros
%Restricciones: No puede poseer atomos o algun otro valor no numerico
%Objetivo: Manejar potencias del usuario
potencia_lista([X], X).
potencia_lista([], 1).
potencia_lista([X,Y|Resto], Resultado) :-
    Z is X**Y,
    potencia_lista([Z|Resto], Resultado).

%Entradas: Una lista de numeros
%Salidas: Raiz consecutiva de los numeros
%Restricciones: No puede poseer atomos o algun otro valor no numerico
%Objetivo: Manejar raices cuadradas del usuario
raiz_cuadrada(Numero, Raiz) :-
    Raiz is sqrt(Numero).

%Entradas: Una lista
%Salidas: El largo de la lista
%Restricciones: Debe ser una lista
%Objetivo: Obtener el largo de cualquier lista
longitud_lista([], 0).
longitud_lista([_|Xs], Longitud) :-
    longitud_lista(Xs, Resto),
    Longitud is Resto + 1.

%Entradas: Lista de listas
%Salidas: Una lista con todos los elementos de las listas
%Restricciones: Debe ser una lista de listas
%Objetivo: Obtener fusiones de listas
concatenacion_listas([], []).
concatenacion_listas([X|Xs], Lista) :-
    concatenacion_listas(Xs, Resultado),
    append(X, Resultado, Lista).

%Entradas: Una lista
%Salidas: Lista revertida
%Restricciones: Solo acepta listas
%Objetivo: Obtener listas revertidas
reverso_lista(Lista, Reverso) :-
    reverso_auxiliar(Lista, [], Reverso).

reverso_auxiliar([], Acumulador, Acumulador).
reverso_auxiliar([X|Xs], Acumulador, Reverso) :-
    reverso_auxiliar(Xs, [X|Acumulador], Reverso).

%Entradas: Una lista
%Salidas: El primer elemento de una lista
%Restricciones: Solo acepta listas
%Objetivo: Obtener el primer elemento
primer_elemento([X|_], X).

%Entradas: Una lista
%Salidas: El ultimo elemento de una lista
%Restricciones: Solo acepta listas
%Objetivo: Obtener el ultimo elemento
ultimo_elemento([X], X).
ultimo_elemento([_|Xs], Ultimo) :-
    ultimo_elemento(Xs, Ultimo).

%Entradas: Una lista
%Salidas: El numero de mayor valor en una lista
%Restricciones: No puede poseer atomos o algun otro valor no numerico
%Objetivo: Obtener numero maximo
maximo_lista([X], X).
maximo_lista([X|Xs], Max) :-
    maximo_lista(Xs, MaxResto),
    Max is max(X, MaxResto).

%Entradas: Una lista
%Salidas: El numero de minimo valor en una lista
%Restricciones: No puede poseer atomos o algun otro valor no numerico
%Objetivo: Obtener numero minimo
minimo_lista([X], X).
minimo_lista([X|Xs], Min) :-
    minimo_lista(Xs, MinResto),
    Min is min(X, MinResto).

%Entradas: Una lista
%Salidas: El enesimo elemento de una lista
%Restricciones: Solo acepta listas
%Objetivo: Obtener el enesimo elemento
nesimo_elemento([X|_], 1, X).
nesimo_elemento([_|Xs], N, Elemento) :-
    N > 1,
    N1 is N - 1,
    nesimo_elemento(Xs, N1, Elemento).

%Entradas: Una lista
%Salidas: True si existe, de lo contrario false
%Restricciones: Solo acepta listas
%Objetivo: Obtener la existencia de un elemento
existe_elemento([X|_], X).
existe_elemento([_|Xs], Elemento) :-
    existe_elemento(Xs, Elemento).

%Entradas: Una lista
%Salidas: Lista con elemento eliminado
%Restricciones: Solo acepta listas
%Objetivo: Obtener lista nueva
eliminar_elemento([], _, []).
eliminar_elemento([X|Xs], X, Resultado) :-
    eliminar_elemento(Xs, X, Resultado).
eliminar_elemento([Y|Xs], X, [Y|Resultado]) :-
    X \= Y,
    eliminar_elemento(Xs, X, Resultado).

%Entradas: Una lista de palabras
%Salidas: La palabra con mas letras
%Restricciones: Solo acepta listas
%Objetivo: Obtener la palabra mas larga
palabraLarga(PalabrasClave, PalabraMasLarga) :-
    maplist(atom_length, PalabrasClave, Longitudes),
    max_list(Longitudes, LongitudMaxima),
    nth0(Indice, Longitudes, LongitudMaxima),
    nth0(Indice, PalabrasClave, PalabraMasLarga).

%Entradas: Nada
%Salidas: Imprimir todos los predicados guardados
%Restricciones: Deben existir los archivos de los predicados
%Objetivo: Obtener los predicados guardados y los del sistema
imprimirPredicados() :-
    open('predicados.pl', read, Stream),
    imprimirPredicadosAux(Stream),
    open('verboMaquina.pl', read, Stream2),
    imprimirPredicadosAux(Stream2),
    open('formas.pl', read, Stream3),
    imprimirPredicadosAux(Stream3).

imprimirPredicadosAux(Stream) :-
    read(Stream, Linea),
    (   at_end_of_stream(Stream)
    ->  true
    ;   write(Linea), nl,
        imprimirPredicadosAux(Stream)
    ).

%Entradas: Un predicado
%Salidas: Creacion de un predicado
%Restricciones: Debe poseer la estructura de un predicado
%Objetivo: Creacion de predicados en un archivo
crearPredicado(Predicados) :-
    catch(crearPredicadoAux(Predicados), _, fail).

crearPredicado(_) :-
    write('Estas intentando definir un nuevo predicado, pero este es estatico y no lo puedo redefinir.').

crearPredicadoAux([]) :-
    write('El predicado que escribiste no tiene la estructura correcta.').

crearPredicadoAux(Predicados) :-
    nth0(0, Predicados, Predicado),
    assert(Predicado),
    term_to_atom(Predicado, Cadena),
    atom_concat(Cadena, '.\n', PredicadoString),
    append('predicados.pl'),
    write(PredicadoString),
    told,
    write('He guardado el predicado.').