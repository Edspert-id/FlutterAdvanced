import 'package:flutter_advance/src/data/repositories/course_repository.dart';
import 'package:flutter_advance/src/domain/usecases/usecase.dart';

import '../entities/course_model.dart';

class GetCoursesUsecase implements UseCase<List<CourseData>?, GetCoursesParams> {

final CourseRepository repository;

  GetCoursesUsecase(this.repository);

  @override
  Future<List<CourseData>?> call(params) async {
    return await repository.getCourses(
      majorName: params.majorName, 
      userEmail: params.userEmail,
    );
  }
}

class GetCoursesParams {
  final String majorName;
  final String userEmail;

  GetCoursesParams({required this.majorName, required this.userEmail});
}