import 'package:flutter_advance/widgets/home_banner.dart';
import 'package:flutter_advance/widgets/lesson_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi Altop',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            CircleAvatar(radius: 12),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(Icons.chat_bubble_outline_rounded),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp), label: 'Profile'),
      ]),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Row(
                children: [
                  HomeBanner(),
                  SizedBox(width: 24),
                  Expanded(child: LessonList()),
                ],
              ),
            ),
          );
        }

        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Column(
              children: [
                HomeBanner(),
                SizedBox(height: 24),
                LessonList(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
