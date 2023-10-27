import 'dart:developer';

import 'package:quick_pick_app/src/utils/common/dio_client.dart';
import 'package:quick_pick_app/src/utils/common/domain/user_model.dart';

class LoginRepository {
  DioClient dio = DioClient();

  Future<UserModel> loginUser(String email, String password) async {
    try {
      final response = await dio.defaultDio().post('Login', data: {
        'email': email,
        'password': password,
      });
      log('Usuário logado com sucesso!');
      return UserModel.fromJsonLogin(response.data);
    } catch (e) {
      log('Erro ao logar usuário');
      throw Exception(e);
    }
  }
}
