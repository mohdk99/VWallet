/*import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:barcode_widget/barcode_widget.dart';*/

//import 'package:barcode_widget/barcode_widget.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'flight_ticket_data.g.dart';

/*List<String> firstName = [];
List<String> lastName = [];
List<String> sector = [];
List<String> _class = [];
List<String> flight_number = [];
List<String> seat = [];

List<String> save_firstName = [];
List<String> save_lastName = [];
List<String> save_sector = [];
List<String> save_class = [];
List<String> save_flight_number = [];
List<String> save_seat = [];*/

Box<FlightTicket> flight_record = Hive.box<FlightTicket>('flight_ticket');

@HiveType(typeId: 1)
class FlightTicket {
  @HiveField(0)
  String? ticketCode;
  @HiveField(1)
  String? firstName;
  @HiveField(2)
  String? lastName;
  @HiveField(3)
  String? createdDate;
  @HiveField(4)
  String? b_class;
  @HiveField(5)
  String? flight_number;
  @HiveField(6)
  String? seat;
  @HiveField(7)
  String? dep;
  @HiveField(8)
  String? dis;
  @HiveField(9)
  String? airline;

  FlightTicket({
    this.ticketCode,
    this.firstName,
    this.lastName,
    this.createdDate,
    this.b_class,
    this.flight_number,
    this.seat,
    this.dep,
    this.dis,
    this.airline,
  });
}

List<FlightTicket> flightTicket = [];

Future insertFlightData(
  String? ticketCode,
  String? firstName,
  String? lastName,
  String? createdDate,
  String? b_class,
  String? flight_number,
  String? seat,
  String? dep,
  String? dis,
  String? airline,
) async {
  final data = FlightTicket(
      ticketCode: ticketCode,
      firstName: firstName,
      lastName: lastName,
      createdDate: createdDate,
      b_class: b_class,
      flight_number: flight_number,
      seat: seat,
      dep: dep,
      dis: dis,
      airline: airline);

  final box = flight_record;
  box.add(data);
}

void main(List<String> args) {
  String test =
      'M1HASSAN/SUAADMS       NQ34F3 MCTDOHOV 0237 119Y019A0643 397>5322OO2119BXH 0960849406001                          2A             02OV                        N*206      09                         :PSN:1282199628:';
  String firstName =
      test.substring(test.indexOf('/') + 1, test.indexOf(' ') - 2);
  String lastName = test.substring(2, test.indexOf('/'));
  String dep = test.substring(30, 33);
  String dis = test.substring(33, 36);
  String airline = test.substring(36, 38);
  String flight_number = test.substring(36, 43);
  String b_class = test[47];
  String seat = test.substring(49, 52);
  print(firstName);
  print(lastName);
  print(dep);
  print(dis);
  print(airline);
  print(flight_number);
  print(b_class);
  print(seat);
  print(flightTicket.length);

  //print(flightTicket[1].airline);
}

validate_flight(int index) {
  print('index is: $index');
  if (flightTicket.length > index) {
    String? val = flightTicket[index].airline;
    if (val == "OV" && flightTicket[index].airline!.length > 0) {
      return 'Salam Air';
    }
    if (val == "DL" && val != null) {
      return 'Delta Air';
    }
    if (val == "OM" && val != null) {
      return 'Oman Air';
    } else {
      return 'Test';
    }
  } else {
    return null;
  }
}

validate_image(int index) {
  if (flightTicket.length > index) {
    String? val = flightTicket[index].airline;
    if (val == "OV" && flightTicket[index].airline!.length > 0) {
      return 'assets/images/SalamAir.png';
    }
    if (val == "DL" && val != null) {
      return 'assets/images/delta.png';
    }
    if (val == "OM" && val != null) {
      return 'assets/images/SalamAir.png';
    } else {
      return 'assets/images/SalamAir.png';
    }
  } else {
    return null;
  }
}

validate_dep(int index) {
  String? item = '1234';
  if (index != null) {
    item = flight_record.get(index)?.dep;
    // print(documentNumber[index]);

  } else if (index == null) {
    print('index is Null');
    item = 'null';
  } else if (flightTicket[index].ticketCode!.isEmpty) {
    dynamic? index = null;
  }
  return item;
}

validate_dis(int index) {
  String? item = '1234';
  if (index != null) {
    item = flight_record.get(index)?.dis;
    // print(documentNumber[index]);

  } else if (index == null) {
    print('index is Null');
    item = 'null';
  } else if (flightTicket[index].ticketCode!.isEmpty) {
    dynamic? index = null;
  }
  return item;
}

validate_firstName(int index) {
  String? item = '1234';
  if (index != null) {
    item = flight_record.get(index)?.firstName;
    // print(documentNumber[index]);

  } else if (index == null) {
    print('index is Null');
    item = 'null';
  } else if (flightTicket[index].ticketCode!.isEmpty) {
    dynamic? index = null;
  }
  return item;
}

validate_lastName(int index) {
  String? item = '1234';
  if (index != null) {
    item = flight_record.get(index)?.lastName;
    // print(documentNumber[index]);

  } else if (index == null) {
    print('index is Null');
    item = 'null';
  } else if (flightTicket[index].ticketCode!.isEmpty) {
    dynamic? index = null;
  }
  return item;
}

validate_flightNumber(int index) {
  String? item = '1234';
  if (index != null) {
    item = flight_record.get(index)?.flight_number;
    // print(documentNumber[index]);

  } else if (index == null) {
    print('index is Null');
    item = 'null';
  } else if (flightTicket[index].ticketCode!.isEmpty) {
    dynamic? index = null;
  }
  return item;
}

validate_bClass(int index) {
  String? item = '1234';
  if (index != null) {
    item = flight_record.get(index)?.b_class;
    // print(documentNumber[index]);

  } else if (index == null) {
    print('index is Null');
    item = 'null';
  } else if (flightTicket[index].ticketCode!.isEmpty) {
    dynamic? index = null;
  }
  return item;
}

validate_seat(int index) {
  String? item = '1234';
  if (index != null) {
    item = flight_record.get(index)?.seat;
    // print(documentNumber[index]);

  } else if (index == null) {
    print('index is Null');
    item = 'null';
  } else if (flightTicket[index].ticketCode!.isEmpty) {
    dynamic? index = null;
  }
  return item;
}

validate_date(int index) {
  String? item = '1234';
  if (index != null) {
    item = flight_record.get(index)?.createdDate;
    // print(documentNumber[index]);

  } else if (index == null) {
    print('index is Null');
    item = 'null';
  } else if (flightTicket[index].ticketCode!.isEmpty) {
    dynamic? index = null;
  }
  return item;
}

validate_airline(int index) {
  String? item = '1234';
  if (index != null) {
    item = flight_record.get(index)?.airline;
    if (item == "OV") {
      item = 'Salam Air';
    } else if (item == "DL") {
      item = 'Delta Air';
    } else {
      item = 'Airline';
    }
    // print(documentNumber[index]);

  } else if (index == null) {
    print('index is Null');
    item = 'null';
  } else if (flightTicket[index].ticketCode!.isEmpty) {
    dynamic? index = null;
  }
  return item;
}
