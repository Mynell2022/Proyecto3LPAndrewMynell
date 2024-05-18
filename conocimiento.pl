verboMaquina(haga).
verboMaquina(hacer).
verboMaquina(haz).
verboMaquina(hazme).
verboMaquina(resuelva).
verboMaquina(resuelveme).
verboMaquina(calcule).
verboMaquina(calculame).
verboMaquina(calculeme).
verboMaquina(compute).
verboMaquina(computame).
verboMaquina(evalua).
verboMaquina(evaluar).
verboMaquina(evaluame).
verboMaquina(operar).
verboMaquina(operame).
verboMaquina(procesa).
verboMaquina(procesame).


formasSuma(suma).
formasSuma(sumar).
formasSuma(sume).
formasSuma(sumale).
formasSuma(sumele).
formasResta(resta).
formasResta(restar).
formasResta(reste).
formasResta(restale).
formasResta(restele).
formasDivision(division).
formasDivision(dividir).
formasDivision(divide).
formasDivision(dividele).
formasDivision(dividale).
formasMultiplicacion(multiplicacion).
formasMultiplicacion(multiplicar).
formasMultiplicacion(multiplique).
formasMultiplicacion(multipliquele).
formasMultiplicacion(multiplicale).
formasModulo(modulo).
formasPotencia(elevado).
formasPotencia(eleva).
formasPotencia(elevar).
formasPotencia(eleve).
formasPotencia(elevele).
formasPotencia(elevale).
formasPotencia(potencia).
formasPotencia(potenciado).
formasRaiz(raiz).
formasRaizNumero(cuadrada).
formasRaizNumero(cuadrado).
formasLongitud(largo).
formasLongitud(longitud).
formasLongitud(cantidad).
formasLongitud(elementos).
formasLongitud(cuente).
formasLongitud(cuenteme).
formasLongitud(cuentame).
formasConcatenar(concatenar).
formasConcatenar(concatene).
formasConcatenar(concatena).
formasConcatenar(unir).
formasConcatenar(une).
formasConcatenar(uneme).
formasReverso(reves).
formasReverso(reverso).
formasReverso(reversa).
formasReverso(inversa).
formasReverso(inverso).
formasReverso(invertir).
formasReverso(invierte).
formasReverso(invierteme).
formasReverso(inviertame).
formasReverso(invierta).
formasPrimero(primer).
formasPrimero(primero).
formasPrimero(primera).
formasUltimo(ultimo).
formasMaximo(maximo).
formasMaximo(grande).
formasMaximo(alto).
formasMaximo(maxima).
formasMinimo(minimo).
formasMinimo(minima).
formasMinimo(pequeno).
formasMinimo(bajo).
formasIndice(indice).
formasIndice(posicion).
formasExiste(existe).
formasExiste(encuentra).
formasExiste(encuentre).
formasExiste(esta).
formasEliminar(elimine).
formasEliminar(elimina).
formasEliminar(borrar).
formasEliminar(borre).
formasEliminar(quitar).
formasEliminar(quite).

formasCodigo(codifique).
formasCodigo(codigo).
formasCodigo(codificar).
formasCodigo(escriba).
formasCodigo(escribe).
formasCodigo(escribame).
formasCodigo(escribir).
formasCodigo(generar).
formasCodigo(generarme).
formasCodigo(crear).
formasCodigo(programar).
formasCodigo(programame).
formasCodigo(desarrollar).
formasCodigo(desarrollame).
formasCodigo(produzca).
formasCodigo(produzcame).
formasCodigo(componer).
formasCodigo(compongame).
formasCodigo(construir).
formasCodigo(construyeme).
formasCodigo(elaborar).
formasCodigo(elaboreme).
formasCodigo(fabricar).
formasCodigo(fabricame).


chatbot() :-
    write('Bienvenido'),
    nl,
    chatbotAux().

chatbotAux() :-
    nl,
    nl,
    write('¿Hay algo en lo que pueda ayudarte?'),
    nl,
    read_line_to_string(user_input, Entrada),
    tokenizar(Entrada, Palabras),
    analizarOperaciones(Palabras, Operacion),
    analizarRealizar(Palabras, Realizar),
    analizarCrear(Palabras, Crear),nl,
    write(Operacion),nl,write(Realizar),nl,write(Crear),nl,
    analizarAccionRealizar(Operacion, Realizar, Crear, Entrada).

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
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasRaiz(Palabra), member(PalabraAux, Palabras), formasRaizNumero(PalabraAux), !, Accion = raiz.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasLongitud(Palabra), !, Accion = longitud.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasConcatenar(Palabra), !, Accion = concatena.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasReverso(Palabra), !, Accion = reverso.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasPrimero(Palabra), !, Accion = primero.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasUltimo(Palabra), !, Accion = ultimo.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasMinimo(Palabra), !, Accion = minimo.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasMaximo(Palabra), !, Accion = maximo.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasIndice(Palabra), !, Accion = indice.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasExiste(Palabra), !, Accion = existe.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasEliminar(Palabra), !, Accion = elimina.
analizarOperaciones(_, Accion) :- Accion = nada.

analizarRealizar(Palabras, Accion) :- member(Palabra, Palabras), verboMaquina(Palabra), !, Accion = realizar.
analizarRealizar(_, Accion) :- Accion = nada.

analizarCrear(Palabras, Accion) :- member(Palabra, Palabras), formasCodigo(Palabra), !, Accion = crear.
analizarCrear(_, Accion) :- Accion = nada.

analizarAccionRealizar(suma, realizar, crear, Entrada) :- 
    !,
    write('Claro, aqui tienes el codigo de la suma: '),
    write(Entrada),
    chatbotAux.

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
    !,
    filtrarNumeros(Entrada, Salida),
    suma_lista(Salida, Resultado),
    write('Claro, el resultado de la suma es '),
    write(Resultado),
    chatbotAux.

analizarAccionRealizar(resta, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    resta_lista(Salida, Resultado),
    write('Claro, el resultado de la resta es '),
    write(Resultado),
    chatbotAux.

analizarAccionRealizar(multiplicacion, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    multiplicacion_lista(Salida, Resultado),
    write('Claro, el resultado de la multiplicacion es '),
    write(Resultado),
    chatbotAux.

analizarAccionRealizar(division, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    division_lista(Salida, Resultado),
    write('Claro, el resultado de la division es '),
    write(Resultado),
    chatbotAux.

analizarAccionRealizar(modulo, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    modulo_lista(Salida, Resultado),
    write('Claro, el resultado del modulo es '),
    write(Resultado),
    chatbotAux.

analizarAccionRealizar(potencia, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    potencia_lista(Salida, Resultado),
    write('Claro, el resultado de la potencia es '),
    write(Resultado),
    chatbotAux.

analizarAccionRealizar(raiz, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    nth0(0, Salida, Numero),
    raiz_cuadrada(Numero, Resultado),
    write('Claro, el resultado de la raiz cuadrada es '),
    write(Resultado),
    chatbotAux.

analizarAccionRealizar(longitud, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    longitud_lista(Lista, Cantidad),
    write('Claro, la longitud de la lista es '),
    write(Cantidad),
    nl,
    chatbotAux.

analizarAccionRealizar(concatena, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    concatenacion_listas(Salida, Cantidad),
    write('Claro, el resultado de la concatenacion es '),
    write(Cantidad),
    nl,
    chatbotAux.

analizarAccionRealizar(reverso, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    reverso_lista(Lista, Cantidad),
    write('Claro, la lista inversa es '),
    write(Cantidad),
    nl,
    chatbotAux.

analizarAccionRealizar(primero, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    primer_elemento(Lista, Cantidad),
    write('Claro, el primer elemento es '),
    write(Cantidad),
    nl,
    chatbotAux.

analizarAccionRealizar(ultimo, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    ultimo_elemento(Lista, Cantidad),
    write('Claro, el ultimo elemento es '),
    write(Cantidad),
    nl,
    chatbotAux.

analizarAccionRealizar(maximo, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    maximo_lista(Lista, Cantidad),
    write('Claro, el elemento maximo es '),
    write(Cantidad),
    nl,
    chatbotAux.

analizarAccionRealizar(minimo, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    minimo_lista(Lista, Cantidad),
    write('Claro, el elemento minimo es '),
    write(Cantidad),
    nl,
    chatbotAux.

analizarAccionRealizar(indice, realizar, _, Entrada) :-
    write("Claro, el elemento es "),
    filtrarListas(Entrada, Salida),
    write(Salida),
    chatbotAux.

analizarAccionRealizar(existe, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    write(Salida),
    chatbotAux.

analizarAccionRealizar(elimina, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    write(Salida),
    chatbotAux.

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
    !,
    filtrarNumeros(Entrada, Salida),
    suma_lista(Salida, Resultado),
    write('Claro, el resultado de la suma es '),
    write(Resultado),
    chatbotAux.

analizarAccionRealizar(resta, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    resta_lista(Salida, Resultado),
    write('Claro, el resultado de la resta es '),
    write(Resultado),
    chatbotAux.

analizarAccionRealizar(multiplicacion, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    multiplicacion_lista(Salida, Resultado),
    write('Claro, el resultado de la multiplicacion es '),
    write(Resultado),
    chatbotAux.

analizarAccionRealizar(division, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    division_lista(Salida, Resultado),
    write('Claro, el resultado de la division es '),
    write(Resultado),
    chatbotAux.

analizarAccionRealizar(modulo, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    modulo_lista(Salida, Resultado),
    write('Claro, el resultado del modulo es '),
    write(Resultado),
    chatbotAux.

analizarAccionRealizar(potencia, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    potencia_lista(Salida, Resultado),
    write('Claro, el resultado de la potencia es '),
    write(Resultado),
    chatbotAux.

analizarAccionRealizar(raiz, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    nth0(0, Salida, Numero),
    raiz_cuadrada(Numero, Resultado),
    write('Claro, el resultado de la raiz cuadrada es '),
    write(Resultado),
    chatbotAux.

analizarAccionRealizar(longitud, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    longitud_lista(Lista, Cantidad),
    write('Claro, la longitud de la lista es '),
    write(Cantidad),
    nl,
    chatbotAux.

analizarAccionRealizar(concatena, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    concatenacion_listas(Salida, Cantidad),
    write('Claro, el resultado de la concatenacion es '),
    write(Cantidad),
    nl,
    chatbotAux.

analizarAccionRealizar(reverso, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    reverso_lista(Lista, Cantidad),
    write('Claro, la lista inversa es '),
    write(Cantidad),
    nl,
    chatbotAux.

analizarAccionRealizar(primero, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    primer_elemento(Lista, Cantidad),
    write('Claro, el primer elemento es '),
    write(Cantidad),
    nl,
    chatbotAux.

analizarAccionRealizar(ultimo, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    ultimo_elemento(Lista, Cantidad),
    write('Claro, el ultimo elemento es '),
    write(Cantidad),
    nl,
    chatbotAux.

analizarAccionRealizar(maximo, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    maximo_lista(Lista, Cantidad),
    write('Claro, el elemento maximo es '),
    write(Cantidad),
    nl,
    chatbotAux.

analizarAccionRealizar(minimo, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    minimo_lista(Lista, Cantidad),
    write('Claro, el elemento minimo es '),
    write(Cantidad),
    nl,
    chatbotAux.

analizarAccionRealizar(indice, _, _, Entrada) :-
    write("Claro, el elemento es "),
    filtrarListas(Entrada, Salida),
    write(Salida),
    chatbotAux.

analizarAccionRealizar(existe, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    write(Salida),
    chatbotAux.

analizarAccionRealizar(elimina, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    write(Salida),
    chatbotAux.

analizarAccionRealizar(_, _, _, _) :-
    write('Lo siento, pero no puedo resolver tu solicitud.').

filtrarNumeros(Entrada, Salida) :-
    reemplazarNoDigitos(Entrada, EntradaReemplazada),
    atom_string(Atom, EntradaReemplazada),  % Convierte la cadena de entrada en un átomo
    re_replace('[^0-9\\. ]'/g, '', Atom, Resultado),  % Elimina todos los caracteres que no son dígitos ni espacios
    atomic_list_concat(ListaDeAtomos, ' ', Resultado),  % Divide el átomo resultante en una lista de átomos
    exclude(atom_string(''), ListaDeAtomos, ListaDeAtomosNoVacios),  % Ignora los átomos que son cadenas vacías
    maplist(atom_number, ListaDeAtomosNoVacios, Salida).  % Convierte cada átomo en un número y los pone en la lista de salida

filtrarNumeros(_, _) :-
    nl,
    write('No has escrito todos los numeros de manera correcta'),
    chatbotAux.

% Regla para reemplazar todos los caracteres que no son dígitos ni espacios en un átomo por espacios
reemplazarNoDigitos(Entrada, Salida) :-
    atom_chars(Entrada, ListaCaracteres),
    reemplazarNoDigitosAux(ListaCaracteres, ListaSalida),
    atom_chars(Salida, ListaSalida).

reemplazarNoDigitosAux([], []).
reemplazarNoDigitosAux([Caracter|RestoEntrada], [NuevoCaracter|RestoSalida]) :-
    char_code(Caracter, CodigoCaracter),
    char_code('0', Codigo0),
    char_code('9', Codigo9),
    char_code('.', CodigoPunto),
    (   (CodigoCaracter >= Codigo0, CodigoCaracter =< Codigo9 ; CodigoCaracter = CodigoPunto) -> NuevoCaracter = Caracter ; NuevoCaracter = ' '),
    reemplazarNoDigitosAux(RestoEntrada, RestoSalida).

filtrarListas(String, NuevaLista) :-
    split_string(String, " ", "", ListaSubcadenas),
    transformarStringALista(ListaSubcadenas, NuevaLista).

transformarStringALista([], []).
transformarStringALista([Palabra|Cola], Lista) :-
    transformarStringALista(Cola, NuevaLista),
    transformarStringAListaAux(Palabra, ListaEntrada),
    agregarListaCreada(ListaEntrada, NuevaLista, Lista).

transformarStringAListaAux(String, NuevaLista) :- 
    atom_chars(String, ListaCaracteres),
    memberchk('[', ListaCaracteres),
    memberchk(']', ListaCaracteres),
    memberchk(',', ListaCaracteres),
    term_string(NuevaLista, String).

transformarStringAListaAux(_, []).

agregarListaCreada([], NuevaLista, Lista) :- !, Lista = NuevaLista.
agregarListaCreada(ListaEntrada, NuevaLista, Lista) :- Lista = [ListaEntrada|NuevaLista].

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