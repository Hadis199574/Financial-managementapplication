import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:untitled41/Screens/new_page.dart';

import '../modles/money.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);
  static List <Money> moneys= [ Money (
  id: 0 ,
  title:'test1',
  data: "1400/01/01",
  isReceived: true,
    price: '1000',
  ),
    Money (
      id: 1 ,
      title:'test2',
      data: "1400/02/01",
      isReceived: true,
      price: '2000',
    ),
    Money (
      id: 2 ,
      title:'test3',
      data: "1400/03/01",
      isReceived: false,
      price: '4000',
    ),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewPage(),
                ),
              );
            },
            backgroundColor: const Color(0XFF6C63FF),
            elevation: 0,
            child: const Icon(Icons.add)),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 20, left: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchBarAnimation(
                          hintText: 'جستجو کنید...',
                          buttonElevation: 0,
                          buttonColour: Colors.white54,
                          buttonBorderColour: Colors.black26,
                          buttonIcon: Icons.search,
                          onFieldSubmitted: (String text) {},
                          textEditingController: searchController,
                          isOriginalAnimation: false),
                    ),
                    const SizedBox(width: 10),
                    const Text('تراکنش ها'),
                  ],
                ),
              ),
              // const Spacer(),
              //Image.asset(
              //  'assets/download.jpeg',
              // width: 150,
              //  height: 150,
              //),
              //  const Spacer(),
              //const SizedBox(height: 10.0),
              //  const Text('تراکنشی موجود نیست! '),
             Expanded(
               child: ListView.builder(itemCount: HomeScreen.moneys.length,

                   itemBuilder: (context,indext){
                 return MyListTilWidget(index: indext);
               }
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
class MyListTilWidget extends StatelessWidget {
  final int index;
  const MyListTilWidget({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(15.0)),
            child: const Center(
              child: Icon(Icons.add, color: Colors.white, size: 30),
            ),
          ),
           Padding(
            padding:const EdgeInsets.only(left: 15.0),
            child: Text(HomeScreen.moneys[index].title),
          ),
          const Spacer(),
          Column(
            children: [
              Row(
                children: [
                  const Text(
                    'تومان',
                    style: TextStyle(color: Colors.pink),
                  ),
                  Text(HomeScreen.moneys[index].price,style: const TextStyle(color: Colors.pink),)
                ],
              ),
              Text(HomeScreen.moneys[index].data),
            ],
          )
        ],
      ),
    );
  }
}

