#include <iostream>
#include "Person.h"
using namespace std;

int main() {
    Person p1;
    cout << p1.getName() << " "<< p1.getNo() << endl;
    p1.setName("Hello World");
    p1.setNo(1000);
    cout << p1.getName() << " " << p1.getNo() <<  endl;
    //p1.setName("Hello World Hello World Hello World Hello World  Hello World  Hello World  Hello World  Hello World  Hello World ");

    Person p2;
    p2.setName("Hi World");
    p2.setNo(9999);
    cout << p2.getName() << " " << p2.getNo() << endl;

    //p2.birthyear = -10; Not accessible

    Employee e1;

    Person p3("Adam Ball", 23, 2020);
    cout << p3.getName() << endl;
    return 0;

    Person *p4;
    p4 = new Person("Bek Smith", 25, 1992);

    delete p4;

}
