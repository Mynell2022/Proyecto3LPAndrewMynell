:- consult('verboMaquina.pl').
:- consult('formas.pl').
:- consult('aritmetica.pl').
:- consult('filtrado.pl').
:- consult('temasTriviales').

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
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasChiste(Palabra), !, Accion = chiste.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasEstudio(Palabra), member(PalabraAux, Palabras), formasEstudioAux(PalabraAux), !, Accion = estudio.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasRefran(Palabra), !, Accion = refran.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasDespedida(Palabra), !, Accion = despedida.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasDespedida(Palabra), member(PalabraAux, Palabras), formasDespedidaAux(PalabraAux), !, Accion = despedida.
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

analizarAccionRealizar(estudio, _, _, _) :-
    write('Claro, aqui te muestro una tecnica que te puede servir: '),
    nl,
    random_between(1, 10, Opcion),
    consejosAleatorios(Opcion),
    chatbotAux.

analizarAccionRealizar(chiste, _, _, _) :-
    write('Claro, aqui te muestro un chiste que de seguro te hara: '),
    nl,
    random_between(1, 10, Opcion),
    chisteAleatorio(Opcion),
    chatbotAux.

analizarAccionRealizar(refran, _, _, _) :-
    write('Claro, aqui te muestro un refran que puedes utilizar: '),
    nl,
    random_between(1, 10, Opcion),
    refranesAleatorios(Opcion),
    chatbotAux.

analizarAccionRealizar(despedida, _, _, _) :-
    write('Hasta pronto joven').

analizarAccionRealizar(_, _, _, _) :-
    write('Lo siento, pero no puedo resolver tu solicitud.'),
    chatbotAux.