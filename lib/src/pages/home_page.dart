import 'package:flutter/material.dart';
import 'package:savemymoney/src/widgets/widgets.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Home Page'),
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
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}