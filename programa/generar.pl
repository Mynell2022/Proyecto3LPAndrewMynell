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

% Predicado principal para buscar una palabra en las reglas de una lista de archivos
buscar_palabra_en_archivos(NombresArchivos, Palabra) :-
    maplist(buscar_regla(Palabra), NombresArchivos).

% Predicado para buscar una regla en un archivo específico
buscar_regla(NombreRegla, NombreArchivo) :-
    open(NombreArchivo, read, Stream),
    buscar_regla_en_stream(Stream, NombreRegla, Encontrado),
    close(Stream),
    ( Encontrado == true -> true ; fail ).

% Predicado para buscar una regla en el flujo de entrada (stream)
buscar_regla_en_stream(Stream, NombreRegla, Encontrado) :-
    read_line_to_string(Stream, Linea),
    ( Linea \= end_of_file ->
        ( es_regla_con_nombre(Linea, NombreRegla) ->
            writeln(Linea),
            leer_contenido_regla(Stream),
            Encontrado = true
        ;
            buscar_regla_en_stream(Stream, NombreRegla, Encontrado)
        )
    ;
        Encontrado = false
    ).

% Predicado para verificar si una línea es una regla con el nombre especificado
es_regla_con_nombre(Linea, NombreRegla) :-
    sub_string(Linea, _, _, _, NombreRegla),
    sub_string(Linea, _, _, _, ':-').

% Predicado para leer y mostrar el contenido de la regla
leer_contenido_regla(Stream) :-
    read_line_to_string(Stream, Linea),
    ( Linea \= end_of_file, \+ Linea = "" ->
        writeln(Linea),
        leer_contenido_regla(Stream)
    ;
        true
    ).

generar_argumentos(0, []) :- !.
generar_argumentos(N, [Arg|Args]) :-
    N > 0,
    atomic_concat('Arg', N, Arg),
    N1 is N - 1,
    generar_argumentos(N1, Args).
