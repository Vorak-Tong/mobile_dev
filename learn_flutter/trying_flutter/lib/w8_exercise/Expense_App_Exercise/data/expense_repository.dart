import '../model/expense_model.dart';

class ExpenseRepository {
  static final instance = ExpenseRepository._();

  ExpenseRepository._();

  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Trip",
      amount: 19.99,
      date: DateTime.now(),
      category: ExpenseType.leisure,
    ),
    Expense(
      title: "Pizza",
      amount: 7.5,
      date: DateTime.now(),
      category: ExpenseType.food,
    ),
  ];

  List<Expense> getExpenses() => _registeredExpenses;

  void addExpense(Expense expense) {
    _registeredExpenses.add(expense);
  }

  void removeExpense(Expense expense) {
    _registeredExpenses.remove(expense);
  }

  void insertExpense(int index, Expense expense) {
    _registeredExpenses.insert(index, expense);
  }
}