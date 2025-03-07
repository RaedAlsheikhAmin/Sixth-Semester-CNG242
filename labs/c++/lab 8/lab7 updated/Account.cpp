//
// Created by labuser on 4/19/2024.
//
using namespace std;
#include <iostream>
#include <cmath>
#include "Account.h"

Account::Account(int accountNumber, float accountBalance) : accountNumber(accountNumber),
                                                            accountBalance(accountBalance) {}

int Account::getAccountNumber() const {
    return accountNumber;
}

void Account::setAccountNumber(int accountNumber) {
    Account::accountNumber = accountNumber;
}

float Account::getAccountBalance() const {
    return accountBalance;
}

void Account::setAccountBalance(float accountBalance) {
    Account::accountBalance = accountBalance;
}
Account::Account() : accountNumber(0),accountBalance(0) {}

void Account::inputTransaction(char type, float amount)
{
    if(type=='D' || type =='d')
    {
        accountBalance+=amount;
    }
    if(type=='W' || type =='w')
    {
        if(amount>accountBalance)
        {
            cout<<"Error! balance is not enough";
        }
        else
            accountBalance-=amount;
    }
}
void Account::calculateFutureBalance(float annual_interest, int year)
{
    float futurebalance;
    futurebalance= pow((1+annual_interest),year)*accountBalance;
    setAccountBalance(futurebalance);
}