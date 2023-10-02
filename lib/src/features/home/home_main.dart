import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/features/home/presentation/view/home_view.dart';

@RoutePage()
class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
