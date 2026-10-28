go:- write("Enter 2 numbers: "),nl,
    read(A),read(B),
    fun(A,B).

    fun(A,B):- A>B, write(A),write(" is greater"),nl.
    fun(A,B):- A<B, write(B),write(" is greater"),nl.
    fun(A,B):- A=B, write("Both are equal"),nl.

