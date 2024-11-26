import 'package:uuid/uuid.dart';

class Expense{
  static const uuid = Uuid();
  final String id;
  final String title;
  final double amount;
  final DateTime time;
  final String catagory;
  Expense(
      this.title,
      this.amount,
      this.time,
      this.catagory,
      ): id = uuid.v4();
}
