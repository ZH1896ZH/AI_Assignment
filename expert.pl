% AI-Technologies Assigment
% Authors: Robin Roth, Christian Roth
% This knowledge base is part of the final assignment.

% diseases that will be checked.
disease(hearing).
disease(mental).

disease(cholestorol).
disease(diabetes).
disease(heart).

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
person(fredy). % mental illness and between 55 and 65
person(jakob). % has 3 diseses


age(john, 55).
age(mark, 18).
age(alice, 71).
age(bob, 45).
age(mike, 25).
age(hans, 68).
age(peter, 68).
age(fredy, 57).
age(jakob, 40).


citizen(john, ch).
citizen(mark, ch).
citizen(alice, ch).
citizen(bob, us).
citizen(mike, ch).
citizen(hans, ch).
citizen(peter, ch).
citizen(fredy, ch).
citizen(jakob, ch).

%------------------------------------------------------------------------------
% If a person has a disease it is a patient.
%------------------------------------------------------------------------------

%patient(X,Y):- person(X), disease(Y).
patient(mike, hearing).
patient(hans, mental).
patient(fredy, mental).
patient(jakob, mental).
patient(jakob, hearing).
patient(jakob, heart).

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
mental_check(X) :- person(X), \+ (age(X, Y), Y > 65, patient(X, mental)).

% count number of elements in a list (recursive)
% code found here (https://stackoverflow.com/questions/44999026/counting-list-size-resulting-from-a-findall-not-working-in-prolog)
list_length([] , 0 ).
list_length([_|Xs] , L ) :- 
        list_length(Xs,N) , 
        L is N+1 .

% list of diseases a given patient has
disease_list(X,L) :- findall(Y, patient(X,Y),L).

% check if patient has more than two diseases
more_than_two_diseases(X, List, Count) :- disease_list(X, List), list_length(List, Count), Count > 2.

% people having three or more diseases
high_risk_value(X) :- person(X), more_than_two_diseases(X, _, _).

% people older than 55 AND (suffer from mental ilnesses OR having 2 diseases)
medium_risk_value(X) :- person(X), (age(X,Y), Y > 55, patient(X, mental)).

% people whose risk values are not high and medium --> low
low_risk_value(X) :- person(X), \+ (medium_risk_value(X);  high_risk_value(X)).

% is person actually eilgible?
eligible(X) :- old_enough(X), young_enough(X), swiss(X), good_hearing(X), 
    mental_check(X), low_risk_value(X).

% is person actually eilgible, but has to pay extra fees?
eligible_with_extra_fee(X) :- old_enough(X), young_enough(X), swiss(X), 
    good_hearing(X), mental_check(X), medium_risk_value(X).
