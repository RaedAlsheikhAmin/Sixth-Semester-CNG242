//
// Created by labuser on 4/19/2024.
//

#ifndef LAB7_ACCOUNT_H
#define LAB7_ACCOUNT_H
using namespace std;

class Account {
public:
    Account(int accountNumber, float accountBalance);

    int getAccountNumber() const;

    void setAccountNumber(int accountNumber);

    float getAccountBalance() const;

    void setAccountBalance(float accountBalance);

private:
    int accountNumber;
    float accountBalance;
public:
Account ();
void inputTransaction(char type, float amount);
void calculateFutureBalance(float annual_interest, int year);
void  mortgageYear(int totalmortgage, float motorageinterest,float interest);
};


#endif //LAB7_ACCOUNT_H
