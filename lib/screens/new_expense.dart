import 'package:flutter/material.dart';

import '../enums/catagory.dart';
import '../models/expense.dart';
import '../screens/expense_screen.dart';

class NewExpense extends StatefulWidget {
  final void Function(Expense expense) onAddExpense;
  const NewExpense({super.key,required this.onAddExpense});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {

 final _titleControler = TextEditingController();
 final _amountControler = TextEditingController();
 DateTime? _selectedDate;
 ExpenseCatagory _selectedCategory = ExpenseCatagory.others;




 void _presentDatePicker() async {
   final now = DateTime.now();
   final firstDate = DateTime(now.year - 1, now.month, now.day);
   final pickedDate = await showDatePicker(
       context: context,
       firstDate: firstDate,
       lastDate: now
   );
   setState(() {
     _selectedDate = pickedDate;
   });
 }
   void _submitExpenseData() {
     final enteredAmount = double.tryParse(_amountControler.text);
     final amountInvalid = enteredAmount == null || enteredAmount <= 0;
     if (_titleControler.text
         .trim()
         .isEmpty || amountInvalid || _selectedDate == null) {
       showDialog(
           context: context,
           builder: (BuildContext context) {
             return AlertDialog(
               title: Text('Invalid input'),
               content: Text(
                   'Please make sure you have entered valid title, amount and date'),
               actions: [
                 TextButton(onPressed: () {
                   Navigator.pop(context);
                 }, child: Text('Ok'))
               ],
             );
           }
       );
       return;
     }
      widget.onAddExpense(
       Expense(
         title: _titleControler.text,
         amount: _amountControler,
         date: _selectedDate!,
         category: _selectedCategory,

       ),
     // );
   }

 @override
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
                const SizedBox(width: 10,),
                Text(
                  _selectedDate==null?
                      'No Date Selected': formatter.format(_selectedDate!)

                ),
                IconButton(
                  onPressed:_presentDatePicker ,

                 icon: const Icon(Icons.calendar_month),
                ),
            ],
            ),

            DropdownButton(
              value: _selectedCategory,
              alignment: Alignment.topLeft,
                items: ExpenseCatagory.values.map((category) => DropdownMenuItem(
                  value: category,
                  child: Text(
                      category.name.toUpperCase()),
                ),
                )
                    .toList(),
                onChanged: (value){
                if(value == null){
                  return;
                }
                setState(() {
                  _selectedCategory = value;

                });
                }
            ),
           const  SizedBox(height: 10,),

            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: const Text('Cancel')),
                  ElevatedButton(
                    onPressed: _submitExpenseData,
                    child: const Text('Save Expense'),)

                ],
              ),
            ),
        ],
      ),
    );
  }
}
