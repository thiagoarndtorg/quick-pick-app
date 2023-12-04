import 'package:hive_flutter/hive_flutter.dart';
import 'package:quick_pick_app/src/features/orders/data/model/order_model.dart';
import 'package:quick_pick_app/src/features/orders/data/repositories/orders_repository.dart';
import 'package:quick_pick_app/src/utils/common/domain/user_model.dart';

class OrdersController {
  OrdersController();
  final _ordersRepository = OrdersRepository();
  Future<List<OrderModel>> getOrders() async {
    var box = Hive.box<UserModel>('userBox');
    var userModel = await box.get('userData');
    return await _ordersRepository.getOrders(userModel!.id!);
  }
}
