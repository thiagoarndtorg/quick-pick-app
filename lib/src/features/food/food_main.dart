import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/features/food/data/model/food_model.dart';
import 'package:quick_pick_app/src/features/food/presentation/view/food_view.dart';

@RoutePage()
class FoodMain extends StatelessWidget {
  final FoodModel foodModel;
  const FoodMain({super.key, required this.foodModel});

  @override
  Widget build(BuildContext context) {
    return FoodView(foodModel: foodModel);
  }
}
