% Write recursive predicates to solve problems: Calculating factorial, and Finding the nth Fibonacci number

% factorial
% %5! 5*4*3*2*1
%base case
factorial(0,1).

% recursive case
factorial(N,Result):-
    N>0,
    N1 is N-1,
    factorial(N1,R1),
    Result is N*R1.

% nth fibonacci number
% 0+1+1+2+3+5+8......
% base cases
fib(0,0).
fib(1,1).

% recursive case
fib(N,Result):-
    N>1,
    N1 is N-1,
    N2 is N-2,
    fib(N1,R1),
    fib(N2,R2),
    Result is R1+R2.
