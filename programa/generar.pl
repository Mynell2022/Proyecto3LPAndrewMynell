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
