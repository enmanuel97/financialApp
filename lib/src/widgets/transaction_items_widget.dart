import 'package:flutter/material.dart';
import 'package:savemymoney/src/class/transaction_class.dart';

class TransactionItems extends StatelessWidget {

  final Transaction transaction;
  final EdgeInsetsGeometry? padding;

  TransactionItems({
    required this.transaction, 
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    dynamic icon = this.transaction.icon;

    return Container(
      padding: this.padding,
      child: Row(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            child: (this.transaction.icon == null) ? Icon(Icons.facebook) : Icon(icon),
            decoration: BoxDecoration(
              color: this.transaction.iconColor.withOpacity(0.25),
              borderRadius: BorderRadius.circular(12)
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(this.transaction.name, style: TextStyle(
                color: Color(0xff425587),
                fontSize: 18,
                fontWeight: FontWeight.w500
              )),
              Text(this.transaction.date, style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(0.5)
              ))
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(this.transaction.amount, style: TextStyle(
                color: this.transaction.amountColor,
                fontSize: 18,
                fontWeight: FontWeight.bold
              )),
              Text(this.transaction.type, style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(0.5)
              ))
            ],
          ),
        ],
      ),
    );
  }
}