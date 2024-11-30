import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
 final _titleControler = TextEditingController();


 void dispose(){
   _titleControler.dispose();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return Padding(
         padding: const EdgeInsets.all(6),
      child: Column(
        children: [
         TextField(
           controller: _titleControler,
            maxLength: 50,
              decoration: onst InputDecoration(label: Text('Expense'),
              hintText: 'Expense'),
          ),
          const Row(
            children: [
            TextField(
              controller:
              decoration: InputDecoration(
              label:Text('Amount'),
              hintText: 'Amount',
            ),
            ),
          ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: (){
                  print(_titleControler.text);
                },
                child: Text('Save Expense'),)

            ],
          ),
        ],
      ),
    );
  }
}
