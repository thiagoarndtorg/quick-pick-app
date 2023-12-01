import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';
import 'package:quick_pick_app/src/utils/common/mixins/image_data_mixin.dart';
import 'package:quick_pick_app/src/utils/common/widgets/app_bar_app.dart';

class FoodView extends StatefulWidget {
  final int foodId;
  const FoodView({super.key, required this.foodId});

  @override
  State<FoodView> createState() => _FoodViewState();
}

class _FoodViewState extends State<FoodView> with ImageDataMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColorBackground,
      resizeToAvoidBottomInset: true,
      appBar: AppBarApp(onBackPressed: () => context.router.pop()),
      body: Container(),
    );
  }
}
