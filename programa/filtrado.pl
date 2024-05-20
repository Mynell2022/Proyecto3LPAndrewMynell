filtrarNumeros(Entrada, Salida) :-
    reemplazarNoDigitos(Entrada, EntradaReemplazada),
    atom_string(Atom, EntradaReemplazada),  % Convierte la cadena de entrada en un átomo
    re_replace('[^0-9\\. ]'/g, '', Atom, Resultado),  % Elimina todos los caracteres que no son dígitos ni espacios
    atomic_list_concat(ListaDeAtomos, ' ', Resultado),  % Divide el átomo resultante en una lista de átomos
    exclude(atom_string(''), ListaDeAtomos, ListaDeAtomosNoVacios),  % Ignora los átomos que son cadenas vacías
    maplist(atom_number, ListaDeAtomosNoVacios, Salida).  % Convierte cada átomo en un número y los pone en la lista de salida

filtrarNumeros(_, _) :-
    nl,
    write('No has escrito todos los numeros de manera correcta').

% Regla para reemplazar todos los caracteres que no son dígitos ni espacios en un átomo por espacios
reemplazarNoDigitos(Entrada, Salida) :-
    atom_chars(Entrada, ListaCaracteres),
    reemplazarNoDigitosAux(ListaCaracteres, ListaSalida),
    atom_chars(Salida, ListaSalida).

reemplazarNoDigitosAux([], []).
reemplazarNoDigitosAux([Caracter|RestoEntrada], [NuevoCaracter|RestoSalida]) :-
    char_code(Caracter, CodigoCaracter),
    char_code('0', Codigo0),
    char_code('9', Codigo9),
    char_code('.', CodigoPunto),
    (   (CodigoCaracter >= Codigo0, CodigoCaracter =< Codigo9 ; CodigoCaracter = CodigoPunto) -> NuevoCaracter = Caracter ; NuevoCaracter = ' '),
    reemplazarNoDigitosAux(RestoEntrada, RestoSalida).

filtrarListas(String, NuevaLista) :-
    split_string(String, " ", "", ListaSubcadenas),
    transformarStringALista(ListaSubcadenas, NuevaLista).

transformarStringALista([], []).
transformarStringALista([Palabra|Cola], Lista) :-
    transformarStringALista(Cola, NuevaLista),
    transformarStringAListaAux(Palabra, ListaEntrada),
    agregarListaCreada(ListaEntrada, NuevaLista, Lista).

transformarStringAListaAux(String, NuevaLista) :- 
    atom_chars(String, ListaCaracteres),
    memberchk('[', ListaCaracteres),
    memberchk(']', ListaCaracteres),
    memberchk(',', ListaCaracteres),
    term_string(NuevaLista, String).

transformarStringAListaAux(_, []).

agregarListaCreada([], NuevaLista, Lista) :- !, Lista = NuevaLista.
agregarListaCreada(ListaEntrada, NuevaLista, Lista) :- Lista = [ListaEntrada|NuevaLista].

filtrarPredicados(String, Predicados) :-
    split_string(String, " ", "", ListaSubcadenas),
    transformarStringAPredicado(ListaSubcadenas, Predicados).

transformarStringAPredicado([], []).
transformarStringAPredicado([Predicado|Cola], Lista) :-
    transformarStringAPredicado(Cola, NuevaLista),
    transformarStringAPredicadoAux(Predicado, PredicadoEntrada),
    agregarListaCreada(PredicadoEntrada, NuevaLista, Lista).

transformarStringAPredicadoAux(String, NuevoPredicado) :- 
    atom_chars(String, ListaCaracteres),
    memberchk('(', ListaCaracteres),
    memberchk(')', ListaCaracteres),
    memberchk('.', ListaCaracteres),
    term_string(NuevoPredicado, String).

transformarStringAPredicadoAux(_, []).

is_empty([]).