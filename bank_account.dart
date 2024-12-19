main() {
  //Creating an account with some balance:
  final acc1 = BankAccount(accountID: '123456', balance: 10000);
  //Creating a new account with empty balance:
  final acc2 = BankAccount.startEmptyAccount(accountID: '678945');

  //Getting money from each account:
  print('=' * 50);
  acc1.withdraw(withdrawalAmount: 200);
  acc2.withdraw(withdrawalAmount: 200);

  //Testing depositing function:
  print('=' * 50);
  acc1.deposit(depositAmount: -255);
  acc1.deposit(depositAmount: 5000);
}

class BankAccount {
  late String accountID;
  late double balance;

  //Start new account with balance.
  BankAccount({required this.accountID, required this.balance});

  //Start new account with empty balance.
  BankAccount.startEmptyAccount({required String accountID}) {
    this.accountID = accountID;
    this.balance = 0;
  }

  withdraw({required double withdrawalAmount}) {
    //Method to withdraw from the client balance

    //Making sure that the amount isn't negative or euals 0
    if (withdrawalAmount > 0) {
      //Making sure that there's enough balance
      if (withdrawalAmount <= balance) {
        this.balance = balance - withdrawalAmount;
        print(
            '${withdrawalAmount} withdrawed. Your balance now: ${this.balance}');
      } else {
        print("Insufficient Palance!");
      }
    } else {
      print("Enter Correct Amount!");
    }
  }

  deposit({required double depositAmount}) {
    //Method to add deposit to account balance

    //Making sure that the amount isn't negative or euals 0
    if (depositAmount > 0) {
      this.balance += depositAmount;
      print('${depositAmount} added. Your balance now: ${this.balance}');
    } else {
      print('Enter Valid Deposit Amount!');
    }
  }

  accountInfo() {
    //Printing all the account details
    print("Account ID: ${this.accountID}, current balance: ${this.balance}");
  }
}
