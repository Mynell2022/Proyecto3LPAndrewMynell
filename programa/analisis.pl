:- consult('generar.pl').

%Entradas: Una lista de palabras y una varible accion que indica lo que
%se desea hacer
%Salidas: suma si hay alguna palabra que se refiere a esta.
%Restricciones: Solo se permiten palabras de suma
%Objetivo: Indicar al sistema que se debe sumar.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasSuma(Palabra), !, Accion = suma.

%Entradas: Una lista de palabras.
%Salidas: accion resta
%Restricciones: Deben haber palabras que se refieran a resta.
%Objetivo: Indicar al sistema que se deber hacer una resta.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasResta(Palabra), !, Accion = resta.

%Entradas: Una lista de palabras
%Salidas: accion division
%Restricciones: Deben haber palabras que se refieran a la division.
%Objetivo: Indicar al sistema que se debe hacer division
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasDivision(Palabra), !, Accion = division.

%Entradas: Una lista de palabras
%Salidas: accion multiplicar
%Restricciones: Deben haber palabras que se refieran a la multiplicacion
%Objetivo: Indicar al sistema que se debe hacer multiplicar
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasMultiplicacion(Palabra), !, Accion = multiplicacion.

%Entradas: Una lista de palabras
%Salidas: accion modulo
%Restricciones: Deben haber palabras que se refieran al modulo
%Objetivo: Indicar al sistema que se debe hacer el modulo.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasModulo(Palabra), !, Accion = modulo.

%Entradas: Una lista de palabras
%Salidas: accion potencia
%Restricciones: Deben haber palabras que se refieran a la potencia
%Objetivo: Indicar al sistema que se debe hacer una potencia.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasPotencia(Palabra), !, Accion = potencia.

%Entradas: Una lista de palabras
%Salidas: accion raiz
%Restricciones: Deben haber palabras que se refieran a la raiz cuadrada
%Objetivo: Indicar al sistema que se debe hacer una raiz cuadrada.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasRaiz(Palabra), member(PalabraAux, Palabras), formasRaizNumero(PalabraAux), !, Accion = raiz.

%Entradas: Una lista de palabras
%Salidas: accion chiste
%Restricciones: Deben haber palabras que se refieran a un chiste.
%Objetivo: Indicar al sistema que se debe hacer un chiste.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasChiste(Palabra), !, Accion = chiste.

%Entradas: Una lista de palabras
%Salidas: accion estudio
%Restricciones: Deben haber palabras que se refieran a una tecnica de
%estudio.
%Objetivo: Indicar al sistema que se debe dar una tecnia de estudio.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasEstudio(Palabra), member(PalabraAux, Palabras), formasEstudioAux(PalabraAux), !, Accion = estudio.

%Entradas: Una lista de palabras
%Salidas: accion refran
%Restricciones: Deben haber palabras que se refieran a un refran
%Objetivo: Indicar al sistema que se debe decir un refran.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasRefran(Palabra), !, Accion = refran.

%Entradas: Una lista de palabras
%Salidas: accion longitud
%Restricciones: Deben haber palabras que se refieran al largo de una
%lista
%Objetivo: Indicar al sistema que se debe calcular el largo de una
%lista.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasLongitud(Palabra), !, Accion = longitud.

%Entradas: Una lista de palabras
%Salidas: accion concatenar
%Restricciones: Deben haber palabras que se refieran a la concatenacion
%de listas
%Objetivo: Indicar al sistema que se debe hacer una
% concatenacion de listas.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasConcatenar(Palabra), !, Accion = concatena.

%Entradas: Una lista de palabras
%Salidas: accion reverso
%Restricciones: Deben haber palabras que se refieran al reverso de la
%lista.
%Objetivo: Indicar al sistema que se debe hacer un reverso de lista.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasReverso(Palabra), !, Accion = reverso.

%Entradas: Una lista de palabras
%Salidas: accion primeri
%Restricciones: Deben haber palabras que se refieran al primer elemento
%de una lista.
%Objetivo: Indicar al sistema que se debe devolver el primer elemento
%de una lista.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasPrimero(Palabra), !, Accion = primero.

%Entradas: Una lista de palabras
%Salidas: accion ultimo
%Restricciones: Deben haber palabras que se refieran a ultimo elemento
%de la lista
%Objetivo: Indicar al sistema que se debe devolver el ultimo elemento
%de la lista.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasUltimo(Palabra), !, Accion = ultimo.

%Entradas: Una lista de palabras
%Salidas: accion minimo
%Restricciones: Deben haber palabras que se refieran al minimo de una
%lista.
%Objetivo: Indicar al sistema que se debe devolver el minimo de la
%lista.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasMinimo(Palabra), !, Accion = minimo.

%Entradas: Una lista de palabras
%Salidas: accion maximo
%Restricciones: Deben haber palabras que se refieran al elemento maximo
%de la lista.
%Objetivo: Indicar al sistema que se debe devolver el elemento de la
%lista.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasMaximo(Palabra), !, Accion = maximo.

%Entradas: Una lista de palabras
%Salidas: accion indice
%Restricciones: Deben haber palabras que se refieran al indice de una
%lista.
%Objetivo: Indicar al sistema que se debe devolver el elemento de
%la lista en la posicion que indica el indice.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasIndice(Palabra), !, Accion = indice.

%Entradas: Una lista de palabras
%Salidas: accion existe.
%Restricciones: Deben haber palabras que se refieran a la existencia de
%un elemento.
%Objetivo: Indicar al sistema que se debe verificar si un elemento
%existe en la lista.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasExiste(Palabra), !, Accion = existe.

%Entradas: Una lista de palabras
%Salidas: accion eliminar
%Restricciones: Deben haber palabras que se refieran a eliminar un
%elemento de la lista
%Objetivo: Indicar al sistema que se debe eliminar un elemento de la
%lista.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasEliminar(Palabra), !, Accion = elimina.

%Entradas: Una lista de palabras
%Salidas: accion despedir
%Restricciones: Deben haber palabras que se refieran a una despedida.
%Objetivo: Indicar al sistema que se debe despedirse.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasDespedida(Palabra), !, Accion = despedida.

%Entradas: Una lista de palabras
%Salidas: accion despedir
%Restricciones: Deben haber palabras que se refieran a una despedida.
%Objetivo: Indicar al sistema que se debe despedirse.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasDespedida(Palabra), member(PalabraAux, Palabras), formasDespedidaAux(PalabraAux), !, Accion = despedida.

%Entradas: Una lista de palabras
%Salidas: accion codificar.
%Restricciones: Deben haber palabras que se refieran a codificar.
%Objetivo: Indicar al sistema que se debe hacer una codificacion.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasCodigo(Palabra), !, Accion = codifica.

%Entradas: Una lista de palabras
%Salidas: accion imprimir predicado
%Restricciones: Deben haber palabras que se refieran a imprimir
%predicados.
%Objetivo: Indicar al sistema que se debe imprimir predicados.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasPredicado(Palabra), member(PalabraAux, Palabras), formasImprimir(PalabraAux), !, Accion = imprimirPredicado.

%Entradas: Una lista de palabras
%Salidas: accion guardar predicado
%Restricciones: Deben haber palabras que se refieran a guardar
%predicados.
%Objetivo: Indicar al sistema que se debe guardar predicados.
analizarOperaciones(Palabras, Accion) :- member(Palabra, Palabras), formasPredicado(Palabra), member(PalabraAux, Palabras), formasGuardarPredicado(PalabraAux), !, Accion = guardarPredicado.

%Entradas: Una lista de palabras
%Salidas: accion nada
%Restricciones: nada
%Objetivo: Indicar al sistema que se no se ha entendido la solicitud
analizarOperaciones(_, Accion) :- Accion = nada.

%Entradas: Una lista de palabras
%Salidas: accion realizar
%Restricciones: Deben haber palabras que se refieran a realizar
%acciones.
%Objetivo: Indicar al sistema que debe realizar una accion
analizarRealizar(Palabras, Accion) :- member(Palabra, Palabras), verboMaquina(Palabra), !, Accion = realizar.

%Entradas: Una lista de palabras
%Salidas: accion nada
%Restricciones: nada
%Objetivo: Indicar al sistema que debe no se va a realizar nada.
analizarRealizar(_, Accion) :- Accion = nada.

%Entradas: Una lista de palabras
%Salidas: accion
%Restricciones: Deben haber palabras que se refieran
%Objetivo: Indicar al sistema que debe
analizarCrear(Palabras, Accion) :- member(Palabra, Palabras), formasCodigo(Palabra), !, Accion = crear.

%Entradas: Una lista de palabras
%Salidas: accion nada
%Restricciones: nada
%Objetivo: Indicar al sistema que no se debe crear nada.
analizarCrear(_, Accion) :- Accion = nada.

%Entrada: Nada
%Salida: nada
%Restricciones: Nada
%Objetivo: Mostrar el codigo de la suma
analizarAccionRealizar(suma, realizar, crear, Entrada) :-
    !,
    write('Claro, aqui tienes el codigo de la suma: '),
    nl,
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    Num = SubMatch.1,
    atom_number(Num, NumArgs),
    generar_codigo_predicado(suma, NumArgs).

%Entrada: Nada
%Salida: nada
%Restricciones: Nada
%Objetivo: Mostrar el codigo de la resta
analizarAccionRealizar(resta, realizar, crear, Entrada) :-
    write('Claro, aqui tienes el codigo de la resta: '),
    nl,
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    Num = SubMatch.1,
    atom_number(Num, NumArgs),
    generar_codigo_predicado(resta, NumArgs).

%Entrada: Nada
%Salida: nada
%Restricciones: Nada
%Objetivo: Mostrar el codigo de la division
analizarAccionRealizar(division, realizar, crear, Entrada) :-
    write('Claro, aqui tienes el codigo de la division: '),
    nl,
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    Num = SubMatch.1,
    atom_number(Num, NumArgs),
    generar_codigo_predicado(division, NumArgs).

%Entrada: Nada
%Salida: nada
%Restricciones: Nada
%Objetivo: Mostrar el codigo de la multiplicacion
analizarAccionRealizar(multiplicacion, realizar, crear, Entrada) :-
    write('Claro, aqui tienes el codigo de la multiplicacion: '),
    nl,
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    Num = SubMatch.1,
    atom_number(Num, NumArgs),
    generar_codigo_predicado(multiplicacion, NumArgs).

%Entrada: Nada
%Salida: nada
%Restricciones: Nada
%Objetivo: Mostrar el codigo de la modulo
analizarAccionRealizar(modulo, realizar, crear, Entrada) :-
    write('Claro, aqui tienes el codigo del modulo: '),
    nl,
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    Num = SubMatch.1,
    atom_number(Num, NumArgs),
    generar_codigo_predicado(modulo, NumArgs).

%Entrada: Nada
%Salida: nada
%Restricciones: Nada
%Objetivo: Mostrar el codigo del modulo
analizarAccionRealizar(potencia, realizar, crear, Entrada) :-
    write('Claro, aqui tienes el codigo de la potencia: '),
    nl,
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    Num = SubMatch.1,
    atom_number(Num, NumArgs),
    generar_codigo_predicado(potencia, NumArgs).

%Entrada: Nada
%Salida: nada
%Restricciones: Nada
%Objetivo: Mostrar el codigo de la raiz cuadrada.
analizarAccionRealizar(raiz, realizar, crear, Entrada) :-
    write('Claro, aqui tienes el codigo de la raiz cuadrada: '),
    nl,
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    Num = SubMatch.1,
    atom_number(Num, NumArgs),
    generar_codigo_predicado(raiz, NumArgs).

%Entrada: Una lista de numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos
%Objetivo: Hace la  de los elementos de la lista.
analizarAccionRealizar(suma, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    suma_lista(Salida, Resultado),
    write('Claro, el resultado de la suma es '),
    write(Resultado).

%Entrada: Una lista de numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos
%Objetivo: Hace la resta de los elementos de la lista.
analizarAccionRealizar(resta, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    [Numero|SalidaAux] = Salida,
    resta_lista(SalidaAux, Numero, Resultado),
    write('Claro, el resultado de la resta es '),
    write(Resultado).

%Entrada: Una lista de numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos
%Objetivo: Hace la multiplicacion de los elementos de la lista.
analizarAccionRealizar(multiplicacion, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    multiplicacion_lista(Salida, Resultado),
    write('Claro, el resultado de la multiplicacion es '),
    write(Resultado).

%Entrada: Una lista de numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos
%Objetivo: Hace la division de los elementos de la lista.
analizarAccionRealizar(division, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    division_lista(Salida, Resultado),
    write('Claro, el resultado de la division es '),
    write(Resultado).

%Entrada: Una lista de numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos
%Objetivo: Hace el modulo de los elementos de la lista.
analizarAccionRealizar(modulo, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    modulo_lista(Salida, Resultado),
    write('Claro, el resultado del modulo es '),
    write(Resultado).

%Entrada: Una lista de numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos
%Objetivo: Hace la potencia de los elementos de la lista.
analizarAccionRealizar(potencia, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    [Numero|SalidaAux] = Salida,
    potencia_lista(SalidaAux, Numero, Resultado),
    write('Claro, el resultado de la potencia es '),
    write(Resultado).

%Entrada: Una lista de numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos
%Objetivo: Hace la raiz cuadrada de los elementos de la lista.
analizarAccionRealizar(raiz, realizar, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    nth0(0, Salida, Numero),
    raiz_cuadrada(Numero, Resultado),
    write('Claro, el resultado de la raiz cuadrada es '),
    write(Resultado).

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Muestra la longitud de la lista
analizarAccionRealizar(longitud, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    longitud_lista(Lista, Cantidad),
    write('Claro, la longitud de la lista es '),
    write(Cantidad),
    nl.

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Concatena n listas
analizarAccionRealizar(concatena, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    \+ is_empty(Salida),
    concatenacion_listas(Salida, Cantidad),
    write('Claro, el resultado de la concatenacion es '),
    write(Cantidad),
    nl.

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Hace el reverso de una lista.
analizarAccionRealizar(reverso, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    reverso_lista(Lista, Cantidad),
    write('Claro, la lista inversa es '),
    write(Cantidad),
    nl.

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Muestra el primer elemento de una lista.
analizarAccionRealizar(primero, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    primer_elemento(Lista, Cantidad),
    write('Claro, el primer elemento es '),
    write(Cantidad),
    nl.

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Muestra el ultimo elemento de una lista.
analizarAccionRealizar(ultimo, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    ultimo_elemento(Lista, Cantidad),
    write('Claro, el ultimo elemento es '),
    write(Cantidad),
    nl.

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Muestra el número mayor de una lista.
analizarAccionRealizar(maximo, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    catch(maximo_lista(Lista, Cantidad), _, fail),
    write('Claro, el elemento maximo es '),
    write(Cantidad),
    nl.

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Muestra el numero menor de una lista.
analizarAccionRealizar(minimo, realizar, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    catch(minimo_lista(Lista, Cantidad), _, fail),
    write('Claro, el elemento minimo es '),
    write(Cantidad),
    nl.

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Muestra un elemento en la posicion que indica el indice.
analizarAccionRealizar(indice, realizar, _, Entrada) :-
    write("Claro, el elemento es "),
    filtrarListas(Entrada, L),
    nth0(0, L, Lista),
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    IndiceStr = SubMatch.1,
    atom_number(IndiceStr, Indice),
    nesimo_elemento(Lista, Indice, Salida),
    write(Salida).

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Dice si existe un elemento.
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

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Elimina un elemento de la lista.
analizarAccionRealizar(elimina, realizar, _, Entrada) :-
    filtrarListas(Entrada, L),
    nth0(0, L, Lista),
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    IndiceStr = SubMatch.1,
    atom_number(IndiceStr, Elemento),
    eliminar_elemento(Lista, Elemento, Salida),
    write("Claro, la lista queda de la siguiente manera "),
    write(Salida).

%Entrada: Nada
%Salida: nada
%Restricciones: Nada
%Objetivo: Mostrar el codigo de la suma
analizarAccionRealizar(suma, _, crear, Entrada) :-
    !,
    write('Claro, aqui tienes el codigo de la suma: '),
    nl,
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    Num = SubMatch.1,
    atom_number(Num, NumArgs),
    generar_codigo_predicado(suma, NumArgs).

%Entrada: Nada
%Salida: nada
%Restricciones: Nada
%Objetivo: Mostrar el codigo de la resta
analizarAccionRealizar(resta, _, crear, Entrada) :-
    !,
    write('Claro, aqui tienes el codigo de la resta: '),
    nl,
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    Num = SubMatch.1,
    atom_number(Num, NumArgs),
    generar_codigo_predicado(resta, NumArgs).

%Entrada: Nada
%Salida: nada
%Restricciones: Nada
%Objetivo: Mostrar el codigo de la multiplicacion
analizarAccionRealizar(multiplicacion, _, crear, Entrada) :-
    !,
    write('Claro, aqui tienes el codigo de la multiplicacion: '),
    nl,
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    Num = SubMatch.1,
    atom_number(Num, NumArgs),
    generar_codigo_predicado(multiplicacion, NumArgs).

%Entrada: Nada
%Salida: nada
%Restricciones: Nada
%Objetivo: Mostrar el codigo de la division
analizarAccionRealizar(division, _, crear, Entrada) :-
    !,
    write('Claro, aqui tienes el codigo de la division: '),
    nl,
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    Num = SubMatch.1,
    atom_number(Num, NumArgs),
    generar_codigo_predicado(division, NumArgs).

%Entrada: Nada
%Salida: nada
%Restricciones: Nada
%Objetivo: Mostrar el codigo del modulo
analizarAccionRealizar(modulo, _, crear, Entrada) :-
    !,
    write('Claro, aqui tienes el codigo de la modulo: '),
    nl,
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    Num = SubMatch.1,
    atom_number(Num, NumArgs),
    generar_codigo_predicado(modulo, NumArgs).

%Entrada: Nada
%Salida: nada
%Restricciones: Nada
%Objetivo: Mostrar el codigo de la potencia
analizarAccionRealizar(potencia, _, crear, Entrada) :-
    !,
    write('Claro, aqui tienes el codigo de la potencia: '),
    nl,
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    Num = SubMatch.1,
    atom_number(Num, NumArgs),
    generar_codigo_predicado(potencia, NumArgs).

%Entrada: Nada
%Salida: nada
%Restricciones: Nada
%Objetivo: Mostrar el codigo de la raiz cuadrada
analizarAccionRealizar(raiz, _, crear, Entrada) :-
    !,
    write('Claro, aqui tienes el codigo de la raiz: '),
    nl,
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    Num = SubMatch.1,
    atom_number(Num, NumArgs),
    generar_codigo_predicado(raiz, NumArgs).

%Entrada: Nada
%Salida: nada
%Restricciones: Nada
%Objetivo: Mostrar codigo almacenado
analizarAccionRealizar(codifica, _, _, Entrada) :-
    write('Claro, aqui tienes el codigo mas cercano en nuestro conocimiento: '),nl,
    re_matchsub("\"([^\"]*)\"", Entrada, SubMatch, []),
    Contenido = SubMatch.1,
    buscar_palabra_en_archivos(['aritmetica.pl'],Contenido),
    chatbotAux.

%Entrada: Una lista de numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos
%Objetivo: Hace la suma de los elementos de la lista.
analizarAccionRealizar(suma, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    suma_lista(Salida, Resultado),
    write('Claro, el resultado de la suma es '),
    write(Resultado).

%Entrada: Una lista de numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos
%Objetivo: Hace la resta de los elementos de la lista.
analizarAccionRealizar(resta, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    [Numero|SalidaAux] = Salida,
    resta_lista(SalidaAux, Numero, Resultado),
    write('Claro, el resultado de la resta es '),
    write(Resultado).

%Entrada: Una lista de numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos
%Objetivo: Hace la multiplicacion de los elementos de la lista.
analizarAccionRealizar(multiplicacion, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    multiplicacion_lista(Salida, Resultado),
    write('Claro, el resultado de la multiplicacion es '),
    write(Resultado).

%Entrada: Una lista de numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos
%Objetivo: Hace la division de los elementos de la lista.
analizarAccionRealizar(division, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    division_lista(Salida, Resultado),
    write('Claro, el resultado de la division es '),
    write(Resultado).

%Entrada: Una lista de numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos
%Objetivo: Hace el modulo de los elementos de la lista.
analizarAccionRealizar(modulo, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    modulo_lista(Salida, Resultado),
    write('Claro, el resultado del modulo es '),
    write(Resultado).

%Entrada: Una lista de numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos
%Objetivo: Hace la  de los elementos de la lista.
analizarAccionRealizar(potencia, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    [Numero|SalidaAux] = Salida,
    potencia_lista(SalidaAux, Numero, Resultado),
    write('Claro, el resultado de la potencia es '),
    write(Resultado).

%Entrada: Una lista de numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos
%Objetivo: Hace la raiz cuadrada de los elementos de la lista.
analizarAccionRealizar(raiz, _, _, Entrada) :-
    !,
    filtrarNumeros(Entrada, Salida),
    nth0(0, Salida, Numero),
    raiz_cuadrada(Numero, Resultado),
    write('Claro, el resultado de la raiz cuadrada es '),
    write(Resultado).

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Dice la cantidad de elementos de una lista.
analizarAccionRealizar(longitud, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    longitud_lista(Lista, Cantidad),
    write('Claro, la longitud de la lista es '),
    write(Cantidad),
    nl.

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Concatena n listas.
analizarAccionRealizar(concatena, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    \+ is_empty(Salida),
    concatenacion_listas(Salida, Cantidad),
    write('Claro, el resultado de la concatenacion es '),
    write(Cantidad),
    nl.

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Realiza el reverso de una lista.
analizarAccionRealizar(reverso, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    reverso_lista(Lista, Cantidad),
    write('Claro, la lista inversa es '),
    write(Cantidad),
    nl.

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Muestra el primer elemento de la lista.
analizarAccionRealizar(primero, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    primer_elemento(Lista, Cantidad),
    write('Claro, el primer elemento es '),
    write(Cantidad),
    nl.

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Muestra el ultimo elemento de una lista.
analizarAccionRealizar(ultimo, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    ultimo_elemento(Lista, Cantidad),
    write('Claro, el ultimo elemento es '),
    write(Cantidad),
    nl.

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Muestra el numero mayor de la lista.
analizarAccionRealizar(maximo, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    catch(maximo_lista(Lista, Cantidad), _, fail),
    write('Claro, el elemento maximo es '),
    write(Cantidad),
    nl.

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Muestra el numero menor de la lista.
analizarAccionRealizar(minimo, _, _, Entrada) :-
    filtrarListas(Entrada, Salida),
    nth0(0, Salida, Lista),
    catch(minimo_lista(Lista, Cantidad), _, fail),
    write('Claro, el elemento minimo es '),
    write(Cantidad),
    nl.

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Muestra un elemento en la posicion que indica el indice.
analizarAccionRealizar(indice, _, _, Entrada) :-
    filtrarListas(Entrada, L),
    nth0(0, L, Lista),
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    IndiceStr = SubMatch.1,
    atom_number(IndiceStr, Indice),
    nesimo_elemento(Lista, Indice, Salida),
    write("Claro, el elemento es "),
    write(Salida).

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Indica si existe el elemento en la lista.
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

%Entrada: Una lista de listas numeros.
%Salida: nada
%Restricciones: Los numeros deben estar bien escritos y las listas tambien.
%Objetivo: Elimina el elemento de la lista.
analizarAccionRealizar(elimina, _, _, Entrada) :-
    filtrarListas(Entrada, L),
    nth0(0, L, Lista),
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    IndiceStr = SubMatch.1,
    atom_number(IndiceStr, Elemento),
    eliminar_elemento(Lista, Elemento, Salida),
    write("Claro, la lista queda de la siguiente manera "),
    write(Salida).

%Entrada: Una lista con el predicado.
%Salida: nada
%Restricciones: El predicado debe tener la estructura correcta.
%Objetivo: Ingresa un nuevo predicado a la base de conocimiento.
analizarAccionRealizar(guardarPredicado, _, _, Entrada) :-
    filtrarPredicados(Entrada, Predicados),
    crearPredicado(Predicados).

%Entrada: nada
%Salida: nada
%Restricciones: nada
%Objetivo: Muestra un consejo de estudio aleatorio.
analizarAccionRealizar(estudio, _, _, _) :-
    write('Claro, aqui te muestro una tecnica que te puede servir: '),
    nl,
    random_between(1, 10, Opcion),
    consejosAleatorios(Opcion).

%Entrada: nada
%Salida: nada
%Restricciones: nada
%Objetivo: Muestra un chiste aleatorio.
analizarAccionRealizar(chiste, _, _, _) :-
    write('Claro, aqui te muestro un chiste que de seguro te hara reir: '),
    nl,
    random_between(1, 10, Opcion),
    chisteAleatorio(Opcion).

%Entrada: nada
%Salida: nada
%Restricciones: nada
%Objetivo: Muestra un refran aleatorio.
analizarAccionRealizar(refran, _, _, _) :-
    write('Claro, aqui te muestro un refran que puedes utilizar: '),
    nl,
    random_between(1, 10, Opcion),
    refranesAleatorios(Opcion).

%Entrada: nada
%Salida: nada
%Restricciones: nada
%Objetivo: Imprime los predicados existentes-
analizarAccionRealizar(imprimirPredicado, _, _ , _) :-
    write('Aqui estan todos los predicados definidos: '),
    nl,
    imprimirPredicados.

%Entrada: nada
%Salida: nada
%Restricciones: nada
%Objetivo: Se despide del usuario.
analizarAccionRealizar(despedida, _, _, _) :-
    write('Hasta pronto joven').

%Entrada: nada
%Salida: nada
%Restricciones: nada
%Objetivo: Funcion por defecto cuando el programa no entiende.
analizarAccionRealizar(_, _, _, _) :-
    write('Lo siento, pero no puedo resolver tu solicitud.').
