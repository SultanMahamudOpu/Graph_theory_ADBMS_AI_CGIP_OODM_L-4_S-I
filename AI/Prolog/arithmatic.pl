go:- write("Enter two numbers: "),nl,
    read(A),read(B),
    write("The sum is: "),C is A+B,write(C),nl,
    write("The dif is: "),D is A-B,write(D),nl,
    write("The mul is: "),E is A*B,write(E),nl,
    write("The div is: "),F is A/B,write(F).

go1:- write("Enter two numbers: "),nl,
    read(A),read(B),
    art(A,B).

    art(A,B):- 
        S is A+B,
        D is A-B,
        M is A*B,
        Div is div(A,B),
        write("The sum is: "),write(S),nl,
        write("The dif is: "),write(D),nl,
        write("The mul is: "),write(M),nl,
        write("The div is: "),write(Div).
        