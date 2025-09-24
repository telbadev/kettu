import 'package:flutter/material.dart';
import 'package:kettu/ui/home/presentation/home_screen.dart';
import 'package:kettu/ui/login/presentation/login_screen.dart';
import 'package:kettu/ui/login/provider/login_view_model.dart';
import 'package:kettu/ui/navigation/presentation/navigation_screen.dart';
import 'package:kettu/ui/navigation/provider/bottom_view_model.dart';
import 'package:kettu/ui/register/provider/register_view_model.dart';
import 'package:kettu/ui/route/provider/route_view_model.dart';
import 'package:provider/provider.dart';

import 'data/theme/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel(),),
        ChangeNotifierProvider(create: (context) => RegisterViewModel(),),
        ChangeNotifierProvider(create: (context) => BottomNavViewModel(),),
        ChangeNotifierProvider(create: (context) => RouteViewModel(),)
      ],
      child: MaterialApp(
        title: 'Kettu',
        theme: MyTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: BottomNav(),
      ),
    );
  }
}
