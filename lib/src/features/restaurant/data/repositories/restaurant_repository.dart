import 'dart:developer';

import 'package:quick_pick_app/src/features/restaurant/data/model/restaurant_model.dart';
import 'package:quick_pick_app/src/features/search/data/models/menu_model.dart';
import 'package:quick_pick_app/src/utils/common/dio_client.dart';

class RestaurantRepository {
  DioClient dio = DioClient();

  Future<List<FoodModel>> getFoods(String id) async {
    try {
      final response = await dio.defaultDio().get('Food/menu/$id');
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

  Future<MenuModel> getRestaurant(String id) async {
    try {
      final response = await dio.defaultDio().get('Menu/$id');
      log('Restaurante resgatado com sucesso!');

      return MenuModel.fromJson(response.data);
    } catch (e) {
      log('Erro ao resgatar comidas');
      throw Exception(e);
    }
  }
}
