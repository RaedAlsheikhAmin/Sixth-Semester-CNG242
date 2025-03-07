/* Raed Alsheikh Amin – 2528271
I read and accept the submission rules and the extra rules specified in each
question. This is my own work that is done by myself only */

#ifndef ASSIGNMENT2_C___UNIVERSITY_H
#define ASSIGNMENT2_C___UNIVERSITY_H

#include "Building.h"
class University {
private:
    char * Name;
    Building buildings[20];
    int NumofBuildings;
public:
    University();
    University(char * name );
    University(const University &  );
    University & operator=(const University &);


    char *getName() ;

    void setName(char *name);

     Building *getBuildings() ;

    int getNumofBuildings() ;

    void setNumofBuildings(int numofBuildings);


    void addBuilding(char *, int );
    void printBuildings();
    void printRooms();
    void printRoomsByType(int);
    void printRoomTypeStatistics();
    void printAvailableOffices();
    void printTotalCapacityOfOffices();
    void printSuitableClassrooms(int);

     ~University();


};


#endif //ASSIGNMENT2_C___UNIVERSITY_H
