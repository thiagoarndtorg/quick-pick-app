import 'dart:developer';

import 'package:quick_pick_app/src/features/orders/data/model/order_model.dart';
import 'package:quick_pick_app/src/utils/common/dio_client.dart';

class OrdersRepository {
  DioClient dio = DioClient();

  Future<List<OrderModel>> getOrders(int userId) async {
    try {
      final response = await dio.defaultDio().get('Order/user/$userId');
      log('Pedidos resgatados com sucesso!');
      List<OrderModel> list = [];

      for (var item in response.data) {
        list.add(OrderModel.fromJson(item));
      }

      return list;
    } catch (e) {
      log('Erro ao regatar pedidos do usuário');
      throw Exception(e);
    }
  }
}
