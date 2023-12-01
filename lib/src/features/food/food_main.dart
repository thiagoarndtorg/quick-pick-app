import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/features/food/presentation/view/food_view.dart';

@RoutePage()
class FoodMain extends StatelessWidget {
  final int foodId;
  const FoodMain({super.key, required this.foodId});

  @override
  Widget build(BuildContext context) {
    return FoodView(foodId: foodId);
  }
}
