diagnose(flue, Symptoms) :-
    member(fever, Symptoms),
    member(cough, Symptoms),
    member(sore_throat, Symptoms).
    

diagnose(common_cold, Symptoms) :-
    member(sore_throat, Symptoms),
    member(cough, Symptoms).

diagnose(covid_19, Symptoms) :-
    member(loss_of_taste, Symptoms).


solution(flue, 'Take rest.').
solution(common_cold, 'Take medican and take rest.').
solution(covid_19, 'Take doctor advice.').


diagnose_pa(Symptoms) :-
    diagnose(Problem, Symptoms),
    format('Problem detected: ~w~n', [Problem]),
    solution(Problem, Advice),
    format('Suggested solution: ~w~n~n', [Advice]),
    fail.
diagnose_pa(_).
