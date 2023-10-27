import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/utils/common/domain/address_model.dart';
import 'package:quick_pick_app/src/features/register/data/repositories/register_repository.dart';
import 'package:quick_pick_app/src/utils/common/domain/user_model.dart';
import 'package:quick_pick_app/src/utils/common/repositories/address_repository.dart';

class RegisterController {
  RegisterController();
  RegisterRepository _registerRepository = RegisterRepository();

  Future<void> register(
      {required String cep,
      required String name,
      required String email,
      required String password,
      required String phone,
      required String cpf}) async {
    AddressModel address = await AddressRepository.getAddress(cep);

    final userModel = UserModel(
      name: name,
      email: email,
      password: password,
      phone: phone,
      cpf: cpf,
      address: address,
    );
    await _registerRepository.registerUser(userModel);
  }
}
