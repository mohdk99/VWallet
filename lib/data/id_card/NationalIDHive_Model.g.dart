// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NationalIDHive_Model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NationalIDclassAdapter extends TypeAdapter<NationalID_class> {
  @override
  final int typeId = 0;

  @override
  NationalID_class read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NationalID_class(
      docType: fields[0] as String?,
      name: fields[1] as String?,
      lastName: fields[2] as String?,
      docNumber: fields[3] as String?,
      dateofBirth: fields[4] as String?,
      expiryDate: fields[5] as String?,
      country: fields[6] as String?,
      sex: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NationalID_class obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.docType)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.docNumber)
      ..writeByte(4)
      ..write(obj.dateofBirth)
      ..writeByte(5)
      ..write(obj.expiryDate)
      ..writeByte(6)
      ..write(obj.country)
      ..writeByte(7)
      ..write(obj.sex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NationalIDclassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
