import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:const [
               Padding(
                padding: EdgeInsets.only(right: 15.0, top: 15.0, left: 5.0),
                child: Text('مدیریت تراکنش ها به تومان '),
              ),
               ManyInfoWidget(
                  firstText: 'دریافتی امروز: ',
                  secondText: 'پرداختی امروز: ',
                  firstprice: '1000',
                  secondprice: '2000'),
               ManyInfoWidget(
                  firstText: 'دریافتی ماه: ',
                  secondText: 'پرداختی ماه: ',
                  firstprice: '10000',
                  secondprice: '20000'),
               ManyInfoWidget(
                  firstText: 'دریافتی سال: ',
                  secondText: 'پرداختی سال: ',
                  firstprice: '100000',
                  secondprice: '200000'),
            ],
          ),
        ),
      ),
    );
  }
}

class ManyInfoWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String firstprice;
  final String secondprice;
  const ManyInfoWidget(
      {required this.firstText,
      required this.secondText,
      required this.firstprice,
      required this.secondprice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, top: 20.0, left: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            secondprice,
            textAlign: TextAlign.right,
          ),
          Expanded(child: Text(secondText)),
          Text(
            firstprice,
            textAlign: TextAlign.right,
          ),
          Expanded(child: Text(firstText)),
        ],
      ),
    );
  }
}
