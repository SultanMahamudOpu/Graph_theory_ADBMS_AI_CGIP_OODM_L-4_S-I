parent(shahin,sultan).
parent(shahin,dipu).
parent(shahin,ripon).
parent(shahin,shahanaz).
parent(shipon,sultan).
parent(shipon,dipu).
parent(shipon,ripon).
parent(shipon,shahanaz).
parent(dada,shahin).
parent(dada,uu).
parent(uu,cc).


male(shahin).
male(dipu).
male(ripon).
male(sultan).
male(uu).
female(shipon).
female(shahanaz).

father(X,Y):- parent(X,Y),male(X).
mother(X,Y):- parent(X,Y),female(X).
sibling(X,Y):- parent(Z,X),parent(Z,Y),X\=Y.
grandparent(X,Y):- parent(X,Z),parent(Z,Y).

brother(X,Y):- sibling(X,Y),male(X).
sister(X,Y):- sibling(X,Y),female(X).
cousin(X,Y):- parent(A,X),parent(B,Y),sibling(A,B),X\=Y.
uncle(X,Y):- male(X),parent(Z,Y),sibling(Z,X).

likes(sultan,pizza).
likes(lopa,pizza).
likes(ripon,burger).
likes(dipu,tea).
likes(najma,coffee).
likes(opu,burger).

same(X,Y):- likes(X,Z),likes(Y,Z).



