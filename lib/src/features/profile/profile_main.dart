import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/features/profile/presentation/view/profile_view.dart';

@RoutePage()
class ProfileMain extends StatelessWidget {
  const ProfileMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileView();
  }
}
