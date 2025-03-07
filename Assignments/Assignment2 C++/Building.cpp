/* Raed Alsheikh Amin – 2528271
I read and accept the submission rules and the extra rules specified in each
question. This is my own work that is done by myself only */

#include "Building.h"
#include "Office.h"
#include "Classroom.h"
#include <cstring>
#include<iostream>
using namespace std;
Building::Building() {
    this->BuildingName=new char [strlen("Undefined")+1];
    strcpy(this->BuildingName,"Undefined");
    this->Size=-1;
    this->NumOfRooms=0;
}
Building::Building(char* name, int size) {
    this->BuildingName=new char [strlen(name)+1];
    strcpy(this->BuildingName,name);
    this->Size =size;
    this->NumOfRooms=0;
}
Building::~Building() {
    delete [] BuildingName;
}
//copy constructor
Building::Building(const Building& b){
    BuildingName = new char[strlen(b.BuildingName) + 1];
    strcpy(BuildingName, b.BuildingName);

    Size=b.Size;
    NumOfRooms=b.NumOfRooms;
    int i;
    for(i=0;i<b.NumOfRooms;i++)
    {
        rooms[i]=b.rooms[i];
    }

}

Building& Building::operator=(const Building &b) {
    delete[] BuildingName;
    BuildingName = new char[strlen(b.BuildingName) + 1];
    strcpy(BuildingName, b.BuildingName);

    Size=b.Size;
    NumOfRooms=b.NumOfRooms;

    for (int i = 0; i < NumOfRooms; ++i) {
        rooms[i] = b.rooms[i];
    }
}
char *Building::getBuildingName()  {
    return BuildingName;
}

void Building::setBuildingName(char *buildingName) {
    BuildingName = buildingName;
}

int Building::getSize()  {
    return Size;
}

void Building::setSize(int size) {
    Size = size;
}

 Room **Building::getRooms()  {
    return rooms;
}

int Building::getNumOfRooms()  {
    return NumOfRooms;
}

void Building::setNumOfRooms(int numOfRooms) {
    NumOfRooms = numOfRooms;
}
//a method that will add a room object which is either classroom or office based on the type to building=> using double pointer of the room.
void Building::addRoom(int type) {
    if (NumOfRooms >= 100) {
        cout << "Cannot add more rooms. Maximum capacity reached." << endl;
        return;
    }

    char name[50];
    int floorno,numofpeopleinoffice,officetype,capacity;
    Office::OfficeType officeType;
    cout<<"Please enter the name of the new room:  ";
    cin>>name;
    cout<<"Please enter the floor number of the new room: ";
    cin>>floorno;
    if(type==1)
    {
    cout<<"Please enter capacity of classroom: ";
    cin>>capacity;
        rooms[NumOfRooms] = new Classroom(name, floorno, capacity);;
        cout<<"A new Class Room has been added"<<endl;


    }
    else if(type==2)
    {
        cout<<"[1] Coordinator Office\n"
              "[2] Standard Office\n"
              "[3] Shared Office for 2 people\n"
              "[4] Shared Office for 3 people\n"
              "[5] Shared Office for 10 people\n"
              "Please enter type of office: ";
        cin>>officetype;
        //checking the office type and returning the correct one.
        switch (officetype) {
            case 1:
                officeType = Office::CoordinatorOffice;
                break;
            case 2:
                officeType = Office::StandardOffice;
                break;
            case 3:
                officeType = Office::SharedOfficeFor2People;
                break;
            case 4:
                officeType = Office::SharedOfficeFor3People;
                break;
            case 5:
                officeType = Office::SharedOfficeFor10People;
                break;
            default:
                cout << "Invalid office type input." << endl;
                return;
        }

        cout<<"Please enter number of people in the office: ";
        cin>>numofpeopleinoffice;
        rooms[NumOfRooms] = new Office(name, floorno, officeType, numofpeopleinoffice);;
        cout<<"A new office has been added"<<endl;
    }
    NumOfRooms++;
}
//it will print the building information directly from this class.
void Building::printBuilding() {
    cout<<" Building name = "<<this->getBuildingName()<<"\nBuilding size = "<<this->getSize()<<"m^2\nBuilding number of rooms = "<<this->getNumOfRooms()<<endl<<endl;
}
//it will print the rooms information for this building
void Building::printRooms() {
    int j;
    cout<<"All rooms in "<<this->getBuildingName()<<" building: "<<endl;
    for(j=0;j<this->getNumOfRooms();j++){
       this->getRooms()[j]->printRoom();
    }
}
//it will print the rooms based on the type provided by the user.
void Building::printRoomsByType(int type) {
    int j;
    if (type==1){
        cout<<"All Classrooms in "<<this->getBuildingName()<<" building:"<<endl;
        for(j=0;j<this->getNumOfRooms();j++){
            if(this->getRooms()[j]->getRoomID()==1) {
                this->getRooms()[j]->printRoom();
            }
        }

    }
    else if(type==2){
        cout<<"All Offices in "<<this->getBuildingName()<<" building:"<<endl;
        for(j=0;j<this->getNumOfRooms();j++){
            if(this->getRooms()[j]->getRoomID()==2) {
                this->getRooms()[j]->printRoom();
            }
        }
    }
}
//it will increament the counter everytime there is a class room in this building => using hte ID
int Building::getNumberOfClassrooms() {
    int count=0,j;
    for(j=0;j<this->getNumOfRooms();j++){
        if(this->getRooms()[j]->getRoomID()==1) {
            count++;
        }
    }
    return count;
}
//it will get the total capacity by adding the capacity number for each room=> t should be office to get capacity => RoomId is used.
double Building::getTotalCapacity() {
    double totalcapacity=0.0;
    int j;
    for(j=0;j<this->getNumOfRooms();j++){
        if(this->getRooms()[j]->getRoomID()==2) {
            totalcapacity+=this->getRooms()[j]->getCapacity();
        }
    }
    return totalcapacity;
}
//it will go through a loop for each room, and incremeant the counter everytime an office is countered.
int Building::getNumberOfOffices() {
    int count=0,j;
    for(j=0;j<this->getNumOfRooms();j++){
        if(this->getRooms()[j]->getRoomID()==2) {
            count++;
        }
    }
    return count;
}
//it will check if the office s available or not by looping through all the rooms then checking if it is an office, then checking if it is full or not, then printing if not.
void Building::printAvailableOffices() {
    int j;
    cout<<"Available offices in "<<this->getBuildingName()<<" building:"<<endl;
    for(j=0;j<this->getNumOfRooms();j++){
        if(this->getRooms()[j]->getRoomID()==2) {
            if(!(this->getRooms()[j]->isFull())){
                this->getRooms()[j]->printRoom();
            }

        }
    }

}
//it will compare the num of students with the available space in the room, and check if it can conatin them or not.
void Building::printSuitableClassrooms(int numofstudent) {
    int j;
    for (j = 0; j < this->getNumOfRooms(); j++) {
        if (this->getRooms()[j]->getRoomID() == 1) {
            if (this->getRooms()[j]->checkSuitability(numofstudent)) {
                this->getRooms()[j]->printRoom();
            }

        }
    }
}