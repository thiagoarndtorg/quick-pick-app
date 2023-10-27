import 'dart:developer';

import 'package:quick_pick_app/src/utils/common/domain/address_model.dart';
import 'package:quick_pick_app/src/utils/common/dio_client.dart';

class AddressRepository {
  static Future<AddressModel> getAddress(String cep) async {
    DioClient dio = DioClient();
    try {
      final response = await dio.defaultDio().get('Address/cep/$cep');
      final AddressModel resModel =
          AddressModel.fromJson(response.data);
      log('Endereço resgatado com sucesso!');
      return resModel;
    } catch (e) {
      log('Erro ao regatar endereço do usuário');
      throw Exception(e);
    }
  }
}
