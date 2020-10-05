% AI-Technologies Assigment
% Authors: Robin Roth, Christian Roth
% This knowledge base is part of the final assignment.

% diseases that will be checked
disease(hearing).
disease(mental).

%------------------------------------------------------------------------------
% people in the knowledge base will be defined as follows
%------------------------------------------------------------------------------

person(john).  % is eligible
person(mark).  % too young
person(alice). % too old
person(bob).   % not swiss
person(mike).  % hearing defect
person(hans).  % mental illness and over 65
person(anita).


age(john, 55).
age(mark, 18).
age(alice, 71).
age(bob, 45).
age(mike, 25).
age(hans, 68).
age(anita, 68).


citizen(john, ch).
citizen(mark, ch).
citizen(alice, ch).
citizen(bob, us).
citizen(mike, ch).
citizen(hans, ch).
citizen(anita, ch).


patient(mike, hearing).
patient(hans, mental).


%------------------------------------------------------------------------------
% The following rules are phrased in a way, where they return true, if the
% condition allows them to be elligible.
% That way to be eligibe all rules for that person must return true.
%------------------------------------------------------------------------------

% no people younger than 21 are eligible
old_enough(X) :- person(X), age(X,Y), Y > 21.

% people over 70 years of age not eligible
young_enough(X) :- person(X), age(X,Y), Y < 70.

% people living in switzerland are eligible
swiss(X) :- person(X), citizen(X,Y), Y = ch.

% people with hearing defects are not eligble
good_hearing(X) :- person(X), \+ patient(X, hearing).

% is person over 65 and suffers from mental ilnesses?
mental_check(X) :- person(X), \+ patient(X, mental), age(X, Y), Y < 65.

% is person actually eilgible?
eligible(X) :- old_enough(X), young_enough(X), swiss(X), good_hearing(X), mental_check(X).


