% Create a basic natural language parser in Prolog capable of handling simple declarative
% sentences with subjects, verbs, and objects.

% sentence → noun_phrase + verb_phrase
sentence(sentence(NP,VP))-->
    noun_phrase(NP),
    verb_phrase(VP).

% noun phrase → noun
noun_phrase(noun(N))-->
    noun(N).

% verb phrase → verb + noun phrase
verb_phrase(verb_phase(V,NP))-->
    verb(V),
    noun_phrase(NP).

% Lexicon / Vocabulary
% Nouns
noun(sultan)--> [sultan].
noun(lopa)--> [lopa].
noun(apple)--> [apple].
noun(pizza)--> [pizza].
%verbs
verb(eats)-->[eats].
verb(likes)-->[likes].
verb(sees)-->[sees].

% phrase(sentence(Tree), [john, eats, apple]).