class FoodModel {
  int? foodId;
  String? foodName;
  String? foodDescription;
  double? foodPrice;
  String? foodImage;
  int? menuId;
  String? menuName;
  String? menuDescription;
  int? restaurantId;
  String? restaurantName;

  FoodModel(
      {this.foodId,
      this.foodName,
      this.foodDescription,
      this.foodPrice,
      this.foodImage,
      this.menuId,
      this.menuName,
      this.menuDescription,
      this.restaurantId,
      this.restaurantName});

  FoodModel.fromJson(Map<String, dynamic> json) {
    foodId = json['foodId'];
    foodName = json['foodName'];
    foodDescription = json['foodDescription'];
    foodPrice = json['foodPrice'];
    foodImage = json['foodImage'];
    menuId = json['menuId'];
    menuName = json['menuName'];
    menuDescription = json['menuDescription'];
    restaurantId = json['restaurantId'];
    restaurantName = json['restaurantName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foodId'] = this.foodId;
    data['foodName'] = this.foodName;
    data['foodDescription'] = this.foodDescription;
    data['foodPrice'] = this.foodPrice;
    data['foodImage'] = this.foodImage;
    data['menuId'] = this.menuId;
    data['menuName'] = this.menuName;
    data['menuDescription'] = this.menuDescription;
    data['restaurantId'] = this.restaurantId;
    data['restaurantName'] = this.restaurantName;
    return data;
  }
}
