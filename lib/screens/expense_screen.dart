import 'package:expense_app/enums/catagory.dart';
import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';

import '../widgets/expense_list.dart';
import 'new_expense.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  final List<Expense> _registerExpense = [
  Expense('Flutter course', 15.84, DateTime.now(), ExpenseCatagory.shooping),
  Expense('Cox\'s bazar' , 32.53, DateTime.now(), ExpenseCatagory.travel)
  ];
  void _openAddExtensionModel(){
    showModalBottomSheet(
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: (expense){
          _addExpense(expense);
        }
        ),
    );

  }
  void _addExpense(Expense expense){
    setState(() {
      _registerExpense.add(expense);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense'),
        actions:  [
          IconButton(onPressed: _openAddExtensionModel,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('Chart'),
          Expanded(
            child: Card(
              child: expenseList(
                expenses: _registerExpense,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
