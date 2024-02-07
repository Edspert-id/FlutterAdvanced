import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/course/course_bloc.dart';
import 'lesson_list.dart';

class CoursesSectionWidget extends StatelessWidget {
  const CoursesSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(
      buildWhen: (previous, current) =>
          current is GetCoursesSuccess || current is GetCoursesLoading,
      builder: (context, state) {
        if (state is GetCoursesSuccess) {
          return LessonList(
            courses: state.courseList,
          );
        }

        if (state is GetCoursesError) {
          return Center(
              child: Text(state.errorMessage ?? 'Something Went Wrong'));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
