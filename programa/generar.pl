%Entrada: Nombre del predicado, Entrada (cadena de texto), Predicado (variable de salida).
%Salida: Predicado es un átomo que contiene el código del predicado generado.
%Restricciones: Nombre debe ser un átomo. Entrada debe ser una cadena de texto.
%Objetivo: Generar el código de un predicado en Prolog basado en el nombre y la entrada proporcionados.
generar_codigo_predicado(raiz, _, Predicado) :-
    Predicado = 'modulo(Arg1, Salida) :- Salida is sqrt(Arg1).'.

%Entrada: Nombre del predicado, Entrada (cadena de texto), Predicado (variable de salida).
%Salida: Predicado es un átomo que contiene el código del predicado generado.
%Restricciones: Nombre debe ser un átomo. Entrada debe ser una cadena de texto.
%Objetivo: Generar el código de un predicado en Prolog basado en el nombre y la entrada proporcionados.
generar_codigo_predicado(Nombre, Entrada, Predicado) :-
    re_matchsub(".*\\s(\\d+)\\s.*", Entrada, SubMatch, []),
    Num = SubMatch.1,
    atom_number(Num, NumArgs),
    generar_argumentos(NumArgs, Args),
    atomic_list_concat(Args, ', ', ArgsStr),
    format(atom(Inicio), '~w(~w, Salida)', [Nombre, ArgsStr]),
    generarCodigo(Nombre, NumArgs, Codigo),
    concat_atom([Inicio, Codigo], '', Predicado).

generar_codigo_predicado(_, _, _) :-
    write('Debes indicarme la cantidad de argumentos que deseas.'),
    fail.

%Entrada: N (número de argumentos), [Arg|Args] (lista de argumentos).
%Salida: [Arg|Args] es una lista de argumentos generados.
%Restricciones: N debe ser un número entero no negativo.
%Objetivo: Generar una lista de argumentos basada en el número de argumentos proporcionado.
generar_argumentos(0, []).
generar_argumentos(N, [Arg|Args]) :-
    N > 0,
    atomic_concat('Arg', N, Arg),
    N1 is N - 1,
    generar_argumentos(N1, Args).

%Entrada: Nombre del predicado, Cantidad (número de argumentos), Codigo (variable de salida).
%Salida: Codigo es un átomo que contiene el código del predicado generado.
%Restricciones: Nombre debe ser un átomo. Cantidad debe ser un número entero no negativo.
%Objetivo: Generar el código de la suma.
generarCodigo(suma, Cantidad, Codigo) :-
    generar_argumentos(Cantidad, Args),
    atomic_list_concat(Args, ' + ', ArgsStr),
    format(atom(Codigo), ' :- Salida is ~w.', [ArgsStr]).

%Entrada: Nombre del predicado, Cantidad (número de argumentos), Codigo (variable de salida).
%Salida: Codigo es un átomo que contiene el código del predicado generado.
%Restricciones: Nombre debe ser un átomo. Cantidad debe ser un número entero no negativo.
%Objetivo: Generar el código de la resta.
generarCodigo(resta, Cantidad, Codigo) :-
    generar_argumentos(Cantidad, Args),
    atomic_list_concat(Args, ' - ', ArgsStr),
    format(atom(Codigo), ' :- Salida is ~w.', [ArgsStr]).

%Entrada: Nombre del predicado, Cantidad (número de argumentos), Codigo (variable de salida).
%Salida: Codigo es un átomo que contiene el código del predicado generado.
%Restricciones: Nombre debe ser un átomo. Cantidad debe ser un número entero no negativo.
%Objetivo: Generar el código de la division.
generarCodigo(division, Cantidad, Codigo) :-
    generar_argumentos(Cantidad, Args),
    atomic_list_concat(Args, ' / ', ArgsStr),
    format(atom(Codigo), ' :- Salida is ~w.', [ArgsStr]).

%Entrada: Nombre del predicado, Cantidad (número de argumentos), Codigo (variable de salida).
%Salida: Codigo es un átomo que contiene el código del predicado generado.
%Restricciones: Nombre debe ser un átomo. Cantidad debe ser un número entero no negativo.
%Objetivo: Generar el código de la multiplicacion.
generarCodigo(multiplicacion, Cantidad, Codigo) :-
    generar_argumentos(Cantidad, Args),
    atomic_list_concat(Args, ' * ', ArgsStr),
    format(atom(Codigo), ' :- Salida is ~w.', [ArgsStr]).

%Entrada: Nombre del predicado, Cantidad (número de argumentos), Codigo (variable de salida).
%Salida: Codigo es un átomo que contiene el código del predicado generado.
%Restricciones: Nombre debe ser un átomo. Cantidad debe ser un número entero no negativo.
%Objetivo: Generar el código de la potencia.
generarCodigo(potencia, Cantidad, Codigo) :-
    generar_argumentos(Cantidad, Args),
    atomic_list_concat(Args, ' ** ', ArgsStr),
    format(atom(Codigo), ' :- Salida is ~w.', [ArgsStr]).

%Entrada: Nombre del predicado, Cantidad (número de argumentos), Codigo (variable de salida).
%Salida: Codigo es un átomo que contiene el código del predicado generado.
%Restricciones: Nombre debe ser un átomo. Cantidad debe ser un número entero no negativo.
%Objetivo: Generar el código del modulo.
generarCodigo(modulo, Cantidad, Codigo) :-
    generar_argumentos(Cantidad, Args),
    atomic_list_concat(Args, ' mod ', ArgsStr),
    format(atom(Codigo), ' :- Salida is ~w.', [ArgsStr]).