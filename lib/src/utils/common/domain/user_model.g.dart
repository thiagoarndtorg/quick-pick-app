// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      name: fields[4] as String?,
      email: fields[5] as String?,
      password: fields[6] as String?,
      phone: fields[7] as String?,
      cpf: fields[8] as String?,
      address: fields[9] as AddressModel?,
      id: fields[1] as int?,
      addressId: fields[2] as int?,
      isAdmin: fields[3] as bool?,
      token: fields[10] as String?,
    )..userName = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.addressId)
      ..writeByte(3)
      ..write(obj.isAdmin)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.password)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.cpf)
      ..writeByte(9)
      ..write(obj.address)
      ..writeByte(10)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
