% Facts
can_fly(crow).
can_fly(sparrow).
can_fly(eagle).

cannot_fly(penguin).
cannot_fly(ostrich).

% Rules
bird_can_fly(Bird) :- can_fly(Bird), format('~w can fly.~n', [Bird]).
bird_can_fly(Bird) :- cannot_fly(Bird), format('~w cannot fly.~n', [Bird]).
