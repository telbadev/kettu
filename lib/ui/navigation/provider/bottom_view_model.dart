
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kettu/ui/route/presentation/route_screen.dart';

import '../../home/presentation/home_screen.dart';

class BottomNavViewModel extends ChangeNotifier {
  int selectedIndex = 0;
  List screens = [
    HomeScreen(),
    RouteScreen(),
    Container(),
    Container()
  ];



  void changeScreen(index) {
    selectedIndex = index;
    notifyListeners();
  }
}