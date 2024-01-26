import 'package:flutter_advance/bloc/base/base_cubit.dart';
import 'package:flutter_advance/screen/home_screen.dart';
import 'package:flutter_advance/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});

  final List<Widget> screenBody = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BaseCubit()),
      ],
      child: Scaffold(
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
        bottomNavigationBar: BlocBuilder<BaseCubit, BaseState>(
          builder: (context, state) {
            return BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_sharp), label: 'Profile'),
              ],
              currentIndex: state.featureIndex,
              onTap: context.read<BaseCubit>().changeFeature,
            );
          },
        ),
        body: BlocBuilder<BaseCubit, BaseState>(
          builder: (context, state) {
            return screenBody[state.featureIndex];
          },
        ),
      ),
    );
  }
}
