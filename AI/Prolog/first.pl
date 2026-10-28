go:- write("Hello world").

go1:- writeln("Enter two number: "),
    read(A),read(B),
    art(A,B).

    art(A,B):-
        S is A+B,
        D is A-B,
        write("Sum is: "),writeln(S),
        write("diff is: "),writeln(D).
        
        
first:- writeln("Sultan").

    
    

