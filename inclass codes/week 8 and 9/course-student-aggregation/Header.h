//
// Created by Sukru Eraslan on 30.04.2024.
//

#ifndef COURSE_STUDENT_AGGREGATION_HEADER_H
#define COURSE_STUDENT_AGGREGATION_HEADER_H

class Student{
private:
    int stdno;
public:
    char *name;
    Student(const char* name, int stdno);
    Student(const Student &s);
    void operator=(const Student &s);
    ~Student();
};

class Course{
private:
    char *code;
    int numberofstudents;
    Student *students[50];
public:
    Course(const char *code);
    Course(const Course &c);
    void operator=(const Course &c);
    ~Course();
    void registerer(Student &s);
    void printAttendance();
};

#endif //COURSE_STUDENT_AGGREGATION_HEADER_H
