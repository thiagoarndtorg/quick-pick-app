import 'package:quick_pick_app/src/utils/common/domain/restaurant_model.dart';
import 'package:quick_pick_app/src/utils/common/domain/user_model.dart';

class OrderModel {
  int? id;
  int? userId;
  UserModel? user;
  int? restaurantId;
  RestaurantModel? restaurant;
  double? totalPrice;
  String? orderDate;
  int? orderStatus;
  String? createdAt;
  String? updatedAt;

  OrderModel(
      {this.id,
      this.userId,
      this.user,
      this.restaurantId,
      this.restaurant,
      this.totalPrice,
      this.orderDate,
      this.orderStatus,
      this.createdAt,
      this.updatedAt});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
    restaurantId = json['restaurantId'];
    restaurant = json['restaurant'] != null ? new RestaurantModel.fromJson(json['restaurant']) : null;
    totalPrice = json['totalPrice'];
    orderDate = json['orderDate'];
    orderStatus = json['orderStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['restaurantId'] = this.restaurantId;
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant!.toJson();
    }
    data['totalPrice'] = this.totalPrice;
    data['orderDate'] = this.orderDate;
    data['orderStatus'] = this.orderStatus;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
