
class BankAccount {
  String ownerName;
  String accountNumber;
  double balance;
  List<Deposit> deposits = [];

  BankAccount(this.ownerName, this.accountNumber, this.balance);

  void setOnMoney(){
    balance++;
  }

  void withdrawMoney() {
    if (balance - 1 < 0) {
    }else{
      balance -= 1;
    }
  }

  void openDeposit(Deposit deposit) {
    deposits.add(deposit);
  }

  void breakDeposit(int index) {
    deposits.removeAt(index);
  }

  @override
  String toString() {
    double total = 0;
    for(int i = 0; i < deposits.length; i++){
      total += deposits[i].amount;
    }
    total += balance;
    return 'BankAccount{ownerName: $ownerName, accountNumber: $accountNumber, balance: $balance, deposits: $deposits, total: $total} ';
  }
}

class Deposit {
  String name;
  double amount;
  double interestRate;

  Deposit({required this.name, required this.amount, required this.interestRate});
  @override
  String toString() {
    return "name: $name, amount: $amount, rate: $interestRate %";
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