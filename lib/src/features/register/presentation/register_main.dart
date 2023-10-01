import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/features/register/presentation/view/register_view.dart';

@RoutePage()
class RegisterMain extends StatelessWidget {
  const RegisterMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterView();
  }
}
