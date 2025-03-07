lectures(turing, 9020).
lectures(codd, 9311).
lectures(backus, 9021).
lectures(ritchie, 9201).
lectures(minsky, 9414).
lectures(codd, 9314).

studies(fred, 9020).
studies(jack, 9311).
studies(jill, 9314).
studies(jill, 9414).
studies(henry, 9414).
studies(henry, 9314).


%question 1
students_of(Prof, Student):- studies(Student, ID), lectures(Prof,ID).


%question 2
employee(193,'Jones','John','173 Elm St.','Hoboken','NJ', 12345,1,'25 Jun 93',25500).
employee(181,'Doe','Betty','11 Spring St.','Paterson','NJ', 12354,3,'12 May 91',28500).
employee(127,'Jack','Williams','13 Stuart St.','Kingston','NJ', 12445,3,'27 Sep 92',29950).

employees(DeptNum, InputSal, First, Last):- employee(_,First,Last,_,_,_, _,_,_,Salary), Salary<InputSal;
											employee(_,First,Last,_,DeptNum,_, _,_,_,_).
											


%Question 3
factori(0,1).
factori(1,1).
factori(X,R):- X>1,X1 is X-1, factori(X1,R1), R is R1*X.


%Question 4
find_max(X, Y, X):- X>Y.
find_max(X,Y,Y):- Y>X.