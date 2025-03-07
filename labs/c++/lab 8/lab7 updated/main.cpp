#include <iostream>
#include "Account.h"
int main() {
    Account acc;
    int years=0;
    while(true)
    {
        cout<<"1. Change the account balance\n"
              "2. Get the current balance\n"
              "3. Deposit\n"
              "4. Withdrawal\n"
              "5. Plan your future balance\n"
              "6. Mortgage plan\n"
              "7. Exit"<<endl;

        int choice;
        cout<<"Enter your selection: ";
        cin>>choice;

        switch (choice)
        {
            case 1:
                float newbalance;
                cout<<"Enter a new account balance: ";
                cin>>newbalance;
                acc.setAccountBalance(newbalance);
                cout<<"New account balance is "<<acc.getAccountBalance()<<" TL"<<endl;
                break;
            case 2:
                cout<<"account balance is "<<acc.getAccountBalance()<<" TL"<<endl;
                break;
            case 3:
                int deposite;
                cout<<"Enter an amount for deposit: ";
                cin>>deposite;
                acc.inputTransaction('D',deposite);
                cout<<"New account balance is "<<acc.getAccountBalance()<<" TL"<<endl;
                break;
            case 4:
                int withdrawl;
                cout<<"Enter an amount for withdrawal: ";
                cin>>withdrawl;
                acc.inputTransaction('W',withdrawl);
                cout<<"\nNew account balance is "<<acc.getAccountBalance()<<" TL"<<endl;
                break;
            case 5:
                float annualrate;
                int year;
                cout<<"Enter an annual interest rate: ";
                cin>>annualrate;
                cout<<"Enter a number of years: ";
                cin>>year;
                acc.calculateFutureBalance(annualrate,year);
                cout<<"\nYour  balance will be "<<acc.getAccountBalance()<<"TL"<<" after "<<year<<" with the interest rate "<<annualrate<<endl;
                break;
            case 6:
                int motorage;
                float annualmotoragerate;
                float annualinterestrate;

                cout<<"Enter a total amount of a mortgage: ";
                cin>>motorage;
                cout<<"Enter an annual mortgage interest rate: ";
                cin>>annualmotoragerate;
                cout<<"Enter an annual interest rate: ";
                cin>>annualinterestrate;
                while(motorage>=0)
                {
                    motorage=(motorage*(annualmotoragerate+1));//some calculations
                    motorage-=acc.getAccountBalance()*(annualinterestrate+1);
                    years++;
                }
                cout<<"You require "<<years<<" years to pay"<<endl;
                break;
            case 7:
                cout<<"goodbye!";
                exit(0);
                break;

        }

    }
    return 0;
}
