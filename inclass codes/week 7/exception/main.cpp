#include <iostream>
using namespace std;

double division(int a, int b){
    if (b==0)
        throw "b cannot be zero!";
    return (a*1.0)/b;
}

int main() {
    int x = 50, y =0;
    double z=1;
    try {
        z = division(x, y);
        cout << "z value is " << z << endl;
    }
    catch (const char *msg){
        cout << msg << endl;
    }
    cout << "z value is " << z << endl;
    cout << "Hello, World!" << endl;
    return 0;
}
