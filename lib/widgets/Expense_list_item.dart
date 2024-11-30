import 'package:expense_app/enums/catagory.dart';
import 'package:expense_app/models/expense.dart';
import 'package:flutter/foundation.dart';
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
        child: Column(
          children: [
            Text(expense.title),
            SizedBox(height: 5,),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                Spacer(),

                // const Spacer(),

               Row(

                 children: [
                   Icon(CategoryIcons[expense.catagory]),
                  // Icon(CategoryIcons[expense.catagory])

                   Text(expense.getFormattedDate()),
                 ],
               ),

              ],
            ),
          ],
        ),
          ),
    );
  }
}
