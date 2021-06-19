import 'package:flutter/material.dart';
import 'package:savemymoney/src/widgets/widgets.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double availableHeight= mediaQuery.size.height - mediaQuery.padding.top - mediaQuery.padding.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff3895F5),
                Color(0xff27DFFB),
              ]
            )
          ),
          child: Column(
            children: [
              _CustomAppBar(availableHeight),
              _Balance(availableHeight),
              _Transactions(context, availableHeight)
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

  _CustomAppBar(double height) {
    return Container(
      height: height * 0.20,
    );
  }

  _Balance(double height) {
    return Container(
      height: height * 0.20,
    );
  }

  Widget _Transactions(BuildContext context, double height) {

    final items = List<String>.generate(10, (i) => 'Item ${i + 1}');

    return Container(
      height: height * 0.60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 35, bottom: 0),
            child: Row(
              children: [
                Text('Last Transactions', style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff425587)
                )),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    print('See all transactions');
                  },
                  child: Text('See all', style: TextStyle(
                      fontSize: 18, 
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
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.facebook),
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              Text('Netflix', style: TextStyle(
                                color: Color(0xff425587),
                                fontSize: 18
                              )),
                              Text('7 March', style: TextStyle(
                                fontSize: 14
                              ))
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('-\$8.99', style: TextStyle(
                                color: Color(0xffF66061),
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              )),
                              Text('Subscription', style: TextStyle(
                                fontSize: 14
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