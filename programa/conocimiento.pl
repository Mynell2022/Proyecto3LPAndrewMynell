:- consult('formas.pl').
:- consult('aritmetica.pl').
:- consult('filtrado.pl').
:- consult('analisis.pl').
:- consult('temasTriviales.pl').
:- consult('verboMaquina.pl').
:- consult('predicados.pl').

%Iniciador y bienvenida
chatbot() :-
    write('Bienvenido'),
    nl,
    chatbotAux().

%Entradas: Nada
%Salidas: Sistema de analisis y procesamiento de consultas
%Restricciones: Solo acepta buena gramatica
%Objetivo: Manejar consultas informales del usuario
chatbotAux:-
    nl,
    nl,
    write('¿Hay algo en lo que pueda ayudarte?'),
    nl,
    read_line_to_string(user_input, Entrada),
    tokenizar(Entrada, Palabras),
    analizarOperaciones(Palabras, Operacion),
    analizarRealizar(Palabras, Realizar),
    analizarCrear(Palabras, Crear),
    nl,
    analizarAccionRealizar(Operacion, Realizar, Crear, Entrada),
    (Operacion == despedida -> true; chatbotAux).

%Entradas: Un Texto
%Salidas: Lista de palabras que conforman el texto
%Restricciones: No acepta caracteres No alfanumericos
%Objetivo: Obtener palabras identificables para alguna funcion del chatbot
tokenizar(Texto, Palabras) :-
    atom_string(Atom, Texto),
    re_replace('[^a-zA-Z0-9 ]'/g, '', Atom, Resultado),  % Elimina caracteres no alfanuméricos
    atomic_list_concat(Palabras, ' ', Resultado).