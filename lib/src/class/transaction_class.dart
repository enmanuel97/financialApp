import 'package:flutter/material.dart';

class Transaction {
  final IconData? icon;
  final String? image;
  final Color iconColor;
  final Color amountColor;
  final String name;
  final String date;
  final String amount;
  final String type;

  Transaction({
    this.icon, 
    this.image, 
    required this.name, 
    required this.date, 
    required this.amount, 
    required this.type,
    required this.iconColor, 
    required this.amountColor,
  });
}