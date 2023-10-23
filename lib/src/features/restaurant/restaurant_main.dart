import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/features/restaurant/presentation/view/restaurant_view.dart';

@RoutePage()
class RestaurantMain extends StatelessWidget {
  final int restaurantId;
  const RestaurantMain({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    return RestaurantView(restaurantId: restaurantId);
  }
}
