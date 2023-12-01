import 'package:quick_pick_app/src/utils/common/domain/address_model.dart';
import 'package:quick_pick_app/src/utils/common/domain/menu_model.dart';

class RestaurantModel {
  int? id;
  int? menuID;
  MenuModel? menu;
  int? addressId;
  AddressModel? address;
  String? name;
  String? description;
  String? email;
  String? password;
  String? phone;
  String? cnpjCpf;
  String? pix;
  bool? isAdmin;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  RestaurantModel(
      {this.id,
      this.menuID,
      this.menu,
      this.addressId,
      this.address,
      this.name,
      this.description,
      this.email,
      this.password,
      this.phone,
      this.cnpjCpf,
      this.pix,
      this.isAdmin,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    menuID = json['menuID'];
    menu = json['menu'] != null ? new MenuModel.fromJson(json['menu']) : null;
    addressId = json['addressId'];
    address = json['address'] != null ? new AddressModel.fromJson(json['address']) : null;
    name = json['name'];
    description = json['description'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    cnpjCpf = json['cnpjCpf'];
    pix = json['pix'];
    isAdmin = json['isAdmin'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['menuID'] = this.menuID;
    if (this.menu != null) {
      data['menu'] = this.menu!.toJson();
    }
    data['addressId'] = this.addressId;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['name'] = this.name;
    data['description'] = this.description;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['cnpjCpf'] = this.cnpjCpf;
    data['pix'] = this.pix;
    data['isAdmin'] = this.isAdmin;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
