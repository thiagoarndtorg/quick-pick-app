import 'package:hive/hive.dart';
import 'package:quick_pick_app/src/utils/common/domain/address_model.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  String? userName;
  @HiveField(1)
  int? id;
  @HiveField(2)
  int? addressId;
  @HiveField(3)
  bool? isAdmin;
  @HiveField(4)
  String? name;
  @HiveField(5)
  String? email;
  @HiveField(6)
  String? password;
  @HiveField(7)
  String? phone;
  @HiveField(8)
  String? cpf;
  @HiveField(9)
  AddressModel? address;
  @HiveField(10)
  String? token;
  UserModel(
      {this.name,
      this.email,
      this.password,
      this.phone,
      this.cpf,
      this.address,
      this.id,
      this.addressId,
      this.isAdmin,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    cpf = json['cpf'];
    address = json['address'] != null
        ? new AddressModel.fromJson(json['address'])
        : null;
    id = json['id'];
    addressId = json['addressId'];
    isAdmin = json['isAdmin'];
  }

  UserModel.fromJsonLogin(Map<String, dynamic> json) {
    name = json['user']['name'];
    email = json['user']['email'];
    password = json['user']['password'];
    phone = json['user']['phone'];
    cpf = json['user']['cpf'];
    address = json['user']['address'] != null
        ? new AddressModel.fromJson(json['user']['address'])
        : null;
    id = json['user']['id'];
    addressId = json['user']['addressId'];
    isAdmin = json['user']['isAdmin'];
    token = json['token'] != null ? json['token']['token'] : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'email': this.email,
      'password': this.password,
      'phone': this.phone,
      'cpf': this.cpf,
      'address': this.address != null ? this.address!.toJson() : null,
    };
  }
}
