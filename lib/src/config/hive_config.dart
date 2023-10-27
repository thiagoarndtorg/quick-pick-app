import 'package:hive_flutter/hive_flutter.dart';
import 'package:quick_pick_app/src/utils/common/domain/address_model.dart';
import 'package:quick_pick_app/src/utils/common/domain/user_model.dart';

class HiveConfig {
  static Future<void> init() async {
    await Hive.initFlutter();

    // ORGANIZE HIVE, ADAPTERS AND BOXES
    Hive.registerAdapter(UserModelAdapter()); // 0
    Hive.registerAdapter(AddressModelAdapter()); // 1
    var userBox = await Hive.openBox<UserModel>(
      'userBox',
    );

    //await userBox.clear();
  }
}
