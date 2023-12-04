import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:quick_pick_app/routes/app_router.dart';
import 'package:quick_pick_app/src/config/hive_config.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';

void main() async {
  await HiveConfig.init();
  Stripe.publishableKey =
      "pk_test_51OJgk3AriEpYdydkor5G3YYJtKinh6zLkl3eaFATWLkplGFMggipWhuoZuojr8ub9NTUMLADmDoWRF2RFReQSwv200i0EIVgvW";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    var _router = appRouter.config();
    return MaterialApp.router(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: appColorPrimary,
          ),
          primaryColor: appColorPrimary,
          iconTheme: IconThemeData(color: appColorIcon)),
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
    );
  }
}
