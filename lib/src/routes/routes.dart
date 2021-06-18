import 'package:flutter/material.dart';
import 'package:savemymoney/src/pages/home_page.dart';
import 'package:savemymoney/src/pages/overview_page.dart';
import 'package:savemymoney/src/pages/profile_page.dart';
import 'package:savemymoney/src/pages/transactions_page.dart';

Map<String, WidgetBuilder> appRoutes() {
  return <String, WidgetBuilder> {
    'home'          : (BuildContext context) => HomePage(),
    'overview'      : (BuildContext context) => OverviewPage(),
    'transactions'  : (BuildContext context) => TransactionsPage(),
    'profile'       : (BuildContext context) => ProfilePage(),
  };
}
