%  Define simple facts about relationships (e.g., family relations, food preferences) and write queries to test them.

%  Facts about family relationships
parent(shahin,sultan).
parent(shahin,dipu).
parent(shahin,ripon).
parent(shipon,sultan).
parent(shipon,dipu).
parent(shipon,ripon).
parent(dada,shahin).

male(shahin).
male(sultan).
male(dipu).
male(ripon).
male(dada).

female(shipon).

%  Rules to determine relationships
father(X,Y):- parent(X,Y),male(X).
mother(X,Y):- parent(X,Y),female(X).
grandparent(X,Y):- parent(X,Z),parent(Z,Y).
sibling(X,Y):- parent(Z,X),parent(Z,Y),X\=Y.


%  Food Preference Example
likes(sultan, pizza).
likes(dipu, burger).
likes(ripon, pizza).
likes(shipon, ice_cream).
likes(lopa, pizza).

same_food(X,Y):- likes(X,Z), likes(Y,Z), X\=Y.