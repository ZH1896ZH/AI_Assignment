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
person(peter).
person(fredy). % mental illness and over 55


age(john, 55).
age(mark, 18).
age(alice, 71).
age(bob, 45).
age(mike, 25).
age(hans, 68).
age(peter, 68).
age(fredy, 57).


citizen(john, ch).
citizen(mark, ch).
citizen(alice, ch).
citizen(bob, us).
citizen(mike, ch).
citizen(hans, ch).
citizen(peter, ch).
citizen(fredy, ch).


patient(mike, hearing).
patient(hans, mental).


%------------------------------------------------------------------------------
% The following rules are phrased in a way, where they return true, if the
% condition allows them to be eligible.
% That way to be eligibe all rules for that person must return true.
%------------------------------------------------------------------------------

% people younger than 21 are not eligible
old_enough(X) :- person(X), age(X,Y), Y > 21.

% people older than 70 are not eligible
young_enough(X) :- person(X), age(X,Y), Y < 70.

% people living in switzerland are eligible
swiss(X) :- person(X), citizen(X,Y), Y = ch.

% people with hearing defects are not eligble
good_hearing(X) :- person(X), \+ patient(X, hearing).

% people older than 65 and suffer from mental ilnesses are not eligble
mental_check(X) :- person(X), \+ (age(X, Y), Y > 64, patient(X, mental)). % why not Y>65 ???

% people having three or more diseases
high_risk_value(X):- person(X), \+ diseases_count >= 3. % is there a possibility to create integer variable ???

% people older than 55 AND (suffer from mental ilnesses OR having 2 diseases)
medium_risk_value(X):- person(X), \+ (age(X,Y), Y > 55, patient(X, mental)).

% people whose risk values are not high and medium --> low
low_risk_value(X):- person(X), \+ (medium_risk_value(X);  high_risk_value(X)).

% is person actually eilgible?
eligible(X) :- old_enough(X), young_enough(X), swiss(X), good_hearing(X), 
    mental_check(X), low_risk_value(X).

% is person actually eilgible, but has to pay extra fees?
eligible_with_extra_fee(X) :- old_enough(X), young_enough(X), swiss(X), good_hearing(X), 
    mental_check(X), medium_risk_value(X).
