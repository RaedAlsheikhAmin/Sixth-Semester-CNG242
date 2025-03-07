/* Raed Alsheikh Amin – 2528271
I read and accept the submission rules and the extra rules specified in each
question. This is my own work that is done by myself only */

#ifndef ASSIGNMENT2_C___OFFICE_H
#define ASSIGNMENT2_C___OFFICE_H

#include "Room.h"
class Office: public Room{
private:

    int officeID;//helper attribute to differentiate between office and classroom
    int NumofPeople;
public:
    enum OfficeType {None, CoordinatorOffice, StandardOffice,SharedOfficeFor2People, SharedOfficeFor3People, SharedOfficeFor10People} officetype;
    Office();
    Office(char *name, int floorno, OfficeType officetype, int numofpeople);

    OfficeType getOfficetype() const;

    void setOfficetype(OfficeType officetype);

    int getNumofPeople() const;

    void setNumofPeople(int numofPeople);

    bool isFull();//to check if the office is full or not
    int getCapacity();
    void printRoom();

    int getRoomID() ;

    void setOfficeId(int officeId);
};



#endif //ASSIGNMENT2_C___OFFICE_H
