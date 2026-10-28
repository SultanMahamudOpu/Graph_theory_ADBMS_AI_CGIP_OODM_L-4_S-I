go:- write('Enter a number: '),nl,
    read(X),
    evenOdd(X).

    evenOdd(X):- M is mod(X,2),
        M=0, write(X), write(' is even'),nl.
    evenOdd(X):- M is mod(X,2),
        M=1, write(X), write(' is odd'),nl.