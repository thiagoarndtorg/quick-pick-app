import 'dart:developer';

import 'package:quick_pick_app/src/utils/common/dio_client.dart';
import 'package:quick_pick_app/src/utils/common/domain/user_model.dart';

class RegisterRepository {
  DioClient dio = DioClient();

  Future<void> registerUser(UserModel userModel) async {
    try {
      await dio.defaultDio().post('User', data: userModel.toJson());
      log('Usuário cadastrado com sucesso!');
    } catch (e) {
      log('Erro ao cadastrar usuário');
      throw Exception(e);
    }
  }
}
