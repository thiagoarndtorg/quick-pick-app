class FoodModel {
  int? id;
  int? menuId;
  String? menu;
  String? name;
  String? description;
  double? price;
  String? image;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  FoodModel(
      {this.id,
      this.menuId,
      this.menu,
      this.name,
      this.description,
      this.price,
      this.image,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    menuId = json['menuId'];
    menu = json['menu'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['menuId'] = this.menuId;
    data['menu'] = this.menu;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
