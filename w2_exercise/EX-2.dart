class BankAccount {
  final int accountId;
  final String accountName;
  double _balance = 0;

  BankAccount(this.accountId, this.accountName);

  double get balance => _balance;

  void credit(double amount){
    _balance += amount;
  }

  void withdraw(double amount){
    if(_balance - amount < 0){
      throw Exception('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }
}

class Bank {
  final String name;
  final List<BankAccount> _accounts = [];

  Bank({required this.name});

  BankAccount createAccount(int accountId, String accountName){
    if(_accounts.any((a) => a.accountId == accountId)){
      throw Exception('Account with ID $accountId already exists!');
    }
    BankAccount newAccount = BankAccount(accountId, accountName);
    _accounts.add(newAccount);
    return newAccount;
  }
}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
