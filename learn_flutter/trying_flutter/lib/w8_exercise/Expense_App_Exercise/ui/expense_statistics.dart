import 'package:flutter/material.dart';
import '../model/expense_model.dart';

class ExpenseStatistics extends StatelessWidget {
  const ExpenseStatistics({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    final Map<ExpenseType, List<Expense>> expensesByCategory = {};
    for (final expense in expenses) {
      if (!expensesByCategory.containsKey(expense.category)) {
        expensesByCategory[expense.category] = [];
      }
      expensesByCategory[expense.category]!.add(expense);
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      elevation: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: ExpenseType.values.map((category) {
          final categoryExpenses = expensesByCategory[category] ?? [];
          final totalAmount = categoryExpenses.fold<double>(
            0.0,
            (sum, item) => sum + item.amount,
          );

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                Icon(categoryIcons[category], size: 28),
                const SizedBox(height: 4),
                Text('\$${totalAmount.toStringAsFixed(2)}'),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}