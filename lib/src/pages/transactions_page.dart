import 'package:flutter/material.dart';
import 'package:savemymoney/src/class/expandable_item_class.dart';
import 'package:savemymoney/src/class/transaction_class.dart';
import 'package:savemymoney/src/widgets/transaction_history_widget.dart';
import 'package:savemymoney/src/widgets/transaction_items_widget.dart';

class TransactionsPage extends StatefulWidget {

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {

  String filterSelected = 'This day';

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            _customAppBar(mediaQuery.padding.top),
            _titleAndFilters(),
            _transactions()
          ],
        ),
      )
    );
  }

  Widget _customAppBar(double padding) {
    return Container(
      padding: EdgeInsets.only(top: padding + 20),
      child: Text('Transaction History', style: TextStyle(
        fontSize: 25,
        color: Color(0xff425587),
        fontWeight: FontWeight.w500
      ))
    );
  }

  Widget _titleAndFilters() {
    final filterOptions = ['This day', 'This week', 'This month', 'This year'];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: <Widget>[
          Text('Category', style: TextStyle(
            fontSize: 18,
            color: Color(0xff425587),
            fontWeight: FontWeight.w500
          )),
          Spacer(),
          DropdownButton<String>(
            value: filterSelected,
            icon: Icon(Icons.keyboard_arrow_down, color: Color(0xff27DFFB)),
            iconSize: 20,
            elevation: 0,
            underline: Container(
              height: 0,
              color: Colors.transparent
            ),
            style: TextStyle(color: Color(0xff27DFFB), fontWeight: FontWeight.w500, fontSize: 18),
            onChanged: (String? newValue) {
              setState(() {
                filterSelected = newValue!;
              });
            },
            items: filterOptions.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _transactions() {

    final transactionItems = <Transaction>[
      new Transaction(icon: Icons.facebook, name: 'Netflixf', date: '7 March', amount: '-\$8.99', type: 'Subscription', iconColor: Colors.red, amountColor: Color(0xffF66061)),
      new Transaction(icon: Icons.monetization_on, name: 'Joe Ramon', date: '3 March', amount: '\$8.99', type: 'Bank Transfer', iconColor: Colors.yellow, amountColor: Color(0xff71D798)),
      new Transaction(icon: Icons.facebook, name: 'Netflix', date: '7 March', amount: '-\$8.99', type: 'Subscription', iconColor: Colors.red, amountColor: Color(0xffF66061)),
      new Transaction(icon: Icons.facebook, name: 'Netflix', date: '7 March', amount: '-\$8.99', type: 'Subscription', iconColor: Colors.red, amountColor: Color(0xffF66061)),
      new Transaction(icon: Icons.facebook, name: 'Netflix', date: '7 March', amount: '-\$8.99', type: 'Subscription', iconColor: Colors.red, amountColor: Color(0xffF66061)),
      // new Transaction(icon: Icons.facebook, name: 'Netflix', date: '7 March', amount: '-\$8.99', type: 'Subscription', iconColor: Colors.red, amountColor: Color(0xffF66061)),
      // new Transaction(icon: Icons.facebook, name: 'Netflix', date: '7 March', amount: '-\$8.99', type: 'Subscription', iconColor: Colors.red, amountColor: Color(0xffF66061)),
      // new Transaction(icon: Icons.facebook, name: 'Netflix', date: '7 March', amount: '-\$8.99', type: 'Subscription', iconColor: Colors.red, amountColor: Color(0xffF66061)),
      // new Transaction(icon: Icons.facebook, name: 'Netflix', date: '7 March', amount: '-\$8.99', type: 'Subscription', iconColor: Colors.red, amountColor: Color(0xffF66061)),
      // new Transaction(icon: Icons.facebook, name: 'Netflix', date: '7 March', amount: '-\$8.99', type: 'Subscription', iconColor: Colors.red, amountColor: Color(0xffF66061)),
    ];

    final items = transactionItems.map((e) => TransactionItems(transaction: e)).toList();

    final List<ExpandableItem> _data = [
      new ExpandableItem(items: items, headerValue: 'Transfer', icon: Icons.send, iconColor: Colors.orange),
      new ExpandableItem(items: items, headerValue: 'Entertain', icon: Icons.play_arrow_rounded, iconColor: Colors.red),
    ];

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: TransactionHistory(_data),
      ),
    );
  }
}