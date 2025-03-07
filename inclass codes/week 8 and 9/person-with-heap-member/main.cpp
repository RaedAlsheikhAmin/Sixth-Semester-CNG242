#include <iostream>
#include "Person.h"
using namespace std;

ostream& operator<<(ostream& os, const Person &person){
    os << person.no << " " << person.name << endl;
    return os;
}

int main() {
    Person p1("Rhian Smith", 23, 1993);
    Person p5("Bek Halil", 34, 1992);
    p1 = p5;//Assigment operator
    cout << p1;//cout operation is performed

    /*cout << p1.getNo() << endl;

    Person *p3;
    p3 = new Person("Bek Smith", 26, 1992);
    delete p3;

    Person p4 = p1;*/

    return 0;
}
