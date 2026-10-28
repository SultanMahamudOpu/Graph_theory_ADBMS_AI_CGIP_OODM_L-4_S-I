# go:- writeln('Enter a number:'),
#     read(N),
#     loop(1,N).

#     loop(1,N):-
#         between(1,N,X),
#         writeln(X),
#         X>=N, !.
#         loop(1,N).

% Find even number betwween two given number
go:- writeln("Enter 2 numbers: "),
    read(I),read(N),
    loop(I,N).

    loop(I,N):-
        between(I,N,X),
        A is mod(X,2),
        A=0,
        writeln(X),
        X>N, !.
        loop(I,N).

% Find odd number beteween two given number
go1:- writeln("Enter 2 numbers: "),
    read(I),read(N),
    loop1(I,N).

    loop1(I,N):-
        between(I,N,X),
        A is mod(X,2),
        A=1,
        writeln(X),
        X>=N, !.
        loop1(I,N).