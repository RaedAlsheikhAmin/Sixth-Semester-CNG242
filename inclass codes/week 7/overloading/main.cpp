#include <iostream>
using namespace std;

struct Complex{
    double real, imaginary;
};

typedef struct Complex Complex;

double multiply(double a, double b){
    return a*b;
}

Complex multiply(Complex c1, Complex c2){
    Complex result;
    result.real = c1.real*c2.real - c1.imaginary * c2.imaginary;
    result.imaginary = c1.real*c2.imaginary + c1.imaginary*c2.real;
    return result;
}

void complexPrinter(Complex temp){
    cout << "Real: " << temp.real << "Imag: " << temp.imaginary << endl;
}

int main() {
    double x = 1.1, y = 2.2;
    double z = multiply(x,y);
    cout << "z is " << z << endl;

    Complex ca, cb;
    ca.real =1.1;
    ca.imaginary = 1.1;

    cb.real = 2.1;
    cb.imaginary = 0.6;
    Complex cresult;
    cresult = multiply(ca, cb);

    complexPrinter(cresult);

    return 0;
}
