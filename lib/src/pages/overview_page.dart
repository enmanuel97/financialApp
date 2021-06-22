import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:savemymoney/src/widgets/my_chart_widget.dart';

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
          children: <Widget>[
            _customAppBar(mediaQuery.padding.top),
            _titleAndFilters(),
            _cardIncomeExpenses(mediaQuery),
            _chart(),
            _overdrafAlert(context)
          ],
        ),
      ),
    );
  }

  Widget _customAppBar(double padding) {
    return Container(
      padding: EdgeInsets.only(top: padding + 20),
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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: <Widget>[
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

  Widget _cardIncomeExpenses(MediaQueryData mediaQuery) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: mediaQuery.size.width * 0.46,
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
              children: <Widget>[
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
            width: mediaQuery.size.width * 0.46,
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
              children: <Widget>[
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
      ),
    );
  }

  Widget _chart() {
    return MyChart();
  }

  Widget _overdrafAlert(BuildContext contect) {
    final mediaQuery = MediaQuery.of(context);
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 120,
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
      child: Row(
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20)
            ),
            child: new CircularPercentIndicator(
              radius: 45.0,
              lineWidth: 4.0,
              percent: 0.81,
              center: new Text("100%", style: TextStyle(color: Colors.white)),
              progressColor: Colors.white,
            ),
          ),
          Container(
            width: mediaQuery.size.width * 0.50,
            padding: EdgeInsets.only(left: 15),
            child: Text('Your average income has decreased from last year', style: TextStyle(color: Colors.white))
          ),
          Spacer(),
          Container(
            width: mediaQuery.size.width * 0.10,
            child: IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30)
            ),
          )
        ]
      ),
    );
  }
}
