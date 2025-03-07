#include <iostream>
using namespace std;

class Animal{
public:
    virtual void talk(){
        cout << "I am an animal" << endl;
    }
};

class Cat: public Animal{
public:
    void talk(){
        cout << "Meow" << endl;
    }
};

class Dog: public Animal{
public:
    void talk(){
        cout << "Woof woof" << endl;
    }
};

int main() {
    Animal a;
    Cat c;
    Dog d;

    a.talk();
    c.talk();
    d.talk();

    Animal *pa, *pc, *pd;
    pa = &a;
    pc = &c;
    pd = &d;

    pa->talk();
    pc->talk();
    pd->talk();


    return 0;
}
