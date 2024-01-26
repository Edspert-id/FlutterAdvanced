import 'package:dio/dio.dart';
import 'package:flutter_advance/common/http_config.dart';
import 'package:flutter_advance/model/exercise/exercise_model.dart';

class ExerciseRepository {
  Future<ExerciseResponse> getExercise(String courseId) async {
    try {
      final response = await HttpConfig.dioConfig().get(
        'exercise/data_exercise',
        queryParameters: {
          'course_id': courseId,
          'user_email': 'testerngbayu@gmail.com',
        },
      );

      if (response.statusCode == 200) {
        return ExerciseResponse.fromJson(response.data);
      }

      throw Exception('Status Code not 200');
    } on DioException catch (e) {
      print('${e.error}: ${e.message}');
      rethrow;
    } catch (e) {
      print('${e.toString()}: Unknown Error');
      rethrow;
    }
  }
}
