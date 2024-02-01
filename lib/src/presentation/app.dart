import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repositories/course_repository.dart';
import '../domain/usecases/get_courses_usecase.dart';
import 'bloc/banner/banner_cubit.dart';
import 'bloc/course/course_bloc.dart';
import 'screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CourseBloc(GetCoursesUsecase(CourseRepository())),
        ),
        BlocProvider(create: (context) => BannerCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFF3F7F8),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
