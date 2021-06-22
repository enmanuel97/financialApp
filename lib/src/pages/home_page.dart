import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savemymoney/src/class/transaction_class.dart';
import 'package:savemymoney/src/providers/navigation_bar_provider.dart';
import 'package:savemymoney/src/widgets/transaction_items_widget.dart';
import 'package:savemymoney/src/widgets/widgets.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double availableHeight= mediaQuery.size.height - mediaQuery.padding.top - mediaQuery.padding.bottom;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerLeft,
              colors: [
                Color(0xff3895F5),
                Color(0xff27DFFB),
              ]
            )
          ),
          child: Column(
            children: <Widget>[
              _customAppBar(mediaQuery.padding.top),
              _balance(),
              _options(),
              _transactions(context, availableHeight),
            ],
          ),
        ),
      ),
      floatingActionButton: MyFloatingButton(
        primaryColor: Color(0xff3895F5),
        secundaryColor: Color(0xff27DFFB),
        hasGradient: true,
        onPressed: () { 
          print('Hola Mundo');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _customAppBar(double padding) {
    return Container(
      padding: EdgeInsets.only(top: padding + 20, right: 20, left: 20),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Image(
              image: NetworkImage('https://img.icons8.com/clouds/2x/user.png'),
            )
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Hello', style: TextStyle(
                color: Colors.white,
                fontSize: 15
              )),
              Text('One Achmad', style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500
              ))
            ],
          ),
          Spacer(),
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications_outlined, size: 30, color: Colors.white),
                onPressed: () {
                  print('Notification option');
                },
              ),
              Positioned(
                bottom: 22,
                right: 14,
                child: Container(
                  height: 9,
                  width: 9,
                  decoration: BoxDecoration(
                    color: Color(0xffF74F4F),
                    shape: BoxShape.circle
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _balance() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: <Widget>[
          Text('Balance', style: TextStyle(
            color: Colors.white,
            fontSize: 20
          )),
          SizedBox(height: 10),
          Text('\$26,520', style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.w500
          )),
        ]
      ),
    );
  }

  Widget _options() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          OptionButton(title: 'Send', icon: Icons.send, color: Color(0xff27DFFB)),
          OptionButton(title: 'Top Up', icon: Icons.topic_outlined, color: Color(0xff27DFFB)),
          OptionButton(title: 'Pay', icon: Icons.attach_money_sharp, color: Color(0xff27DFFB)),
          OptionButton(title: 'More', icon: Icons.grid_view_outlined, color: Color(0xff27DFFB)),
        ],
      ),
    );
  }

  Widget _transactions(BuildContext context, double height) {

    final items = <Transaction>[
      new Transaction(icon: Icons.facebook, name: 'Netflixf', date: '7 March', amount: '-\$8.99', type: 'Subscription', iconColor: Colors.red, amountColor: Color(0xffF66061)),
      new Transaction(icon: Icons.monetization_on, name: 'Joe Ramon', date: '3 March', amount: '\$8.99', type: 'Bank Transfer', iconColor: Colors.yellow, amountColor: Color(0xff71D798)),
      new Transaction(icon: Icons.facebook, name: 'Netflix', date: '7 March', amount: '-\$8.99', type: 'Subscription', iconColor: Colors.red, amountColor: Color(0xffF66061)),
      new Transaction(icon: Icons.facebook, name: 'Netflix', date: '7 March', amount: '-\$8.99', type: 'Subscription', iconColor: Colors.red, amountColor: Color(0xffF66061)),
      new Transaction(icon: Icons.facebook, name: 'Netflix', date: '7 March', amount: '-\$8.99', type: 'Subscription', iconColor: Colors.red, amountColor: Color(0xffF66061)),
      new Transaction(icon: Icons.facebook, name: 'Netflix', date: '7 March', amount: '-\$8.99', type: 'Subscription', iconColor: Colors.red, amountColor: Color(0xffF66061)),
      new Transaction(icon: Icons.facebook, name: 'Netflix', date: '7 March', amount: '-\$8.99', type: 'Subscription', iconColor: Colors.red, amountColor: Color(0xffF66061)),
      new Transaction(icon: Icons.facebook, name: 'Netflix', date: '7 March', amount: '-\$8.99', type: 'Subscription', iconColor: Colors.red, amountColor: Color(0xffF66061)),
      new Transaction(icon: Icons.facebook, name: 'Netflix', date: '7 March', amount: '-\$8.99', type: 'Subscription', iconColor: Colors.red, amountColor: Color(0xffF66061)),
      new Transaction(icon: Icons.facebook, name: 'Netflix', date: '7 March', amount: '-\$8.99', type: 'Subscription', iconColor: Colors.red, amountColor: Color(0xffF66061)),
    ];

    return Container(
      height: height * 0.60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 35, bottom: 10),
            child: Row(
              children: <Widget>[
                Text('Last Transactions', style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff425587),
                  fontWeight: FontWeight.w500
                )),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    final navigationBarProvider = Provider.of<NavigationBarProvider>(context, listen: false);
                    navigationBarProvider.currentPage = 2;
                  },
                  child: Text('See all', style: TextStyle(
                      fontSize: 16, 
                      color: Color(0xff3895F5),
                      fontWeight: FontWeight.bold
                    )
                  )
                )
              ],
            ),
          ),
          Expanded(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                Container(
                  child: SliverList(
                    delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: TransactionItems(
                          transaction: items[index],
                          padding: EdgeInsets.only(bottom: (index == (items.length - 1)) ? 35 : 15, top: (index == 0) ? 10 : 0),
                        ),
                      ); 
                    },
                    childCount: items.length
                  )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}