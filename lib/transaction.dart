import 'package:flutter/foundation.dart';

class Transaction {
  final String id; // identifier
  final String title; // spend description
  final double amount; // actual spent amount
  final DateTime date; // transaction date

  // constructor
  Transaction({
    @required this.id, 
    @required this.title, 
    @required this.amount, 
    @required this.date});
}
