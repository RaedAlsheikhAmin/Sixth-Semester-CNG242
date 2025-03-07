//
// Created by Sukru Eraslan on 24.04.2024.
//

#ifndef PERSON_WITH_ARRAY_PERSON_H
#define PERSON_WITH_ARRAY_PERSON_H
#include <string.h>
#include <iostream>
using namespace std;

class Person{
private:
    char name[50];
    int no;
protected:
    int birthyear;
public:
    Person(){
        strcpy(name, "No name");
        no = 0;
        birthyear = 2000;
    }

    Person(const char * name, int no, int birthyear){
        if (strlen(name)>49) {
            cout << "Not suitable name" << endl;
            strcpy(this->name, "No name");
        }
        else{
            strcpy(this->name, name);
        }
        this->no = no;
        this->birthyear = birthyear;
    }

    void setName(const char * newname){
        if(strlen(newname) > 49)
            cout << "New name has more chars than expected" << endl;
        else
            strcpy(name, newname);
    }

    char * getName(){
        return name;
    }

    void setyear(int year){
        if (year > 1940 && year < 2024)
            birthyear = year;
        else
            cout << "Year is out out range" << endl;
    }
    void setNo(int);
    int getNo();
};

class Employee: public Person{
private:
    int ssn;
public:
    Employee(){
        ssn = -1;
    }
    void setSSN(int ssn){
        this->ssn = ssn;
    }
};

#endif //PERSON_WITH_ARRAY_PERSON_H
