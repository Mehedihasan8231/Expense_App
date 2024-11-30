import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseListItem extends StatelessWidget {
  final Expense expense;
  const ExpenseListItem({super.key,required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        child: Row(
          children: [
            Text(expense.title),
            const Spacer(),

           Row(
             children: [
               Icon(Icons.alarm),

               Text(expense.date.toString()),
             ],
           ),
            Text(expense.amount.toStringAsFixed(2)),
          ],
        ),
          ),
    );
  }
}
