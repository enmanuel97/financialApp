import 'package:flutter/material.dart';

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
}