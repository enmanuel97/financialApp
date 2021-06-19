import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savemymoney/src/providers/navigation_bar_provider.dart';
import 'package:savemymoney/src/widgets/widgets.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double availableHeight= mediaQuery.size.height - mediaQuery.padding.top - mediaQuery.padding.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              _customAppBar(availableHeight, mediaQuery.padding.top),
              _balance(availableHeight),
              _options(availableHeight),
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

  _customAppBar(double height, double padding) {
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
            children: [
              IconButton(
                icon: Icon(Icons.notifications_outlined, size: 30, color: Colors.white),
                onPressed: () {},
              ),
              Positioned(
                bottom: 22,
                right: 14,
                child: Container(
                  height: 10,
                  width: 10,
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

  _balance(double height) {
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

  _options(double height) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xff27DFFB).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                  // boxShadow: <BoxShadow>[
                  //   BoxShadow(
                  //     color: Color(0xff3895F5),
                  //     blurRadius: 3,
                  //     offset: Offset(0, 5),
                  //     spreadRadius: 3
                  //   )
                  // ]
                ),
                child: Icon(Icons.send, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text('Send', style: TextStyle(
                color: Colors.white,
                fontSize: 15
              ))
            ],
          ),
          Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xff27DFFB).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Icon(Icons.topic_outlined, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text('Top Up', style: TextStyle(
                color: Colors.white,
                fontSize: 15
              ))
            ],
          ),
          Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xff27DFFB).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Icon(Icons.attach_money_sharp, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text('Pay', style: TextStyle(
                color: Colors.white,
                fontSize: 15
              ))
            ],
          ),
          Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xff27DFFB).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Icon(Icons.grid_view_outlined, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text('More', style: TextStyle(
                color: Colors.white,
                fontSize: 15
              ))
            ],
          ),
        ],
      ),
    );
  }

  Widget _transactions(BuildContext context, double height) {

    final items = List<String>.generate(10, (i) => 'Item ${i + 1}');

    return Container(
      height: height * 0.60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 35, bottom: 0),
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
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                  return true;
                },
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: (index == (items.length - 1)) ? EdgeInsets.only(bottom: 35) : EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.facebook),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12)
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: <Widget>[
                              Text('Netflix', style: TextStyle(
                                color: Color(0xff425587),
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                              )),
                              Text('7 March', style: TextStyle(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.5)
                              ))
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('-\$8.99', style: TextStyle(
                                color: Color(0xffF66061),
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              )),
                              Text('Subscription', style: TextStyle(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.5)
                              ))
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}