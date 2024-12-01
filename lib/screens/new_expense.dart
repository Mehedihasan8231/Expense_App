import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {

 final _titleControler = TextEditingController();
 final _amountControler = TextEditingController();
 DateTime? _selectedDate;


 void _presentDatePicker() async{
   final now = DateTime.now();
   final firstDate = DateTime(now.year-1,now.month,now.day);
   final pickedDate = await showDatePicker(
       context: context,
       firstDate: firstDate,
       lastDate: now
   );
   setState(() {
     _selectedDate = pickedDate;
   });


 }

 void dispose(){
   _titleControler.dispose();
   _amountControler.dispose();
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
              decoration: const  InputDecoration(label: Text('Expense'),
              hintText: 'Expense'),
          ),

            Row(
              children: [
                //Input for title
              Expanded(
                child: TextField(
                  controller: _amountControler,
                  keyboardType: TextInputType.number,
                  decoration:const  InputDecoration(
                  label:Text('Amount'),
                  hintText: 'Amount',
                    prefixText: '\$',
                ),
                ),
              ),
                SizedBox(width: 10,),
                Text(
                  _selectedDate==null?
                      'No Date Selected': formatter.format(_selectedDate!)

                ),
                IconButton(
                  onPressed:_presentDatePicker ,

                 icon: Icon(Icons.calendar_month),
                ),
            ],
            ),
            Row(
              children: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Cancel')),
                ElevatedButton(
                  onPressed: (){
                    print(_titleControler.text);
                  },
                  child: const Text('Save Expense'),)
            
              ],
            ),
        ],
      ),
    );
  }
}
