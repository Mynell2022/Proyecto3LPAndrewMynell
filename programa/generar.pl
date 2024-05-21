%GENERADORES

%Entradas: Identificacion del codigo
%Salidas: Codigo guardado segun identificador
%Restricciones: Tiene identificadores especificos
%Objetivo: Obtener codigo de reglas guardadas

generarCodigo(suma,"
suma(A, B, Suma) :-
    Suma is A + B.
").

generarCodigo(resta,"
resta(A, B, Resta) :-
    Resta is A - B.
").

generarCodigo(multiplicacion,"
multiplicacion(A, B, Producto) :-
    Producto is A * B.
").

generarCodigo(division,"
division(A, B, Division) :-
    B \\= 0,
    Division is A / B.
").

generarCodigo(modulo,"
modulo(A, B, Modulo) :-
    B \\= 0,
    Modulo is A mod B.
").

generarCodigo(potencia,"
potencia(Base, Exponente, Resultado) :-
    Resultado is Base ** Exponente.
").

generarCodigo(raiz,"
raiz(Numero, Raiz) :-
    Raiz is sqrt(Numero).
").

:- use_module(library(readutil)).

buscar_regla(NombreArchivo, NombreRegla) :-
    open(NombreArchivo, read, Stream),
    buscar_regla_en_stream(Stream, NombreRegla),
    close(Stream).

buscar_regla_en_stream(Stream, NombreRegla) :-
    read_line_to_string(Stream, Linea),
    (   Linea \= end_of_file
    ->  (   sub_string(Linea, _, _, _, NombreRegla) -> writeln(Linea) ; true ),
        buscar_regla_en_stream(Stream, NombreRegla)
    ;   true ).

generar_codigo_predicado(Nombre, NumArgs) :-
    generar_argumentos(NumArgs, Args),
    atomic_list_concat(Args, ', ', ArgsStr),
    format(atom(Predicado), '~w(~w, Salida)', [Nombre, ArgsStr]),
    writeln(Predicado).

generar_argumentos(0, []) :- !.
generar_argumentos(N, [Arg|Args]) :-
    N > 0,
    atomic_concat('Arg', N, Arg),
    N1 is N - 1,
    generar_argumentos(N1, Args).
