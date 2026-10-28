% Experiment with backtracking and the cut operator (!) to control program flow and improve efficiency.

% backtrack
likes(sultan, pizza).
likes(sultan, burger).
likes(sultan, pasta).
likes(sultan, tea).
likes(lopa, coffee).
likes(lopa, chiken).

% Query, ; press করতে next backtrack এর result দেখাবে
% ?- likes(sultan,X).
% X = pizza ;
% X = burger ;
% X = pasta ;
% X = tea.

% Cut operator
animal(dog).
animal(cat).    
animal(tiger).    
animal(elephant).    
animal(cobra).    
animal(python).    

snake(cobra).
snake(python).

likes(sultan,X):-snake(X),!,fail.
likes(sultan,X):-animal(X).