go:- write("Enter 3 numbers:"),nl,
    read(A),read(B),read(C),
    fun(A,B,C).

    fun(A,B,C):- A>B, B>C, write(B), write(' is the second largest'),nl.
    fun(A,B,C):- A<B, B<C, write(B), write(' is the second largest'),nl.
    fun(A,B,C):- B>A, A>C, write(A), write(' is the second largest'),nl.
    fun(A,B,C):- B<A, A<C, write(A), write(' is the second largest'),nl.
    fun(A,B,C):- A>C, C>B, write(C), write(' is the second largest'),nl.
    fun(A,B,C):- A<C, C<B, write(C), write(' is the second largest'),nl.
