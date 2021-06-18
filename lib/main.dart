import 'package:flutter/material.dart';
import 'package:savemymoney/src/pages/main_page.dart';
import 'package:savemymoney/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Save My Money',
      home: MainPage(),
      routes: appRoutes(),
    );
  }
}