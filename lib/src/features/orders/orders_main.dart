import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/features/orders/presentation/view/orders_view.dart';

@RoutePage()
class OrdersMain extends StatelessWidget {
  const OrdersMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const OrdersView();
  }
}
