import 'package:flutter/material.dart';
import 'package:savemymoney/src/class/expandable_item_class.dart';

class TransactionHistory extends StatefulWidget {
  final List<ExpandableItem> data;

  const TransactionHistory(this.data, {Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(widget.data),
      ),
    );
  }

  Widget _buildPanel(List<ExpandableItem> data) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            data[index].isExpanded = !isExpanded;
          });
        },
        elevation: 0,
        dividerColor: Colors.transparent,
        expandedHeaderPadding: EdgeInsets.zero,
        children: data.map<ExpansionPanel>((ExpandableItem item) {
          return ExpansionPanel(
            backgroundColor: Colors.transparent,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: item.iconColor.withOpacity(0.7),
                  child: Icon(item.icon, size: 20, color: Colors.white),
                ),
                title: Text(item.headerValue, style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff425587),
                  fontWeight: FontWeight.w500
                )),
              );
            },
            canTapOnHeader: true,
            body: Container(
              child: Column(
                children: item.items.map((element) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: element,
                )).toList(),
              ),
            ),
            isExpanded: item.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}
