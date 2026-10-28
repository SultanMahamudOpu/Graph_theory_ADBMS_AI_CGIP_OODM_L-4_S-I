% Implement a Prolog system to suggest travel destinations based on preferences such as
% climate, budget, and activity type

% destinations(Place, climate, budget, type)
dest(cox_bazer, hot, medium, beach).
dest(sajek, moderate, low, nature).
dest(sylhet, moderate, medium, nature).
dest(dhaka, hot, high, cultural).
dest(nepal, cold, medium, adventure).
dest(maldives,hot,high,beach).
dest(thailand, hot, medium, beach).

suggest(Climate, Budget, Activity, Place):-
    dest(Place, Climate, Budget, Activity).
