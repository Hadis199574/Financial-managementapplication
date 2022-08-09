import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:untitled41/Screens/new_page.dart';
import 'package:untitled41/main.dart';

import '../modles/money.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static List<Money> moneys = [
    Money(
      id: 0,
      title: 'test1',
      data: "1400/01/01",
      isReceived: false,
      price: '1000',
    ),
    Money(
      id: 1,
      title: 'test2',
      data: "1400/02/01",
      isReceived: true,
      price: '2000',
    ),
    Money(
      id: 2,
      title: 'test3',
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
  Box<Money> hiveBox = Hive.box<Money>('moneyBox');
  @override
  void initState() {
    MyApp.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: fabWidget(),
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
                        onFieldSubmitted: (String text) {
                          List<Money> result = hiveBox.values
                              .where((value) => value.title.contains(text))
                              .toList();
                          HomeScreen.moneys.clear();
                          setState(() {
                            for (var value in result) {
                              HomeScreen.moneys.add(value);
                            }
                          });
                        },
                        textEditingController: searchController,
                        isOriginalAnimation: false,
                        onCollapseComplete: () {
                          MyApp.getData();
                          searchController.text = '';
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('تراکنش ها'),
                  ],
                ),
              ),
              Expanded(
                child: HomeScreen.moneys.isEmpty
                    ? EmptyWidget()
                    : ListView.builder(
                        itemCount: HomeScreen.moneys.length,
                        itemBuilder: (context, indext) {
                          return GestureDetector(
                              onTap: () {
                                NewPage.descriptionController.text =
                                    HomeScreen.moneys[indext].title;
                                NewPage.priceController.text =
                                    HomeScreen.moneys[indext].price;
                                NewPage.groupId =
                                    HomeScreen.moneys[indext].isReceived
                                        ? 1
                                        : 2;
                                NewPage.isEditing = true;
                                NewPage.indext = indext;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const NewPage(),
                                    )).then((value) {
                                  MyApp.getData();
                                  setState(() {});
                                });
                              },
                              onLongPress: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          actionsAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          title: const Text(
                                            'آیا از حذف مطمئن هستید؟',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'خیر',
                                                  style: TextStyle(
                                                      color: Colors.blue),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    hiveBox.deleteAt(indext);
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "بله",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ))
                                          ],
                                        ));
                                setState(() {
                                  HomeScreen.moneys.removeAt(indext);
                                });
                              },
                              child: MyListTilWidget(index: indext));
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget EmptyWidget() {
    return Column(children: [
      Container(width: 250, height: 250, child: Image.asset('assets/12.jpg')),
      const SizedBox(height: 10.0),
      const Text('تراکنشی موجود نیست '),
    ]);
  }

  Widget fabWidget() {
    return FloatingActionButton(
      onPressed: () {
        NewPage.descriptionController.text = '';
        NewPage.priceController.text = '';
        NewPage.groupId = 0;
        NewPage.isEditing = false;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NewPage(),
          ),
        ).then((value) {
          setState(() {
            print('Reflesh');
          });
        });
      },
      backgroundColor: Colors.red,
      elevation: 0,
      child: const Icon(Icons.add),
    );
  }
}

class MyListTilWidget extends StatelessWidget {
  final int index;
  const MyListTilWidget({Key? key, required this.index}) : super(key: key);

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
                color: HomeScreen.moneys[index].isReceived
                    ? const Color(0XFF6C63FF)
                    : const Color(0XFF00C89C),
                borderRadius: BorderRadius.circular(15.0)),
            child: Center(
              child: Icon(
                  HomeScreen.moneys[index].isReceived
                      ? Icons.add
                      : Icons.remove,
                  color: Colors.white,
                  size: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
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
                  Text(
                    HomeScreen.moneys[index].price,
                    style: const TextStyle(color: Colors.pink),
                  )
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
