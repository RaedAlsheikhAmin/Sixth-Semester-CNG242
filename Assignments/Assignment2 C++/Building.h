/* Raed Alsheikh Amin – 2528271
I read and accept the submission rules and the extra rules specified in each
question. This is my own work that is done by myself only */

#ifndef ASSIGNMENT2_C___BUILDING_H
#define ASSIGNMENT2_C___BUILDING_H

#include "Room.h"
class Building {

private:
    char * BuildingName;
    int Size;
    Room *rooms[100];//array of pointers to point to the object , either classroom, or office
    int NumOfRooms;
public:
    Building();

    Building(char * name,int size);
    ~Building();
    Building(const Building& b);
    Building& operator=(const Building & b);

    char *getBuildingName() ;

    void setBuildingName(char *buildingName);

    int getSize() ;

    void setSize(int size);

     Room ** getRooms() ;

    int getNumOfRooms() ;

    void setNumOfRooms(int numOfRooms);
    void addRoom(int);
    void printBuilding();
    void printRooms();
    void printRoomsByType(int);
    int getNumberOfClassrooms();
    double getTotalCapacity();
    int getNumberOfOffices();
    void printAvailableOffices();
    void printSuitableClassrooms(int);
};


#endif //ASSIGNMENT2_C___BUILDING_H
