import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/features/login/presentation/view/login_view.dart';

@RoutePage()
class LoginMain extends StatelessWidget {
  final Function(bool)? onResult;
  const LoginMain({super.key, this.onResult});

  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}
