import 'package:flutter/material.dart';

class NavigationBarModel with ChangeNotifier {

  int _currentPage = 0;

  int get currentPage => this._currentPage;

  set currentPage(int page) {
    this._currentPage = page;
    notifyListeners();
  }
}