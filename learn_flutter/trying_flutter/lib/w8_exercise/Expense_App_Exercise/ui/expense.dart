import 'package:flutter/material.dart';
import 'package:trying_flutter/w8_exercise/Expense_App_Exercise/ui/expense_form.dart';
import '../model/expense_model.dart';
import '../data/expense_repository.dart';
import 'expense_item.dart';
import 'expense_statistics.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final _expenseRepository = ExpenseRepository.instance;
  late List<Expense> _registeredExpenses;

  @override
  void initState() {
    super.initState();
    _registeredExpenses = _expenseRepository.getExpenses();
  }

  void _addExpense(Expense expense){
    _expenseRepository.addExpense(expense);
    setState(() {
      _registeredExpenses = _expenseRepository.getExpenses();
    });
  }

  void _openAddExpenseOverlay(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => ExpenseForm(onAddExpense: _addExpense)
    );
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    _expenseRepository.removeExpense(expense);
    setState(() {
      _registeredExpenses = _expenseRepository.getExpenses();
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            _undoRemove(expense, expenseIndex);
          },
        ),
      ),
    );
  }

  void _undoRemove(Expense expense, int index) {
    _expenseRepository.insertExpense(index, expense);
    setState(() {
      _registeredExpenses = _expenseRepository.getExpenses();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expense Found. Start adding some'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ListView.builder(
        itemCount: _registeredExpenses.length,
        itemBuilder: (context, index) => Dismissible(
          key: ValueKey(_registeredExpenses[index].id),
          onDismissed: (direction) => _removeExpense(_registeredExpenses[index]),
          child: ExpenseItem(_registeredExpenses[index]),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 129, 184, 210),
      appBar: AppBar(
        title: const Text("Ronan-The-Best Expenses App"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay, 
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          ExpenseStatistics(expenses: _registeredExpenses),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}