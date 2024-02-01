import 'package:flutter/foundation.dart';
import 'package:flutter_advance/src/domain/usecases/get_courses_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/course_repository.dart';
import '../../../domain/entities/course_model.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetCoursesUsecase getCoursesUsecase;

  CourseBloc(this.getCoursesUsecase) : super(CourseInitial()) {
    on<CourseEvent>((event, emit) async {
      if (event is GetCoursesEvent) {
        emit(GetCoursesLoading());
        final courses = await getCoursesUsecase(
          GetCoursesParams(
            majorName: 'IPA',
            userEmail: 'testerngbayu@gmail.com',
          ),
        );
        if (courses != null) {
          emit(GetCoursesSuccess(courseList: courses));
        } else {
          emit(GetCoursesError(errorMessage: 'Server Error.'));
        }
      }
    });
  }

  void getCourseId() {

  }
}
