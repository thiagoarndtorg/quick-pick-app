// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressModelAdapter extends TypeAdapter<AddressModel> {
  @override
  final int typeId = 1;

  @override
  AddressModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressModel(
      street: fields[0] as String?,
      number: fields[1] as int?,
      complement: fields[2] as String?,
      neighborhood: fields[3] as String?,
      cep: fields[4] as String?,
      name: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AddressModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.street)
      ..writeByte(1)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.complement)
      ..writeByte(3)
      ..write(obj.neighborhood)
      ..writeByte(4)
      ..write(obj.cep)
      ..writeByte(5)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
