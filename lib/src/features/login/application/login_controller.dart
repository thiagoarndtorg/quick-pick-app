import 'package:hive_flutter/hive_flutter.dart';
import 'package:quick_pick_app/src/features/login/data/repositories/login_repository.dart';
import 'package:quick_pick_app/src/utils/common/domain/user_model.dart';

class LoginController {
  LoginController();
  final _loginRepository = LoginRepository();
  Future<void> loginUser(String email, String password) async {
    final userData =
        await _loginRepository.loginUser(email, password);
    var box = Hive.box<UserModel>('userBox');
    await box.put('userData', userData);
  }
}
