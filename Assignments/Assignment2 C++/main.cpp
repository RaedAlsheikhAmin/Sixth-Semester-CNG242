/* Raed Alsheikh Amin – 2528271
I read and accept the submission rules and the extra rules specified in each
question. This is my own work that is done by myself only */
#include <iostream>
#include "University.h"
#include "Building.h"
#include "Room.h"
#include "Office.h"
#include "Classroom.h"
#include <cstring>
using namespace std;
int main() {
    University u("Metu Ncc");
    int option,size,type,numofbuilding,floorno,officetype,numofpeopleinoffice,numofstudents;
    int valid=1;
    char name[50] ;

    while(valid){
    cout<<"\n";
   cout<<"[1] Add a new building to the university\n"
         "[2] Add a new room to a selected building\n"
         "[3] Print the buildings in the university\n"
         "[4] Print the rooms in each building in the university\n"
         "[5] Print the rooms in each building in the university based on type\n"
         "[6] Print the total number of classrooms and offices in the university\n"
         "[7] Print the available offices in each building in the university\n"
         "[8] Print the total capacity of all the offices\n"
         "[9] Print the suitable classrooms in the university based on the given number \n"
         "of students\n"
         "[0] Exit"<<endl;

        cout<<"Please enter your choice: ";
        cin>> option;

        switch(option){
            case 0:
                valid=0;
                cout<<"Thank you for using the university campus management system"<<endl;
                break;
            case 1:
                cout<<"Please enter name of building: ";
                cin>>name;
                cout<<"Please enter size of building: ";
                cin>>size;
                u.addBuilding(name,size);
                cout<<"A new building has been added to "<<u.getName()<<" University"<<endl;
                break;
            case 2:
                u.printBuildings();
                cout<<"Please enter the number of building to which the room should be added: ";
                cin>>numofbuilding;
                if(numofbuilding>u.getNumofBuildings())
                {
                    cout<<"This building number is not available"<<endl;
                    break;
                }
                cout<<"Please enter the type of room(1: Classroom/ 2: Office): ";
                cin>>type;
                u.getBuildings()[numofbuilding-1].addRoom(type);
                break;
            case 3:
                u.printBuildings();
                break;
            case 4:
                cout<<"Rooms in "<<u.getName()<<" university:"<<endl;
                u.printRooms();
                break;
            case 5:
                cout<<"Please enter type of room to display: \n[1] Classrooms \n[2] Offices "<<endl;
                cin>>type;
                u.printRoomsByType(type);
                break;
            case 6:
                u.printRoomTypeStatistics();
                break;
            case 7:
                u.printAvailableOffices();
                break;
            case 8:
                u.printTotalCapacityOfOffices();
                break;
            case 9:
                cout<<"Please enter number of students: ";
                cin>>numofstudents;
                u.printSuitableClassrooms(numofstudents);
                break;

            default:
                cout<<"please Enter a valid option!"<<endl;
                break;
        }
        }

    return 0;
}
