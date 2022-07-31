import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled41/Screens/home_screen.dart';
import 'package:untitled41/modles/money.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);
  static int groupId=0;
  static TextEditingController descriptionController= TextEditingController();
  static TextEditingController priceController= TextEditingController();

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'تراکنش جدید',
              style: TextStyle(fontSize: 18),
            ),
             MyTextField(hintText: 'توضیحات',controller: NewPage.descriptionController,),
             MyTextField(
              hintText: 'مبلغ',controller: NewPage.priceController,
              type: TextInputType.number,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'تاریخ',
                  style: TextStyle(color: Colors.black),
                )),
             MyRadio(value: 1,
                 groupValue: NewPage.groupId,
                 onChanged: (value){
               setState((){
                 NewPage.groupId=value!;
               });
             },
                 text: 'پرداختی'),
            MyRadio(value: 2, groupValue:  NewPage.groupId,
                onChanged: (value){
                  setState((){
                    NewPage.groupId=value!;
                  });
                },
                text: 'دریافتی'),
            Container(width: 500,height: 50,color:Colors.indigo,
              child: ElevatedButton(onPressed: (){
                HomeScreen.moneys.add(
                    Money(id:Random().nextInt(99999),
                        title:NewPage.descriptionController.text,
                        price:NewPage.priceController.text,
                        isReceived:NewPage.groupId==1? true:false,
                        data: '1400/01/01'),);
                Navigator.pop(context);
              },
                  child:const Text('اضافه کردن')
              ),
            )
          ],
        ),
      ),
    ));
  }
}
class MyTextField extends StatelessWidget {
  final TextInputType type;
  final String hintText;
  final TextEditingController controller;
  const MyTextField(
      {Key? key,required this.controller, required this.hintText, this.type = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        hintText: hintText,
      ),
    );
  }
}

class MyRadio extends StatelessWidget {
  final int value;
  final int groupValue;
  final Function (int?) onChanged;
  final String text;
  const MyRadio({Key? key, required this.value, required this.groupValue,
    required this.onChanged, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row (mainAxisAlignment: MainAxisAlignment.end,
      children: [Radio(activeColor: const Color(0XFF6C63FF),
          value: value,
          groupValue: groupValue,
          onChanged: onChanged),
        Text(text),

      ],
    );
  }
}

