import 'dart:developer';

import 'package:quick_pick_app/src/utils/common/dio_client.dart';
import 'package:quick_pick_app/src/utils/common/domain/restaurant_model.dart';

class SearchRepository {
  DioClient dio = DioClient();

  Future<List<RestaurantModel>> getRestaurants() async {
    try {
      final response = await dio.defaultDio().get('Restaurant');
      log('Restaurantes resgatados com sucesso!');

      List<RestaurantModel> list = [];

      for (var item in response.data) {
        list.add(RestaurantModel.fromJson(item));
      }

      return list;
    } catch (e) {
      log('Erro ao resgatar restaurantes');
      throw Exception(e);
    }
  }
}
