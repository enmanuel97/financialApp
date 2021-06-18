import 'package:flutter/material.dart';
import 'package:savemymoney/src/widgets/widgets.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double availableHeight= mediaQuery.size.height - mediaQuery.padding.top - mediaQuery.padding.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
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
                _Transactions(availableHeight)
              ],
            ),
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
      // color: Colors.red,
    );
  }

  _Balance(double height) {
    return Container(
      height: height * 0.20,
      // color: Colors.green,
    );
  }

  Widget _Transactions(double height) {
    return Container(
      height: height * 0.60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        color: Colors.white,
      ),
    );
  }
}