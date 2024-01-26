import 'package:bloc/bloc.dart';
import 'package:flutter_advance/model/exercise/exercise_model.dart';
import 'package:flutter_advance/repository/exercise_repository.dart';
import 'package:meta/meta.dart';

part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  ExerciseCubit() : super(ExerciseInitial());

  void getExercises(String courseId) async {
    emit(ExerciseLoading());

    final exerciseRepository = ExerciseRepository();

    final response = await exerciseRepository.getExercise(courseId);

    emit(ExerciseSuccess(exerciseList: response.data ?? []));
  }
}
