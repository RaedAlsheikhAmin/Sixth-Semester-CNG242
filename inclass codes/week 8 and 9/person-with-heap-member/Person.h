#ifndef PERSON_WITH_HEAP_MEMBER_PERSON_H
#define PERSON_WITH_HEAP_MEMBER_PERSON_H

#include <cstring>
#include <iostream>

using namespace std;

class Person{
	
private:
    char *name;//because of the heap member we should consider some modifications, in the destructor, constructor, copy constructor, and so on.
    int no;
    int birthyear;

public:
    Person(const char *name, int no, int birthyear){
        this->name = new char[strlen(name) + 1];
        strcpy(this->name, name);
        this->no = no;
        this->birthyear = birthyear;
        cout << "Person constructor is called: " << this->name << endl;
    }

    Person(const Person &person){
        this->name = new char[strlen(person.name) + 1];
        strcpy(this->name, person.name);
        this->no = person.no;
        //person.no = 10;
        //Because of const, it is not allowed
        this->birthyear = person.birthyear;
        cout << "Copy constructor is called: " <<  this->name << endl;
    }

    //Operator overloading -- assignment operator
    //As a member function
    void operator=(const Person &p){
        delete [] this->name;
        this->name = new char[strlen(p.name) + 1];
        strcpy(this->name, p.name);
        this->no = p.no;
        this->birthyear = p.birthyear;
        cout << "Assignment operator called" << endl;
    }

    ~Person(){
        cout << "Person destructor is called: " << this->name << endl;
        delete [] name;
    }

    int getNo() const{
        //this->no = 10;
        //Because of const
        return this->no;
    }

    const char * getName(){
        return this->name;
    }
    //const is added here -- so it means that the returned value cannot be modifed.

    //Operator overloading -- cout operation
    //As an external function
    friend ostream& operator<<(ostream& os, const Person &person);
};
#endif //PERSON_WITH_HEAP_MEMBER_PERSON_H
