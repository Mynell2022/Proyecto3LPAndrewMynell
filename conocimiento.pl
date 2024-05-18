:- consult('verboMaquina.pl').
:- consult('formas.pl').
:- consult('aritmetica.pl').
:- consult('filtrado.pl').
:- consult('analisis.pl').


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