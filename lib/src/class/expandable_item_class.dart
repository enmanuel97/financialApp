import 'package:flutter/material.dart';
import 'package:savemymoney/src/widgets/transaction_items_widget.dart';

class ExpandableItem {
  List<TransactionItems> items;
  String headerValue;
  IconData icon;
  Color iconColor;
  bool isExpanded;

  ExpandableItem({
    required this.items, 
    required this.headerValue, 
    required this.icon,
    this.iconColor = Colors.blue,
    this.isExpanded = false
  });
}