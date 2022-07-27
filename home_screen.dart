import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:untitled41/Screens/new_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
              const Spacer(),
              Image.asset(
                'assets/download.png',
                width: 150,
                height: 150,
              ),
              const Spacer(),
              const SizedBox(height: 10.0),
              const Text('تراکنشی موجود نیست! '),
            ],
          ),
        ),
      ),
    );
  }
}
