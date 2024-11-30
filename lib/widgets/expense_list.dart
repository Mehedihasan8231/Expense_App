import 'package:expense_app/widgets/Expense_list_item.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';
class expenseList extends StatelessWidget {
  final List<Expense> expenses;
  const expenseList({super.key,required this.expenses});

  @override
  Widget build(BuildContext context) {
     return ListView. builder(
      itemCount: expenses.length,
      itemBuilder: (context,index) =>
          ExpenseListItem(expense: expenses[index]),
     );
  }
}
     