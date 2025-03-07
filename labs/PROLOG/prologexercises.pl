man(adam).
man(peter).
woman(eve).
woman(alison).
woman(rhian).
parent(eve, peter).
parent(adam, peter).
parent(eve, alison).
parent(adam, alison).
parent(rhian,adam).

grandparent(G,C):-parent(G,A), parent(A,C).

mother(M,C):-woman(M),parent(M,C).
father(F,C):-man(F),parent(F,C).
son(S,P):-man(S),parent(P,S).
daughter(D,P):-woman(D),parent(P,D).

isfather(F):-father(F,_).
ismother(M):-mother(M,_).

isperson(P):-man(P).
isperson(P):-woman(P).

adder(X,Y,R):-R is X+Y.

employee(193, 'Jones', 'John', 25000).
employee(194, 'Betty', 'Doe', 28500).
employee(195, 'Sarah', 'Smith', 30000).

department(355, 'CNG', 193).
department(355, 'CNG', 194).
department(356, 'EEE', 195).

wellpaid(Name, Surname):-employee(No, Name, Surname, Salary), Salary > 28000.

cngemployee(Name, Surname):-employee(EmpNo, Name, Surname, Salary), department(355, 'CNG', EmpNo). 

