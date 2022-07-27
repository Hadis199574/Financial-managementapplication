import 'package:flutter/material.dart';
import 'package:untitled41/Screens/Main_Screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'اپلیکیشن مدریت مالی',
      home: mainScreen(),
    );
  }
}