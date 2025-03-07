#include <iostream>
#include "Header.h"
using namespace std;

int main() {
    Student s1("Student 1", 1);
    Student s2("Student 2", 2);
    Student s3("Student 3", 3);
    Course cng242("CNG242");
    cng242.registerer(s1);
    cng242.registerer(s2);
    cng242.registerer(s3);
    cng242.printAttendance();
    return 0;
}
