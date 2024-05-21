%Entradas: Una cadena de caracteres.
%Salidas: Una lista de números.
%Restricciones: Ninguna.
%Objetivo: Toma de la cadena de caracteres los números que necesita.
filtrarNumeros(Entrada, Salida) :-
    reemplazarNoDigitos(Entrada, EntradaReemplazada),
    atom_string(Atom, EntradaReemplazada),  % Convierte la cadena de entrada en un átomo
    re_replace('[^0-9\\. ]'/g, '', Atom, Resultado),  % Elimina todos los caracteres que no son dígitos ni espacios
    atomic_list_concat(ListaDeAtomos, ' ', Resultado),  % Divide el átomo resultante en una lista de átomos
    exclude(atom_string(''), ListaDeAtomos, ListaDeAtomosNoVacios),  % Ignora los átomos que son cadenas vacías
    maplist(atom_number, ListaDeAtomosNoVacios, Salida).  % Convierte cada átomo en un número y los pone en la lista de salida

%Entradas: Nada
%Salidas: Nada
%Restricciones: Nada
%Objetivo: Informa que los números no se pueden pasar de string a enteros.
filtrarNumeros(_, _) :-
    nl,
    write('No has escrito todos los numeros de manera correcta'),
    fail.

%Entradas: Una cadena de caracteres.
%Salidas: La lista con los numeros
%Restricciones: Nada
%Objetivo: Envia a filtrar los numeros.
reemplazarNoDigitos(Entrada, Salida) :-
    atom_chars(Entrada, ListaCaracteres),
    reemplazarNoDigitosAux(ListaCaracteres, ListaSalida),
    atom_chars(Salida, ListaSalida).

%Entradas: La lista de caracteres
%Salidas: La lista de caracteres con los numeros y los espacios.
%Restricciones: Nada
%Objetivo: Cambia cada caracter que no es número o punto por un caracter espacio.
reemplazarNoDigitosAux([], []).
reemplazarNoDigitosAux([Caracter|RestoEntrada], [NuevoCaracter|RestoSalida]) :-
    char_code(Caracter, CodigoCaracter),
    char_code('0', Codigo0),
    char_code('9', Codigo9),
    char_code('.', CodigoPunto),
    (   (CodigoCaracter >= Codigo0, CodigoCaracter =< Codigo9 ; CodigoCaracter = CodigoPunto) -> NuevoCaracter = Caracter ; NuevoCaracter = ' '),
    reemplazarNoDigitosAux(RestoEntrada, RestoSalida).

%Entradas: Un string
%Salidas: Las listas ingresadas por el usuario.
%Restricciones: Nada
%Objetivo: Hace un split de los espacios en blanco para filtrar las listas.
filtrarListas(String, NuevaLista) :-
    split_string(String, " ", "", ListaSubcadenas),
    transformarStringALista(ListaSubcadenas, NuevaLista).

%Entradas: La lista de strings
%Salidas: Las listas ingresadas por el usuario
%Restricciones: Nada
%Objetivo: Comprueba cada elemento de la lista para trasnformarlo en una lista, si es que se puede.
transformarStringALista([], []).
transformarStringALista([Palabra|Cola], Lista) :-
    transformarStringALista(Cola, NuevaLista),
    transformarStringAListaAux(Palabra, ListaEntrada),
    agregarListaCreada(ListaEntrada, NuevaLista, Lista).

%Entradas: El elemento de la lista de strings
%Salidas: La nueva lista.
%Restricciones: Solo puede convertirse en string si tiene los caracteres [, ] y .
%Objetivo: Convierte el string en una lista, si no se puede entonces da fail.
transformarStringAListaAux(String, NuevaLista) :- 
    atom_chars(String, ListaCaracteres),
    memberchk('[', ListaCaracteres),
    memberchk(']', ListaCaracteres),
    memberchk(',', ListaCaracteres),
    catch(term_string(NuevaLista, String), _, fail).
transformarStringAListaAux(_, []).

%Entradas: Una lista vacia, la lista a la que desea agregarse la lista vacia.
%Salidas: La lista nueva
%Restricciones: Nada
%Objetivo: Enviar la lista nueva otra vez.
agregarListaCreada([], NuevaLista, Lista) :- !, Lista = NuevaLista.

%Entradas: La lista que ingresó el usuario, la lista de listas.
%Salidas: La lista de listas con la lista del usuario ingresada.
%Restricciones: Nada
%Objetivo: Agrega la lista ingresada por el usuario al resto de las listas.
agregarListaCreada(ListaEntrada, NuevaLista, Lista) :- Lista = [ListaEntrada|NuevaLista].

%Entrada: El string ingresado por el usuario.
%Salidas: Una lista con el predicado dicho por el usuario.
%Restricciones: Nada
%Objetivo: Hace un split para separar las palabras.
filtrarPredicados(String, Predicados) :-
    split_string(String, " ", "", ListaSubcadenas),
    transformarStringAPredicado(ListaSubcadenas, Predicados).

%Entradas: La lista de strings
%Salidas: Una lista con el predicado dicho por el usuario.
%Restricciones: Nada
%Objetivo: Evalua cada elemento de la lista para comprobar si se pueden convertir en predicados.
transformarStringAPredicado([], []).
transformarStringAPredicado([Predicado|Cola], Lista) :-
    transformarStringAPredicado(Cola, NuevaLista),
    transformarStringAPredicadoAux(Predicado, PredicadoEntrada),
    agregarListaCreada(PredicadoEntrada, NuevaLista, Lista).

%Entradas: El predicado en forma de string
%Salidas: El predicado como un atomo.
%Restricciones: Solo se puede convertir en atomo si el predicado tiene los caracteres (, ) y .
%Objetivo: Convierte un predicado string en un predicado atomo.
transformarStringAPredicadoAux(String, NuevoPredicado) :- 
    atom_chars(String, ListaCaracteres),
    memberchk('(', ListaCaracteres),
    memberchk(')', ListaCaracteres),
    memberchk('.', ListaCaracteres),
    catch(term_string(NuevoPredicado, String), _, fail).
transformarStringAPredicadoAux(_, []).

is_empty([]).