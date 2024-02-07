import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_advance/src/presentation/bloc/course/course_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/banner/banner_cubit.dart';
import '../widgets/banners_section_widget.dart';
import '../widgets/courses_section_widget.dart';
import '../widgets/home_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<CourseBloc>().add(GetCoursesEvent());
      context.read<BannerCubit>().getBanners();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Row(
                children: [
                  HomeBanner(),
                  SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      children: [
                        CoursesSectionWidget(),
                        SizedBox(height: 24),
                        BannersSectionWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    
        return const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Column(
                children: [
                  HomeBanner(),
                  SizedBox(height: 24),
                  CoursesSectionWidget(),
                  SizedBox(height: 24),
                  BannersSectionWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
