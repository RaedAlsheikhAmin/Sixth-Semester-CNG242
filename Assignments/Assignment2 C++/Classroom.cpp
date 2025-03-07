/* Raed Alsheikh Amin – 2528271
I read and accept the submission rules and the extra rules specified in each
question. This is my own work that is done by myself only */

#include "Classroom.h"
#include <iostream>
using namespace std;
Classroom::Classroom():Room() {
    this->Capacity=-1;
    this->ClassroomID=1;
}
Classroom::Classroom(char *name, int floorno,int capacity):Room(name,floorno) {
    this->Capacity=capacity;
    this->ClassroomID=1;
}
Classroom& Classroom::operator=(const Classroom& c) {

    Room::operator=(c);
    Capacity = c.Capacity;
    return *this;
}
int Classroom::getCapacity() const {
    return Capacity;
}

void Classroom::setCapacity(int capacity) {
    Capacity = capacity;
}
//needed to differentiate between classroom and office, in Room class.
int Classroom::getRoomID()  {
    return ClassroomID;
}

void Classroom::setClassroomId(int classroomId) {
    ClassroomID = classroomId;
}

bool Classroom::checkSuitability(int numofstudents) {
    if((this->getCapacity())>= numofstudents)
        return true;

    return false;
}
void Classroom::printRoom() {
    cout<<"Classroom name = "<<this->getRoomname()<<"\nClassroom floor number = "<<this->getFloorNo()<<"\nClassroom capacity = "<<this->getCapacity()<<endl<<endl;

}