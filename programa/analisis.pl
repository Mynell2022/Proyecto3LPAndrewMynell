:- consult('generar.pl').


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
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasCodigo(Palabra), !, Accion = codifica.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasPredicado(Palabra), member(PalabraAux, Palabras), formasImprimir(PalabraAux), !, Accion = imprimirPredicado.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasPredicado(Palabra), member(PalabraAux, Palabras), formasGuardarPredicado(PalabraAux), !, Accion = guardarPredicado.
analizarOperaciones(_, Accion) :- Accion = nada.

analizarRealizar(Palabras, Accion) :- member(Palabra, Palabras), verboMaquina(Palabra), !, Accion = realizar.
analizarRealizar(_, Accion) :- Accion = nada.

analizarCrear(Palabras, Accion) :- member(Palabra, Palabras), formasCodigo(Palabra), !, Accion = crear.
analizarCrear(_, Accion) :- Accion = nada.

analizarAccionRealizar(suma, realizar, crear, Entrada) :- 
    !,
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
    !,
    filtrarNumeros(Entrada, Salida),
    suma_lista(Salida, Resultado),
    write('Claro, el resultado de la suma es '),
    write(Resultado).

analizarAccionRealizar(resta, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    resta_lista(Salida, 0, Resultado),
    write('Claro, el resultado de la resta es '),
    write(Resultado).

analizarAccionRealizar(multiplicacion, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    multiplicacion_lista(Salida, Resultado),
    write('Claro, el resultado de la multiplicacion es '),
    write(Resultado).

analizarAccionRealizar(division, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    division_lista(Salida, Resultado),
    write('Claro, el resultado de la division es '),
    write(Resultado).

analizarAccionRealizar(modulo, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    modulo_lista(Salida, Resultado),
    write('Claro, el resultado del modulo es '),
    write(Resultado).

analizarAccionRealizar(potencia, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    potencia_lista(Salida, Resultado),
    write('Claro, el resultado de la potencia es '),
    write(Resultado).

analizarAccionRealizar(raiz, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    nth0(0, Salida, Numero),
    raiz_cuadrada(Numero, Resultado),
    write('Claro, el resultado de la raiz cuadrada es '),
    write(Resultado).

analizarAccionRealizar(longitud, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    longitud_lista(Lista, Cantidad),
    write('Claro, la longitud de la lista es '),
    write(Cantidad),
    nl.

analizarAccionRealizar(concatena, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    \+ is_empty(Salida),
    concatenacion_listas(Salida, Cantidad),
    write('Claro, el resultado de la concatenacion es '),
    write(Cantidad),
    nl.

analizarAccionRealizar(reverso, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    reverso_lista(Lista, Cantidad),
    write('Claro, la lista inversa es '),
    write(Cantidad),
    nl.

analizarAccionRealizar(primero, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    primer_elemento(Lista, Cantidad),
    write('Claro, el primer elemento es '),
    write(Cantidad),
    nl.

analizarAccionRealizar(ultimo, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    ultimo_elemento(Lista, Cantidad),
    write('Claro, el ultimo elemento es '),
    write(Cantidad),
    nl.

analizarAccionRealizar(maximo, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    maximo_lista(Lista, Cantidad),
    write('Claro, el elemento maximo es '),
    write(Cantidad),
    nl.

analizarAccionRealizar(minimo, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    minimo_lista(Lista, Cantidad),
    write('Claro, el elemento minimo es '),
    write(Cantidad),
    nl.

analizarAccionRealizar(indice, realizar, _, Entrada) :-
    write("Claro, el elemento es "),
    filtrarListas(Entrada, L),
    nth0(0, L, Lista),
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    IndiceStr = SubMatch.1,
    atom_number(IndiceStr, Indice),
    nesimo_elemento(Lista, Indice, Salida),
    write(Salida).

analizarAccionRealizar(existe, realizar, _, Entrada) :-
    filtrarListas(Entrada, L),
    nth0(0, L, Lista),
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    IndiceStr = SubMatch.1,
    atom_number(IndiceStr, Elemento),nl,
    (   existe_elemento(Lista, Elemento)
    ->  write("Si que existe "), write(Elemento), write(" en la lista"), nl
    ;   write("No existe el elemento "), write(Elemento), write(" en la lista"), nl
    ).

analizarAccionRealizar(elimina, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    write(Salida).

analizarAccionRealizar(suma, _, crear, _) :-
    write('Claro, aqui tienes el codigo de la suma: '),nl,
    generarCodigo(suma,Codigo),
    write(Codigo).

analizarAccionRealizar(resta, _, crear, _) :-
    write('Claro, aqui tienes el codigo de la resta: '),nl,
    generarCodigo(resta, Codigo),
    write(Codigo).

analizarAccionRealizar(multiplicacion, _, crear, _) :-
    write('Claro, aqui tienes el codigo de la multiplicacion: '),nl,
    generarCodigo(multiplicacion,Codigo),
    write(Codigo).

analizarAccionRealizar(division, _, crear, _) :-
    write('Claro, aqui tienes el codigo de la division: '),nl,
    generarCodigo(division,Codigo),
    write(Codigo).

analizarAccionRealizar(modulo, _, crear, _) :-
    generarCodigo(modulo,Codigo),
    write('Claro, aqui tienes el codigo de la modulo: '),nl,
    write(Codigo).

analizarAccionRealizar(potencia, _, crear, _) :-
    write('Claro, aqui tienes el codigo de la potencia: '),nl,
    generarCodigo(potencia,Codigo),
    write(Codigo).
analizarAccionRealizar(raiz, _, crear, _) :-
    write('Claro, aqui tienes el codigo de la raiz: '),nl,
    generarCodigo(raiz,Codigo),
    write(Codigo).

analizarAccionRealizar(codifica, _, crear, Entrada) :-
    write('Claro, aqui tienes el codigo mas cercano en nuestro conocimiento: '),nl,
    write(Entrada).

analizarAccionRealizar(suma, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    suma_lista(Salida, Resultado),
    write('Claro, el resultado de la suma es '),
    write(Resultado).

analizarAccionRealizar(resta, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    [Numero|SalidaAux] = Salida,
    resta_lista(SalidaAux, Numero, Resultado),
    write('Claro, el resultado de la resta es '),
    write(Resultado).

analizarAccionRealizar(multiplicacion, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    multiplicacion_lista(Salida, Resultado),
    write('Claro, el resultado de la multiplicacion es '),
    write(Resultado).

analizarAccionRealizar(division, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    division_lista(Salida, Resultado),
    write('Claro, el resultado de la division es '),
    write(Resultado).

analizarAccionRealizar(modulo, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    modulo_lista(Salida, Resultado),
    write('Claro, el resultado del modulo es '),
    write(Resultado).

analizarAccionRealizar(potencia, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    potencia_lista(Salida, Resultado),
    write('Claro, el resultado de la potencia es '),
    write(Resultado).

analizarAccionRealizar(raiz, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    nth0(0, Salida, Numero),
    raiz_cuadrada(Numero, Resultado),
    write('Claro, el resultado de la raiz cuadrada es '),
    write(Resultado).

analizarAccionRealizar(longitud, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    longitud_lista(Lista, Cantidad),
    write('Claro, la longitud de la lista es '),
    write(Cantidad),
    nl.

analizarAccionRealizar(concatena, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    \+ is_empty(Salida),
    concatenacion_listas(Salida, Cantidad),
    write('Claro, el resultado de la concatenacion es '),
    write(Cantidad),
    nl.

analizarAccionRealizar(reverso, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    reverso_lista(Lista, Cantidad),
    write('Claro, la lista inversa es '),
    write(Cantidad),
    nl.

analizarAccionRealizar(primero, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    primer_elemento(Lista, Cantidad),
    write('Claro, el primer elemento es '),
    write(Cantidad),
    nl.

analizarAccionRealizar(ultimo, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    ultimo_elemento(Lista, Cantidad),
    write('Claro, el ultimo elemento es '),
    write(Cantidad),
    nl.

analizarAccionRealizar(maximo, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    maximo_lista(Lista, Cantidad),
    write('Claro, el elemento maximo es '),
    write(Cantidad),
    nl.

analizarAccionRealizar(minimo, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    minimo_lista(Lista, Cantidad),
    write('Claro, el elemento minimo es '),
    write(Cantidad),
    nl.

analizarAccionRealizar(indice, _, _, Entrada) :-
    filtrarListas(Entrada, L),
    nth0(0, L, Lista),
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    IndiceStr = SubMatch.1,
    atom_number(IndiceStr, Indice),
    nesimo_elemento(Lista, Indice, Salida),
    write("Claro, el elemento es "),
    write(Salida).

analizarAccionRealizar(existe, _, _, Entrada) :-
    filtrarListas(Entrada, L),
    nth0(0, L, Lista),
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    IndiceStr = SubMatch.1,
    atom_number(IndiceStr, Elemento),nl,
    (   existe_elemento(Lista, Elemento)
    ->  write("Si que existe "), write(Elemento), write(" en la lista"), nl
    ;   write("No existe el elemento "), write(Elemento), write(" en la lista"), nl
    ).

analizarAccionRealizar(elimina, _, _, Entrada) :-
    filtrarListas(Entrada, L),
    nth0(0, L, Lista),
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    IndiceStr = SubMatch.1,
    atom_number(IndiceStr, Elemento),
    eliminar_elemento(Lista, Elemento, Salida),
    write("Claro, la lista queda de la siguiente manera "),
    write(Salida).

analizarAccionRealizar(guardarPredicado, _, _, Entrada) :-
    filtrarPredicados(Entrada, Predicados),
    crearPredicado(Predicados).

analizarAccionRealizar(estudio, _, _, _) :-
    write('Claro, aqui te muestro una tecnica que te puede servir: '),
    nl,
    random_between(1, 10, Opcion),
    consejosAleatorios(Opcion).

analizarAccionRealizar(chiste, _, _, _) :-
    write('Claro, aqui te muestro un chiste que de seguro te hara reir: '),
    nl,
    random_between(1, 10, Opcion),
    chisteAleatorio(Opcion).

analizarAccionRealizar(refran, _, _, _) :-
    write('Claro, aqui te muestro un refran que puedes utilizar: '),
    nl,
    random_between(1, 10, Opcion),
    refranesAleatorios(Opcion).

analizarAccionRealizar(imprimirPredicado, _, _ , _) :-
    write('Aqui estan todos los predicados definidos: '),
    nl,
    imprimirPredicados.

analizarAccionRealizar(despedida, _, _, _) :-
    write('Hasta pronto joven').

analizarAccionRealizar(_, _, _, _) :-
    write('Lo siento, pero no puedo resolver tu solicitud.').