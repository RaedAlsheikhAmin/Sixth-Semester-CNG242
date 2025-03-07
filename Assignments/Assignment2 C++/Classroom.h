/* Raed Alsheikh Amin – 2528271
I read and accept the submission rules and the extra rules specified in each
question. This is my own work that is done by myself only */

#ifndef ASSIGNMENT2_C___CLASSROOM_H
#define ASSIGNMENT2_C___CLASSROOM_H
#include "Room.h"

class Classroom: public Room{
private:
    int ClassroomID=1;//helper attribute to differentiate between office and classroom
    int Capacity;
public:
    Classroom();
    Classroom(char *name, int floorno,int capacity);
    Classroom& operator=(const Classroom& other);
    int getCapacity() const;

    void setCapacity(int capacity);
    bool checkSuitability(int);
    void printRoom();

    int getRoomID() ;//to get the roomID and checks if it is classroom or not

    void setClassroomId(int classroomId);
};


#endif //ASSIGNMENT2_C___CLASSROOM_H
