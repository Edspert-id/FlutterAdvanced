import 'package:flutter_advance/model/course/course_model.dart';
import 'package:flutter_advance/repository/course_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    on<CourseEvent>((event, emit) async {
      if (event is GetCourseEvent) {
        emit(CourseLoading());

        final courseRepository = CourseRepository();
        final response = await courseRepository.getCourses();

        emit(CourseSuccess(courseList: response.data ?? []));
      }
    });
  }
}
