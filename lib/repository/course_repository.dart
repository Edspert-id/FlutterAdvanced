import 'package:dio/dio.dart';
import 'package:flutter_advance/common/http_config.dart';
import 'package:flutter_advance/model/course/course_model.dart';

class CourseRepository {
  Future<CourseResponse> getCourses() async {
    try {
      final response = await HttpConfig.dioConfig().get(
        'exercise/data_course',
        queryParameters: {
          'major_name': 'IPA',
          'user_email': 'testerngbayu@gmail.com',
        },
      );

      if (response.statusCode == 200) {
        return CourseResponse.fromJson(response.data);
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
