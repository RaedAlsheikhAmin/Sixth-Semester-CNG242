/* Raed Alsheikh Amin – 2528271
I read and accept the submission rules and the extra rules specified in each
question. This is my own work that is done by myself only */

#ifndef ASSIGNMENT2_C___ROOM_H
#define ASSIGNMENT2_C___ROOM_H


class Room {
protected:
    char * roomname;
    int floorNo;
public:
    Room();
    Room(char * name, int floorno);
    ~Room();//destructor
    Room(const Room&);//copy constructor
    Room& operator=(const Room&);//assignment operator

    char *getRoomname() ;

    void setRoomname(char *roomname);

    int getFloorNo() ;

    void setFloorNo(int floorNo);
//overriden methods to access the children from the parent.
    void virtual printRoom();
    int virtual getRoomID();
    int virtual getCapacity();
    bool virtual isFull();
    bool virtual checkSuitability(int);
};


#endif //ASSIGNMENT2_C___ROOM_H
