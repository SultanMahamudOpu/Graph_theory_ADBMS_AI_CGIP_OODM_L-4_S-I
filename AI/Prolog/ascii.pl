# go:- write('enter a character: '),nl,
#     get(X),
#     fun(X).

#     fun(X):-
#         format('The ASCII code is ~w',[X]).



go1:- write('Enter range: '),nl,
    get(X),get(Y),
    loop(X,Y).

    loop(X,Y):-
        between(X,Y,Z),
        format('The ASCII code is ~w',[Z]),nl,
        put(Z),nl,
        fail.
        loop(_,_).