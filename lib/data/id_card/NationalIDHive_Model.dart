import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'NationalIDHive_Model.g.dart';

Box<NationalID_class> access = Hive.box<NationalID_class>('national_id');
//final nationalID = record.get('key_id');

@HiveType(typeId: 0)
class NationalID_class {
  @HiveField(0)
  String? docType;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? lastName;
  @HiveField(3)
  String? docNumber;
  @HiveField(4)
  String? dateofBirth;
  @HiveField(5)
  String? expiryDate;
  @HiveField(6)
  String? country;
  @HiveField(7)
  String? sex;

  NationalID_class(
      {this.docType,
      this.name,
      this.lastName,
      this.docNumber,
      this.dateofBirth,
      this.expiryDate,
      this.country,
      this.sex});
}

Future inserRecord(
    String? docType,
    String? name,
    String? lastName,
    String? docNumber,
    String? dateofBirth,
    String? expiryDate,
    String? country,
    String? sex) async {
  final data = NationalID_class(
    docType: docType,
    name: name,
    lastName: lastName,
    docNumber: docNumber,
    dateofBirth: dateofBirth,
    expiryDate: expiryDate,
    country: country,
    sex: sex,
  );
  final box = access; // Access Database
  box.put('key_id', data); // Add data to database mapped to a key
}
