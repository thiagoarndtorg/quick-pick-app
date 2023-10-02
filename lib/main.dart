import 'package:flutter/material.dart';
import 'package:quick_pick_app/routes/app_router.dart';
import 'package:quick_pick_app/src/config/hive_config.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';

void main() async {
  await HiveConfig.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MaterialApp.router(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: appColorPrimary,
          ),
          primaryColor: appColorPrimary,
          iconTheme: IconThemeData(color: appColorIcon)),
      routerConfig: appRouter.config(),
    );
  }
}
