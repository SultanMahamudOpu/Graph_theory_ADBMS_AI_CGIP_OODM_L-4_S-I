# length of a string
go:- A=" ",
atom_length(A,X).


# join two string
join_str(S1,S2,S3):- 
    name(S1,SL1),
    name(S2,SL2),
    append(SL1,SL2,SL3),
    name(S3,SL3).

join_str1(S1, S2, S3) :-
    atom_concat(S1, S2, S3).
