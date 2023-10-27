import 'dart:developer';

import 'package:quick_pick_app/src/features/search/data/models/menu_model.dart';
import 'package:quick_pick_app/src/utils/common/dio_client.dart';

class SearchRepository {
  DioClient dio = DioClient();

  Future<List<MenuModel>> getRestaurants() async {
    try {
      final response = await dio.defaultDio().get('Menu');
      log('Restaurantes resgatados com sucesso!');

      List<MenuModel> list = [];

      for (var item in response.data) {
        list.add(MenuModel.fromJson(item));
      }

      return list;
    } catch (e) {
      log('Erro ao resgatar restaurantes');
      throw Exception(e);
    }
  }
}
