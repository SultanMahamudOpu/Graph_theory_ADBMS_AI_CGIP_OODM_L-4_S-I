go:- writeln('enter 2 numbers: '),
    read(A),read(B),
    loop(A,B).

    loop(A,B):-
        between(A,B,X),
        A is mod(X,2),
        A=1,
        writeln(X),
        X>=B, !.
        loop(A,B).