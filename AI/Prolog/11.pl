% Implement a Prolog expert system to diagnose basic car problems. Include rules that
% identify issues like dead battery, flat tire, or engine trouble based on observable
% symptoms (e.g., engine won’t start, lights dim, unusual noises).

% diagnose(Problem, Symptoms)
diagnose(dead_battery, Symptoms) :-
    member(engine_wont_start, Symptoms),
    member(lights_dim, Symptoms).

diagnose(flat_tire, Symptoms) :-
    member(car_pulls_sideways, Symptoms),
    member(tire_pressure_low, Symptoms).

diagnose(engine_trouble, Symptoms) :-
    member(engine_wont_start, Symptoms),
    member(unusual_noise, Symptoms).

diagnose(overheating, Symptoms) :-
    member(engine_hot, Symptoms),
    member(smoke_from_engine, Symptoms).

solution(dead_battery, 'Recharge or replace the battery.').
solution(flat_tire, 'Replace or inflate the tire.').
solution(engine_trouble, 'Check spark plugs or consult mechanic.').
solution(overheating, 'Check coolant level and radiator.').

diagnose_car(Symptoms) :-
    diagnose(Problem, Symptoms),
    format('Problem detected: ~w~n', [Problem]),
    solution(Problem, Advice),
    format('Suggested solution: ~w~n~n', [Advice]),
    fail.
diagnose_car(_).

% ?- diagnose_car([engine_wont_start, lights_dim]).
% ?- solution(dead_battery,A).
%  diagnose(A,[light_dim]).