part of 'course_bloc.dart';

@immutable
sealed class CourseEvent {}

class GetCoursesEvent extends CourseEvent {}
class GetCourseDetailEvent extends CourseEvent {}
