import 'package:flutter/material.dart';

class NavigationBarProvider with ChangeNotifier {

  int _currentPage = 0;

  int get currentPage => this._currentPage;

  set currentPage(int page) {
    this._currentPage = page;
    print('Current page $_currentPage');
    notifyListeners();
  }
}