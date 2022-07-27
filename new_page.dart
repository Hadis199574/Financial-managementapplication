import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

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
            const MyTextField(hintText: 'توضیحات'),
            const MyTextField(
              hintText: 'مبلغ',
              type: TextInputType.number,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'تاریخ',
                  style: TextStyle(color: Colors.black),
                )),
             MyRadio(value: 0, groupValue: 1000, onChanged: (value){},
                 text: 'پرداختی'),
            MyRadio(value: 1, groupValue: 1000, onChanged: (value){},
                text: 'دریافتی'),
          ],
        ),
      ),
    ));
  }
}
class MyTextField extends StatelessWidget {
  final TextInputType type;
  final String hintText;
  const MyTextField(
      {Key? key, required this.hintText, this.type = TextInputType.text})
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
      children: [Radio(value: value,
          groupValue: groupValue,
          onChanged: onChanged),
        Text(text),

      ],
    );
  }
}

