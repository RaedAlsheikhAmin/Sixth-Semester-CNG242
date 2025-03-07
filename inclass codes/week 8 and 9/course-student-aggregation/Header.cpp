//
// Created by Sukru Eraslan on 30.04.2024.
//
#include "Header.h"
#include <iostream>
#include <cstring>
using namespace std;

Student::Student(const char* name, int stdno){
    this->name = new char[strlen(name) + 1];
    strcpy(this->name, name);
    this->stdno = stdno;
}

Student::Student(const Student &s){
    this->name = new char [strlen(s.name) + 1];
    strcpy(this->name, s.name);
    this->stdno = s.stdno;
}

void Student::operator=(const Student &s){
    delete [] this->name;
    this->name = new char [strlen(s.name) + 1];
    strcpy(this->name, s.name);
    this->stdno = s.stdno;
}

Student::~Student(){
    delete[] this->name;
}


Course::Course(const char *code){
    this->code = new char [strlen(code) + 1];
    strcpy(this->code, code);
    this->numberofstudents = 0;
    for(int i=0; i<50; i++){
        this->students[i] = NULL;
    }
}

Course::Course(const Course &c){
    this->code = new char[strlen(c.code) + 1];
    strcpy(this->code , c.code);
    this->numberofstudents = c.numberofstudents;
    for(int i=0; i<50; i++){
        this->students[i] = c.students[i];
    }
}

void Course::operator=(const Course &c){
    delete[] this->code;
    this->code = new char[strlen(c.code) + 1];
    strcpy(this->code , c.code);
    this->numberofstudents = c.numberofstudents;
    for(int i=0; i<50; i++){
        this->students[i] = c.students[i];
    }
}

Course::~Course(){
    delete[] this->code;
}

void Course::registerer(Student &s){
    if(this->numberofstudents == 50){
        cout << "Course capacity is full" << endl;
    }
    else{
        this->students[this->numberofstudents++] = &s;
    }
}

void Course::printAttendance(){
    cout << "Student List" << endl;
    for(int i=0; i<this->numberofstudents; i++){
        cout << this->students[i]->name << endl;
    }
}