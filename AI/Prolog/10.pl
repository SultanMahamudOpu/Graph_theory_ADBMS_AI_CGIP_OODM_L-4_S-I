% Create a Prolog knowledge base to classify animals into categories like mammals, birds,
% reptiles, and fish. Define rules based on characteristics such as number of legs, ability to
% fly, laying eggs, and habitat.

% animal(Name, Legs, CanFly, LaysEggs, Habitat, BodyCover)
animal(dog, 4, no, no, land, hair).
animal(cat, 4, no, no, land, hair).
animal(bat, 2, yes, no, land, hair).
animal(eagle, 2, yes, yes, air, feathers).
animal(penguin, 2, no, yes, land, feathers).
animal(snake, 0, no, yes, land, scales).
animal(crocodile, 4, no, yes, water, scales).
animal(salmon, 0, no, yes, water, scales).
animal(shark, 0, no, yes, water, scales).

mammal(X) :-
    animal(X, _, _, no, _, _).

bird(X) :-
    animal(X, 2, _, yes, _, feathers).

reptile(X) :-
    animal(X, _, no, yes, _, scales).

fish(X) :-
    animal(X, 0, no, yes, water, scales).


classify(X, mammal) :- mammal(X).
classify(X, bird) :- bird(X).
classify(X, reptile) :- reptile(X).
classify(X, fish) :- fish(X).