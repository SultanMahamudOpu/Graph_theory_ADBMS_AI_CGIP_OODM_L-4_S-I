% % Design and implement a basic AI-powered medical diagnosis system using Prolog. The
% % system should identify common illnesses by analyzing symptoms and offer appropriate
% % treatment suggestions.

% % symptoms of common illnessess
% has_symptom(fever, cold).
% has_symptom(cough, cold).
% has_symptom(runny_nose, cold).

% has_symptom(fever, flu).
% has_symptom(cough, flu).
% has_symptom(headache, flu).
% has_symptom(body_pain, flu).

% has_symptom(fever, dengue).
% has_symptom(headache, dengue).
% has_symptom(rash, dengue).
% has_symptom(joint_pain, dengue).

% % treatment suggestions
% treatment(cold, 'Drink warm fluids, rest, and take paracetamol.').
% treatment(flu, 'Take antiviral medicines, rest, and drink fluids.').
% treatment(dengue, 'Consult a doctor, drink fluids, and get blood tests.').

% % diagnose illness based on symptoms
% diagnose(Illness,Symptoms):-
%     has_symptom(S1,Illness),
%     member(S1,Symptoms).
%     % has_symptom(S2,Illness),
%     % member(S2,Symptoms),
%     % has_symptom(S3,Illness),
%     % member(S3,Symptoms).

% % diagnose patinet -> list of possible illness with treatment
% diagnose_patient(Symptoms):-
%     diagnose(Illness,Symptoms),
%     format('You may have: ~w~n', [Illness]),
%     treatment(Illness, Advice),
%     format('Suggested treatment: ~w~n~n', [Advice]),
%     fail.
% diagnose_patient(_).
    
% ?- diagnose_patient([fever, cough, runny_nose]).



% symptoms of common illnessess
diagnose(cold, Symptoms):-
    member(fever, Symptoms),
    member(cough, Symptoms),
    member(runny_nose, Symptoms).
    
diagnose(flu, Symptoms):-
    member(fever, Symptoms),
    member(cough, Symptoms),
    member(headache, Symptoms),
    member(body_pain, Symptoms).

diagnose(dengue, Symptoms):-
    member(fever, Symptoms),
    member(headache, Symptoms),
    member(rash, Symptoms),
    member(joint_pain, Symptoms).
    

% treatment suggestions
treatment(cold, 'Drink warm fluids, rest, and take paracetamol.').
treatment(flu, 'Take antiviral medicines, rest, and drink fluids.').
treatment(dengue, 'Consult a doctor, drink fluids, and get blood tests.').

% diagnose patinet -> list of possible illness with treatment
diagnose_patient(Symptoms):-
    diagnose(Illness,Symptoms),
    format('You may have: ~w~n', [Illness]),
    treatment(Illness, Advice),
    format('Suggested treatment: ~w~n~n', [Advice]),
    fail.
diagnose_patient(_).
    
% ?- diagnose_patient([fever, cough, runny_nose]).