import 'package:flutter/material.dart';
import 'package:savemymoney/src/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Save My Money',
      home: HomePage(),
    );
  }
}