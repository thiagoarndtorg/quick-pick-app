import 'package:auto_route/auto_route.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quick_pick_app/routes/app_router.gr.dart';
import 'package:quick_pick_app/src/utils/common/domain/user_model.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final userBox = await Hive.openBox<UserModel>('userBox');
    if (userBox.isNotEmpty) {
      resolver.next(true);
    } else {
      router.push(LoginMain(onResult: (result) {
        if (result == true) {
          resolver.next(true);
          router.removeLast();
        }
      }));
    }
  }
}
