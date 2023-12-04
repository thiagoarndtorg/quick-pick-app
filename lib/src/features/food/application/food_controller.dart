import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quick_pick_app/src/features/food/data/model/food_model.dart';
import 'package:quick_pick_app/src/features/food/data/repositories/food_repository.dart';
import 'package:quick_pick_app/src/utils/common/domain/user_model.dart';

class FoodController {
  FoodController();
  FoodRepository _foodRepository = FoodRepository();
  Map<String, dynamic>? paymentIntent;
  dynamic createPaymentIntent(String amount, String currency) async {
    return _foodRepository.makePayment(amount, currency);
  }

  Future<void> orderFood(FoodModel foodModel) async {
    try {
      final userBox = await Hive.openBox<UserModel>('userBox');
      var userModel = userBox.get("userData");
      _foodRepository.orderFood(foodModel, userModel!.id!);
    } catch (e) {
      throw Exception(e);
    }
  }
}
