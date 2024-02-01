part of 'exercise_cubit.dart';

@immutable
sealed class ExerciseState {}

final class ExerciseInitial extends ExerciseState {}

final class ExerciseLoading extends ExerciseState {}

final class ExerciseSuccess extends ExerciseState {
  final List<ExerciseDataModel> exerciseList;

  ExerciseSuccess({required this.exerciseList});
}

final class ExerciseError extends ExerciseState {
  final String? errorMessage;

  ExerciseError({this.errorMessage});
}
