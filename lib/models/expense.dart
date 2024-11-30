import 'package:expense_app/enums/catagory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
const CategoryIcons = {
  ExpenseCatagory.food: Icons.food_bank,
  ExpenseCatagory.travel: Icons.train,
  ExpenseCatagory.movie:Icons.movie,
  ExpenseCatagory.shooping:Icons.shop,
  ExpenseCatagory.others:Icons.devices_other
};

const uuid = Uuid();
final formatter = DateFormat.yMd();

class Expense{
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCatagory catagory;
  Expense(
      this.title,
      this.amount,
      this.date,
      this.catagory,
      ): id = uuid.v4();
  String getFormattedDate(){
    return formatter.format(date);
  }
}
