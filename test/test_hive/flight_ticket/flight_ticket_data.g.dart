// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_ticket_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FlightTicketAdapter extends TypeAdapter<FlightTicket> {
  @override
  final int typeId = 1;

  @override
  FlightTicket read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FlightTicket(
      ticketCode: fields[0] as String,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      createdDate: fields[3] as String,
      b_class: fields[4] as String,
      flight_number: fields[5] as String,
      seat: fields[6] as String,
      dep: fields[7] as String,
      dis: fields[8] as String,
      airline: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FlightTicket obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.ticketCode)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.createdDate)
      ..writeByte(4)
      ..write(obj.b_class)
      ..writeByte(5)
      ..write(obj.flight_number)
      ..writeByte(6)
      ..write(obj.seat)
      ..writeByte(7)
      ..write(obj.dep)
      ..writeByte(8)
      ..write(obj.dis)
      ..writeByte(9)
      ..write(obj.airline);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlightTicketAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
