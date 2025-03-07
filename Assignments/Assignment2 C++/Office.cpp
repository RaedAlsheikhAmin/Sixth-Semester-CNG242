/* Raed Alsheikh Amin – 2528271
I read and accept the submission rules and the extra rules specified in each
question. This is my own work that is done by myself only */

#include "Office.h"
#include <iostream>
using namespace std;
Office::Office():Room() {
    this->officetype= None;
    this->NumofPeople=0;
    this->officeID=2;//helper attribute to differentiate between office and classroom
}
Office::Office(char* name, int floorno, OfficeType officetype, int numofpeople)
        : Room(name, floorno), officetype(officetype), NumofPeople(numofpeople) {
    this->officeID=2;
}

Office::OfficeType Office::getOfficetype() const {
    return officetype;
}

void Office::setOfficetype(Office::OfficeType officetype) {
    Office::officetype = officetype;
}

int Office::getNumofPeople() const {
    return NumofPeople;
}

void Office::setNumofPeople(int numofPeople) {
    NumofPeople = numofPeople;
}
//to get the ID and check if it is an office or not
int Office::getRoomID()  {
    return officeID;
}

void Office::setOfficeId(int officeId) {
    officeID = officeId;
}
//checks if the office is full or not by copmaring by the number of people already assigned to the office
bool Office::isFull() {
    if(getCapacity()==NumofPeople)
        return true;
    else
        return false;
}
//it returns the number of capacity based on the type of the office(enum data)
int Office::getCapacity() {
    if(officetype==None)
        return 0;
    else if(officetype==CoordinatorOffice)
        return 1;
    else if(officetype==StandardOffice)
        return 1;
    else if(officetype==SharedOfficeFor2People)
        return 2;
    else if(officetype==SharedOfficeFor3People)
        return 3;
    else if(officetype==SharedOfficeFor10People)
        return 10;
}
//overriden function from Room class, which will be accessed by university->building->room
void Office::printRoom() {
    cout<<"Office name = "<<this->getRoomname()<<"\nOffice floor number = "<<this->getFloorNo()<<"\nOffice type= "<<this->getOfficetype()<<"\nNumber of people in office ="<<this->getNumofPeople()<<"\nOffice capacity = "<<this->getCapacity()<<endl;
    if(isFull())
        cout<<"Office is full "<<endl<<endl;
    else
        cout<<"Office is not full"<<endl<<endl;
}