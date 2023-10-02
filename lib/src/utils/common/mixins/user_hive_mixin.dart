import 'package:hive_flutter/hive_flutter.dart';
import 'package:quick_pick_app/src/utils/common/domain/user_model.dart';

mixin UserHiveMixin {
  UserModel? getUserData() {
    return Hive.box<UserModel>('userBox').get('userData');
  }
}
