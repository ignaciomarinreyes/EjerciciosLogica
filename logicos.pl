fibo(0, 0).
fibo(1, 1).
fibo(X, Y) :- X>1, A is X-1, B is X-2, fibo(A,AY), fibo(B, BY), Y is AY+BY.

expo(_B, 0, 1).
expo(X,N,Y) :- N>0, NN is N-1, expo(X,NN,YY), Y is X*YY.

minimo([X|Xs] , M):- minimo2(M, X, Xs).
minimo2(M, M, []) :- !.
minimo2(X, Y, [Z|Zs]):- Z =< Y, !, minimo2(X, Z, Zs).
minimo2(X, Y, [Z|Zs]):- Z>=Y, minimo2(X, Y, Zs).

% Correcto %%%

minimo([],R,R).
minimo([X|Xs], Local, R):- X > Local, minimo(Xs, Local,R). 
minimo([X|Xs], Local, R):- X =< Local, minimo(Xs, X, R).
minimo([X|Xs], R):- minimo(Xs, X, R).

% Correcto %%%

inserta([], X, [X]). % es si la lista está vacía, no es para el caso base, añade el elemento en la lista vacía
inserta([Y|Ys], X, [X,Y|Ys]) :- X < Y.  % caso base, desde que sea menor el elemento se añade antes de la lista y se devuelve toda esa lista con el elmento antes
inserta([Y|Ys], X , [Y|Zs]) :- X >= Y, inserta(Ys,X, Zs). % si es mayor o igual el elmento al primero de la lista, acortar la lista

invierte([],[]).
invierte([H|T], L) :- invierte(T,S) , append(S, [H], L).

elimina([ X | Xs ], X, Zs) :- elimina( Xs, X, Zs).
elimina([ Y | Xs ], X,  [ Y | Zs ]) :- X \== Y, elimina( Xs, X, Zs).  
elimina( [], _X, []).

repetidos([X|Xs], [X|Ys]) :- elimina([X|Xs], X , Zs), repetidos(Zs, Ys).
repetidos([], []).

my_max([], R, R). %end % caso base, llego a lista vacía y devuelve el máximo local como resultado igualando las dos R
my_max([X|Xs], WK, R):- X >  WK, my_max(Xs, X, R). %WK is Carry about, si el siguiente número es mayor al máximo local, pasar el máximo local
my_max([X|Xs], WK, R):- X =< WK, my_max(Xs, WK, R). % si el siguiente número es es menor al máximo local, seguir pasando el máximo local
my_max([X|Xs], R):- my_max(Xs, X, R). %start % Añadir tres términos en vez de dos, la X hara de maximo local y será el primer término