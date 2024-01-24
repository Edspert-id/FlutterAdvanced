import 'package:flutter_advance/model/banner/banner_model.dart';
import 'package:flutter_advance/model/course/course_model.dart';
import 'package:flutter_advance/repository/banner_repository.dart';
import 'package:flutter_advance/repository/course_repository.dart';
import 'package:flutter_advance/widgets/banner_list.dart';
import 'package:flutter_advance/widgets/home_banner.dart';
import 'package:flutter_advance/widgets/lesson_list.dart';
import 'package:flutter/material.dart';

enum ViewState { init, loading, success, error }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final courseRepository = CourseRepository();
  CourseResponse? courseResponse;
  ViewState courseState = ViewState.init;

  final bannerRepository = BannerRepository();
  BannerResponse? bannerResponse;
  ViewState bannerState = ViewState.init;

  @override
  void initState() {
    getCourse();
    getBanner();
    super.initState();
  }

  void getCourse() async {
    courseState = ViewState.loading;
    setState(() {});
    courseResponse = await courseRepository.getCourses();
    courseState = ViewState.success;
    setState(() {});
  }

  void getBanner() async {
    bannerState = ViewState.loading;
    setState(() {});
    bannerResponse = await bannerRepository.getBanners();
    bannerState = ViewState.success;
    setState(() {});
  }

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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Row(
                children: [
                  const HomeBanner(),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      children: [
                        courseState != ViewState.success
                            ? const Center(child: CircularProgressIndicator())
                            : LessonList(courses: courseResponse?.data ?? []),
                        const SizedBox(height: 24),
                        bannerState != ViewState.success
                            ? const Center(child: CircularProgressIndicator())
                            : BannerList(banners: bannerResponse?.data ?? [])
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Column(
                children: [
                  const HomeBanner(),
                  const SizedBox(height: 24),
                  courseState != ViewState.success
                      ? const Center(child: CircularProgressIndicator())
                      : LessonList(courses: courseResponse?.data ?? []),
                  const SizedBox(height: 24),
                  bannerState != ViewState.success
                      ? const Center(child: CircularProgressIndicator())
                      : BannerList(banners: bannerResponse?.data ?? [])
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
