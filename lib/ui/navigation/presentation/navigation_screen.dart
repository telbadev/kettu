
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kettu/ui/home/presentation/home_screen.dart';
import 'package:provider/provider.dart';

import '../provider/bottom_view_model.dart';

class BottomNav extends StatefulWidget {
  final Widget? child;
  const BottomNav({super.key, this.child});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {


  @override
  Widget build(BuildContext context) {
    return true?
    Scaffold(
      body: context.watch<BottomNavViewModel>().screens[context.watch<BottomNavViewModel>().selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            backgroundColor: Colors.white,
            indicatorColor: Color(0x8110B981),
            elevation: 100,
            labelTextStyle: MaterialStateProperty.all(const TextStyle(fontSize: 10,))
        ),
        child: NavigationBar(
          // height: 60,
          backgroundColor: Colors.white,
          elevation: 7,
          selectedIndex: context.watch<BottomNavViewModel>().selectedIndex,
          onDestinationSelected: (value) => context.read<BottomNavViewModel>().changeScreen(value),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home_1_bold,color: Colors.grey,), label: 'Home',selectedIcon: Icon(Iconsax.home_1_bold,color: Colors.white,),),
            NavigationDestination(icon: Icon(Iconsax.routing_2_outline,color: Colors.grey,), label: 'Route',selectedIcon: Icon(Iconsax.routing_2_outline,color: Colors.white,),),
            NavigationDestination(icon: Icon(Iconsax.pen_add_outline,color: Colors.grey,), label: 'Testni boshlash',selectedIcon: Icon(Iconsax.pen_add_outline,color: Colors.white,),),
            NavigationDestination(icon: Icon(Iconsax.user_outline,color: Colors.grey,), label: 'Hisob',selectedIcon: Icon(Iconsax.user_outline,color: Colors.white,),),
          ],
        ),
      ),
    )
        :CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Asosiy'
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: 'Qidirish'
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.pencil_outline),
              label: 'Testni boshlash'
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_alt_circle),
              label: 'Hisob'
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            if (index==0) {
              return const HomeScreen();
            } else if (index==1) {
              return Container();
            }
            else if (index==2) {
              return  Container();
            }
            else if (index==3) {
              return Container();
            }
            return const HomeScreen();
          },
        );
      },

    );
  }
}