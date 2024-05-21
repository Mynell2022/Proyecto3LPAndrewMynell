generar_codigo_predicado(modulo, _, Predicado) :-
    nl,
    Predicado = 'modulo(Arg1, Salida) :- Salida is sqrt(Arg1).'.

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

generar_argumentos(0, []).
generar_argumentos(N, [Arg|Args]) :-
    N > 0,
    atomic_concat('Arg', N, Arg),
    N1 is N - 1,
    generar_argumentos(N1, Args).

generarCodigo(suma, Cantidad, Codigo) :-
    generar_argumentos(Cantidad, Args),
    atomic_list_concat(Args, ' + ', ArgsStr),
    format(atom(Codigo), ' :- Salida is ~w.', [ArgsStr]).

generarCodigo(resta, Cantidad, Codigo) :-
    generar_argumentos(Cantidad, Args),
    atomic_list_concat(Args, ' - ', ArgsStr),
    format(atom(Codigo), ' :- Salida is ~w.', [ArgsStr]).

generarCodigo(division, Cantidad, Codigo) :-
    generar_argumentos(Cantidad, Args),
    atomic_list_concat(Args, ' / ', ArgsStr),
    format(atom(Codigo), ' :- Salida is ~w.', [ArgsStr]).

generarCodigo(multiplicacion, Cantidad, Codigo) :-
    generar_argumentos(Cantidad, Args),
    atomic_list_concat(Args, ' * ', ArgsStr),
    format(atom(Codigo), ' :- Salida is ~w.', [ArgsStr]).

generarCodigo(potencia, Cantidad, Codigo) :-
    generar_argumentos(Cantidad, Args),
    atomic_list_concat(Args, ' ** ', ArgsStr),
    format(atom(Codigo), ' :- Salida is ~w.', [ArgsStr]).

generarCodigo(modulo, Cantidad, Codigo) :-
    generar_argumentos(Cantidad, Args),
    atomic_list_concat(Args, ' mod ', ArgsStr),
    format(atom(Codigo), ' :- Salida is ~w.', [ArgsStr]).