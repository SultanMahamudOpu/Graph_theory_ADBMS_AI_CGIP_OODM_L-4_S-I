# sultan likes animal without snake

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