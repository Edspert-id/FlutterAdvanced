import 'package:flutter/material.dart';
import 'package:flutter_advance/bloc/banner/banner_cubit.dart';
import 'package:flutter_advance/bloc/course/course_bloc.dart';
import 'package:flutter_advance/widgets/banner_list.dart';
import 'package:flutter_advance/widgets/home_banner.dart';
import 'package:flutter_advance/widgets/lesson_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CourseBloc()..add(GetCourseEvent())),
        BlocProvider(create: (context) => BannerCubit()..getBanners()),
      ],
      child: LayoutBuilder(builder: (context, constraints) {
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
                        BlocBuilder<CourseBloc, CourseState>(
                          builder: (context, state) {
                            if (state is CourseSuccess) {
                              return LessonList(
                                courses: state.courseList,
                              );
                            }

                            if (state is CourseError) {
                              return Center(
                                  child: Text(state.errorMessage ??
                                      'Something Went Wrong'));
                            }

                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        ),
                        const SizedBox(height: 24),
                        BlocBuilder<BannerCubit, BannerState>(
                          builder: (context, state) {
                            if (state is BannerSuccess) {
                              return BannerList(banners: state.bannerList);
                            }

                            if (state is BannerError) {
                              return Center(
                                child: Text(state.errorMessage ??
                                    'Something Went Wrong'),
                              );
                            }

                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        )
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
                  BlocBuilder<CourseBloc, CourseState>(
                    builder: (context, state) {
                      if (state is CourseSuccess) {
                        return LessonList(courses: state.courseList);
                      }

                      if (state is CourseError) {
                        return Center(
                          child: Text(
                              state.errorMessage ?? 'Something Went Wrong'),
                        );
                      }

                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<BannerCubit, BannerState>(
                    builder: (context, state) {
                      if (state is BannerSuccess) {
                        return BannerList(banners: state.bannerList);
                      }

                      if (state is BannerError) {
                        return Center(
                          child: Text(
                              state.errorMessage ?? 'Something Went Wrong'),
                        );
                      }

                      return const Center(child: CircularProgressIndicator());
                    },
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
