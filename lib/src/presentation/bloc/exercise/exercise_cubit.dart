import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repositories/exercise_repository.dart';
import '../../../domain/entities/exercise_model.dart';

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
