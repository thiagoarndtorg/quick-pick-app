import 'package:hive_flutter/hive_flutter.dart';

part 'address_model.g.dart';

@HiveType(typeId: 1)
class AddressModel {
  @HiveField(0)
  String? street;
  @HiveField(1)
  int? number;
  @HiveField(2)
  String? complement;
  @HiveField(3)
  String? neighborhood;
  @HiveField(4)
  String? cep;
  @HiveField(5)
  String? name;

  AddressModel(
      {this.street,
      this.number,
      this.complement,
      this.neighborhood,
      this.cep,
      this.name});

  AddressModel.fromJson(Map<String, dynamic> json) {
    street = json['logradouro'];
    number = 0;
    complement = json['complemento'];
    neighborhood = json['bairro'];
    cep = json['cep'];
    name = json['logradouro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['number'] = this.number;
    data['complement'] = this.complement;
    data['neighborhood'] = this.neighborhood;
    data['cep'] = this.cep;
    data['name'] = this.name;
    return data;
  }
}
