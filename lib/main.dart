import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savemymoney/src/pages/main_page.dart';
import 'package:savemymoney/src/providers/navigation_bar_provider.dart';
import 'package:savemymoney/src/routes/routes.dart';

void main() {
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new NavigationBarProvider())
      ],
      child: MyApp()
    )
  );
}

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