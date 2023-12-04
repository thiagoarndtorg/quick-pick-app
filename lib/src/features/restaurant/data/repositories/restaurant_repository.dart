import 'dart:developer';

import 'package:quick_pick_app/src/features/food/data/model/food_model.dart';

import 'package:quick_pick_app/src/utils/common/dio_client.dart';
import 'package:quick_pick_app/src/utils/common/domain/restaurant_model.dart';

class RestaurantRepository {
  DioClient dio = DioClient();

  Future<List<FoodModel>> getFoods(String id) async {
    try {
      final response = await dio.defaultDio().get('Food/restaurant/$id');
      log('Comidas resgatadas com sucesso!');

      List<FoodModel> list = [];

      for (var item in response.data) {
        list.add(FoodModel.fromJson(item));
      }

      return list;
    } catch (e) {
      log('Erro ao resgatar comidas');
      throw Exception(e);
    }
  }

  Future<RestaurantModel> getRestaurant(String id) async {
    try {
      final response = await dio.defaultDio().get('Restaurant/$id');
      log('Restaurante resgatado com sucesso!');

      return RestaurantModel.fromJson(response.data);
    } catch (e) {
      log('Erro ao resgatar comidas');
      throw Exception(e);
    }
  }
}
