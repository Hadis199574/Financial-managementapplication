import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:untitled41/Screens/Main_Screen.dart';
import 'package:untitled41/Screens/home_screen.dart';
import 'package:untitled41/modles/money.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(MoneyAdapter());
  await Hive.openBox <Money> ('moneyBox');
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  static void getData(){
    HomeScreen.moneys.clear();
    Box hiveBox = Hive.box<Money> ('moneyBox');
    for (var value in hiveBox.values){
      HomeScreen.moneys.add(value);
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'اپلیکیشن مدریت مالی',
      home: mainScreen(),
    );
  }
}
