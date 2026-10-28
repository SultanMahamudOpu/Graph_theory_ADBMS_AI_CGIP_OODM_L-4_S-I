% Create a Prolog knowledge base to recommend dishes or meals based on dietary
% restrictions and preferences. Include rules considering allergies, vegetarian/vegan
% preference, and cuisine type.

% dish(Name, DietType, Cuisine, Ingredients)
dish(veg_pasta, vegetarian, italian, [pasta, tomato, cheese]).
dish(margherita_pizza, vegetarian, italian, [flour, cheese, tomato]).
dish(vegan_salad, vegan, international, [lettuce, tomato, olive]).
dish(chicken_curry, non_vegetarian, indian, [chicken, spice, yogurt]).
dish(paneer_butter_masala, vegetarian, indian, [paneer, butter, cream]).
dish(shrimp_fried_rice, non_vegetarian, chinese, [shrimp, rice, soy]).
dish(vegan_buddha_bowl, vegan, international, [quinoa, chickpeas, vegetables]).


% Allergy Checking Rule
% contains_allergen(DishIngredients, AllergyList)
contains_allergen(Ingredients, Allergies) :-
    member(A, Allergies),
    member(A, Ingredients).

% safe_dish(Diet, Cuisine, Allergies, Name)
safe_dish(Diet, Cuisine, Allergies, Name) :-
    dish(Name, Diet, Cuisine, Ingredients),
    \+ contains_allergen(Ingredients, Allergies).

% ?- safe_dish(vegetarian, A, [dairy], B).