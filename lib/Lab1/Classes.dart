
class BankAccount {
  String ownerName;
  String accountNumber;
  double balance;
  List<Deposit> deposits = [];
  BankAccount({required this.ownerName, required this.accountNumber, required this.balance});

  void openDeposit(Deposit deposit) {
    deposits.add(deposit);
  }

  void accrueInterest() {
    for (var deposit in deposits) {
      deposit.accrueInterest();
    }
  }

  void depositMoney(double amount) {
    balance += amount;
  }

  void withdrawMoney(double amount) {
    if (balance - amount < 0) {
      throw InsufficientFundsException();
    }
    balance -= amount;
  }

  void breakDeposit(int index) {
    deposits.removeAt(index);
  }

  double totalDeposits() {
    double total = 0;
    for (var deposit in deposits) {
      total += deposit.amount;
    }
    return total;
  }

  @override
  String toString() {
    return 'BankAccount{ownerName: $ownerName, accountNumber: $accountNumber, balance: $balance, deposits: $deposits}';
  }
}

class Deposit {
  String name;
  double amount;
  double interestRate;

  Deposit({required this.name, required this.amount, required this.interestRate});

  void accrueInterest() {
    amount *= (1 + interestRate);
  }

  @override
  String toString() {
    return 'Deposit{name: $name, amount: $amount, interestRate: $interestRate}';
  }
}

class Check{
  bool checkInput(String name, String number){
    if (name.isEmpty || !RegExp(r'^[a-zA-Z]+$').hasMatch(name)|| number.length != 8 ||  !RegExp(r'^\d+$').hasMatch(number)) {
      return false;
    }
    return true;
  }
}