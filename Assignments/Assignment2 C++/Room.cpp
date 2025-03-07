/* Raed Alsheikh Amin – 2528271
I read and accept the submission rules and the extra rules specified in each
question. This is my own work that is done by myself only */

#include "Room.h"
#include <cstring>
Room::Room() {
    this->roomname= new char[strlen("Undefined")+1];
    strcpy(this->roomname,"Undefined");
    this->floorNo=-1;
}
Room::Room(char * name, int floorno) {
    this->roomname= new char[strlen(name)+1];
    strcpy(this->roomname,name);
    this->floorNo=floorno;
}
Room::~Room()
{
    delete[] roomname;
}
Room::Room(const Room& r)
{
        roomname = new char[strlen(r.roomname) + 1];
        strcpy(roomname, r.roomname);
        floorNo=r.floorNo;
}

Room& Room::operator=(const Room &r) {
    delete[] roomname;
    roomname = new char[strlen(r.roomname) + 1];
    strcpy(roomname, r.roomname);
    floorNo=r.floorNo;

    return *this;
}


char *Room::getRoomname()  {
    return roomname;
}

void Room::setRoomname(char *roomname) {
    Room::roomname = roomname;
}

int Room::getFloorNo()  {
    return floorNo;
}

void Room::setFloorNo(int floorNo) {
    Room::floorNo = floorNo;
}
//virtual methods with empty body => because we won't have room in our program, the objects will be either classrooms or offices
void Room:: printRoom() {

}
int Room:: getRoomID(){
    return 0;
}
int Room::getCapacity(){
    return 0;
}
bool Room::isFull(){
    return true;
}
bool Room::checkSuitability(int numofstudent) {
    return true;
}