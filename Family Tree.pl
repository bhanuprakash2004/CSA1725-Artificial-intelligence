% Facts
male(john).
male(bob).
male(jim).
male(tom).

female(lisa).
female(anna).
female(susan).

parent(john, bob).
parent(john, jim).
parent(anna, bob).
parent(anna, jim).

parent(bob, tom).
parent(bob, lisa).
parent(susan, tom).
parent(susan, lisa).

% Rules
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).

% Query to get details about parents
get_parents_details(Name) :-
    (father(Father, Name) -> format('Father of ~w is ~w.~n', [Name, Father]);
    mother(Mother, Name) -> format('Mother of ~w is ~w.~n', [Name, Mother]);
    format('Information about ~w is not available.~n', [Name])).

% Query to get children and relationships between them
get_children_relationships(Name) :-
    format('Children and Relationships of ~w:~n', [Name]),
    findall(Child, parent(Name, Child), Children),
    format('  Children: ~w~n', [Children]),
    print_children_relationships(Children).

print_children_relationships([]).
print_children_relationships([Child | Rest]) :-
    format('  Mother of ~w is ~w.~n', [Child, Name]),
    print_children_relationships(Rest).

% Query to check if a person is male or female
is_male_or_female(Name) :-
    (male(Name) -> format('~w is male.~n', [Name]);
    female(Name) -> format('~w is female.~n', [Name]);
    format('Information about ~w is not available.~n', [Name])).
