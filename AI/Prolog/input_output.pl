go:- write('Enter a number: '),nl,
    read(X),
    write("Ther number is : "),write(X).



go1:- write('Enter two number: '),nl,
    read(X),read(Y),
    write('Numbers are: '),write(X),write(' and '),write(Y).


go2:- write("Enter two numbers: "),nl,
    read(A),read(B),
    write("The sum is: "),C is A+B,write(C).