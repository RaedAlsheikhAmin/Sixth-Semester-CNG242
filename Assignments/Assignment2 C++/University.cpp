/* Raed Alsheikh Amin – 2528271
I read and accept the submission rules and the extra rules specified in each
question. This is my own work that is done by myself only */

#include "University.h"
#include <cstring>
#include <iostream>
using namespace std;
University::University()  {
    this->Name=new char[strlen("Undefined")+1];
    strcpy(this->Name,"Undefined");
    this->NumofBuildings=0;
}

University::University(char *name)  {
    this->Name=new char[strlen(name)+1];
    strcpy(this->Name,name);
    this->NumofBuildings=0;
}

University::~University() {
    delete[] Name;
}
University::University(const University &  u) {

        Name = new char[strlen(u.Name) + 1];
        strcpy(Name, u.Name);


    NumofBuildings = u.NumofBuildings;

    // Copy each building
    for (int i = 0; i < NumofBuildings; i++) {
        buildings[i] = u.buildings[i];
    }
}
University & University::operator=(const University &u){
    delete[] Name;
    Name = new char[strlen(u.Name) + 1];
    strcpy(Name, u.Name);


    NumofBuildings = u.NumofBuildings;

    // Copy each building
    for (int i = 0; i < NumofBuildings; i++) {
        buildings[i] = u.buildings[i];
    }
}

char *University::getName()  {
    return Name;
}

void University::setName(char *name) {
    Name = name;
}

 Building *University::getBuildings()  {
    return buildings;
}

int University::getNumofBuildings()  {
    return NumofBuildings;
}

void University::setNumofBuildings(int numofBuildings) {
    NumofBuildings = numofBuildings;
}

void University::addBuilding(char *name, int size) {
    Building building(name,size);
    this->buildings[this->NumofBuildings]=building;
    this->setNumofBuildings(this->getNumofBuildings()+1);

}
void University::printBuildings()
{
    int i;
    for(i=0;i<this->NumofBuildings;i++){
        cout<<"["<<i+1<<"] ";
        this->getBuildings()[i].printBuilding();

    }
}
void University::printRooms()
{
    int i;
    for(i=0;i<this->NumofBuildings;i++){

        this->getBuildings()[i].printRooms();

    }
}
void University::printRoomsByType(int type)
{
    int i;
    if(type==1)
        cout<<"Classrooms in "<<this->getName()<<" university"<<endl;
    else if(type==2)
        cout<<"Offices in "<<this->getName()<<" university"<<endl;
    else {
        cout << "type entered is not available!!" << endl;
        return;
    }

    for(i=0;i<this->NumofBuildings;i++){

        this->getBuildings()[i].printRoomsByType(type);

    }
}
void University::printRoomTypeStatistics() {
    cout<<"Room Type statistics for "<<this->getName()<<" university:"<<endl;
    int i,numoffices=0,numclassrooms=0;
    for(i=0;i<this->NumofBuildings;i++){
        numoffices+=this->getBuildings()[i].getNumberOfOffices();
    }
    for(i=0;i<this->NumofBuildings;i++){
        numclassrooms+=this->getBuildings()[i].getNumberOfClassrooms();
    }
    cout<<"Number of offices = "<<numoffices<<endl;
    cout<<"Number of classrooms = "<<numclassrooms<<endl;
}
void University::printAvailableOffices() {
    cout<<"Available offices in "<<this->getName()<<" university:"<<endl;

    int i;
    for(i=0;i<this->NumofBuildings;i++){

        this->getBuildings()[i].printAvailableOffices();
    }
}
void University::printTotalCapacityOfOffices() {
    cout<<"Office capacity in "<<this->getName()<<" university:"<<endl;
    int i;
    for(i=0;i<this->NumofBuildings;i++){
       cout<<"Office capacity in  "<<this->getBuildings()[i].getBuildingName()<<" building ="<< this->getBuildings()[i].getTotalCapacity()<<endl;
    }
}
void University::printSuitableClassrooms(int numofstudents) {
    cout<<"Suitable classes in "<<this->getName()<<" university for "<<numofstudents<<" students: "<<endl;
    int i;
    for(i=0;i<this->NumofBuildings;i++){
        cout<<"Classrooms which are suitable for " << numofstudents<<" in "<<this->getBuildings()[i].getBuildingName()<<" building :"<<endl;
        this->getBuildings()[i].printSuitableClassrooms(numofstudents);
    }
}