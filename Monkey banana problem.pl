% Initial state: monkey at floor, box at floor, banana hanging from ceiling
at(floor, monkey).
at(floor, box).
at(ceiling, banana).

% Actions available to the monkey
action(grasp, monkey, banana).
action(climb, monkey, box).
action(push, monkey, box).

% Define the state transition rules
% Grasping the banana puts it in the monkey's possession
result(grasp, State, Result) :-
    at(ceiling, banana),
    at(floor, monkey),
    at(floor, box),
    subtract(State, [at(ceiling, banana)], TempState),
    append(TempState, [in_hand(monkey, banana)], Result).

% Climbing the box puts the monkey on top of the box
result(climb, State, Result) :-
    at(floor, monkey),
    at(floor, box),
    subtract(State, [at(floor, monkey)], TempState),
    append(TempState, [on_box(monkey)], Result).

% Pushing the box moves it from the floor to the ceiling
result(push, State, Result) :-
    at(floor, monkey),
    at(floor, box),
    subtract(State, [at(floor, box)], TempState),
    append(TempState, [at(ceiling, box)], Result).

% Define the goal state
goal_state(State) :-
    member(in_hand(monkey, banana), State).

% Define the state transition function
transition(State, Action, Result) :-
    action(Action, _, _),
    result(Action, State, Result).

% Define the solve predicate using depth-first search
solve(State, Actions) :-
    goal_state(State),
    Actions = [].

solve(State, Actions) :-
    transition(State, Action, Result),
    not(member(Result, State)),
    solve(Result, RestOfActions),
    Actions = [Action | RestOfActions].
