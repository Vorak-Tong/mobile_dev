import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

enum ExpenseType{food, travel, leisure, work}

const categoryIcons = {
  ExpenseType.food: Icons.fastfood,
  ExpenseType.travel: Icons.flight_takeoff,
  ExpenseType.leisure: Icons.movie,
  ExpenseType.work: Icons.work,
};

class Expense{
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category
  }) : id = const Uuid().v4();

  String get formattedDate{
    return formatter.format(date);
  }

  @override
  String toString() {
    return 'Expense(id: $id, title: $title, amount: $amount, date: $date, category: $category)';
  }
}