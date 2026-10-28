% Implement predicates for basic arithmetic operations like addition and multiplication

add(A,B,Z):- Z is A+B.
sub(A,B,Y):- Y is A-B.
mul(A,B,W):- W is A*B.
div(A,B,V):- V is A/B.

go:- writeln("Enter two numbers: "),
    read(A),read(B),
    add(A,B,Z),write("Sum is : "),writeln(Z),
    sub(A,B,Y),write("Sub is : "),writeln(Y),
    mul(A,B,W),write("Mul is : "),writeln(W),
    div(A,B,V),write("Div is : "),writeln(V).
    
    
    
    
    
    
    
    
    
    
    