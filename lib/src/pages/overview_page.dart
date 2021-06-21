import 'package:flutter/material.dart';
import 'package:savemymoney/src/widgets/chart_test.dart';

class OverviewPage extends StatefulWidget {

  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {

  String filterSelected = 'Daily';

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    // double availableHeight = mediaQuery.size.height - mediaQuery.padding.top - mediaQuery.padding.bottom;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            _customAppBar(mediaQuery.padding.top),
            _titleAndFilters(),
            _cardIncomeExpenses(),
            _chart(),
            _overdrafAlert()
          ],
        ),
      ),
    );
  }

  Widget _customAppBar(double padding) {
    return Container(
      padding: EdgeInsets.only(top: padding + 20, right: 20, left: 20),
      child: Text('Statistic', style: TextStyle(
        fontSize: 25,
        color: Color(0xff425587),
        fontWeight: FontWeight.w500
      ))
    );
  }

  Widget _titleAndFilters() {
    final filterOptions = ['Daily', 'Weekly', 'Biweekly', 'Monthly', 'Yearly'];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text('Overview', style: TextStyle(
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

  Widget _cardIncomeExpenses() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 175,
          height: 125,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Color(0xff3895F5),
                Color(0xff39B5F5),
                Colors.white
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.3)
                ),
                child: Icon(Icons.trending_up, color: Colors.white),
              ),
              SizedBox(height: 5),
              Text('Income', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text('\$354,280', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Container(
          width: 175,
          height: 125,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Color(0xff27DFFB),
                Color(0xff26E4FC),
                Colors.white
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.3)
                ),
                child: Icon(Icons.trending_down, color: Colors.white),
              ),
              SizedBox(height: 5),
              Text('Expenses', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text('\$126,450', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _chart() {
    return BarChartSample2();
  }

  Widget _overdrafAlert() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      height: 125,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Color(0xffF74F4F),
            Color(0xffF66061)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
    );
  }
}
