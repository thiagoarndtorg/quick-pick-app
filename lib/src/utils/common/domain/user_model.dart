import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  String? userName;
  @HiveField(1)
  String? token;

  UserModel({
    this.userName,
    this.token,
  });
}
