import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:untitled41/Screens/home_screen.dart';
import 'package:untitled41/Screens/info_screen.dart';

class mainScreen extends StatefulWidget {
  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  int currentIndex = 0;
  Widget body = Container();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        inactiveColor: Colors.black54,
        icons:const [Icons.home, Icons.info],
        activeIndex: currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        onTap: (index) {
          if (index == 0) {
            body =  const HomeScreen();
          } else {
            body = const InfoScreen();
          }
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: body,
    );
  }
}
