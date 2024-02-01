import 'package:dio/dio.dart';
import 'package:flutter_advance/src/data/network/http_config.dart';

import '../../domain/entities/banner_model.dart';
class BannerRepository {
  Future<BannerResponse> getBanners() async {
    try {
      final response = await HttpConfig.dioConfig().get(
        'event/list',
        queryParameters: {'limit': '5'},
      );

      if (response.statusCode == 200) {
        return BannerResponse.fromJson(response.data);
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
