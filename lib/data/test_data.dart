import 'package:flutter/cupertino.dart';

import 'shared_data.dart';

main() {
  //loyaltySaveList('saveList', loyalty);
  int i = loyalty.length;
  int x = documentNumber.length;

  print(documentNumber.length);
  //clear();
  print('-----------------------');

  for (i; i >= 0; i--) {
    if (loyalty.length > i) {
      documentNumber.add(loyalty[i].documentNumber);
      cardHolder.add(loyalty[i].cardHolder);
      createdDate.add(loyalty[i].createdDate);
      loyalty.removeAt(i);
    }
  }
  //print(documentNumber.length);
  /*documentNumber.forEach((element) {
    print(element);
  });*/

  //storeDocList('0', documentNumber);
  //storeCardHolderList('0', cardHolder);
  print('-----------------------');
  getDocList(0);
  print('-----------------------');
  getCardHolderList(0);

  //clear();
  //print(test);
  //print('-----------------------');
  //getDocumentList(loyalty[0].documentNumber);

  // print('loyalty: ${loyalty.length}');
}

class Loyalty {
  final String documentNumber;
  final String cardHolder;
  final String createdDate;

  const Loyalty({
    this.documentNumber = '',
    this.cardHolder = '',
    this.createdDate = '',
  });

  /// must.
  Loyalty.fromJson(Map<String, dynamic> json)
      : documentNumber = json['documentNumber'],
        cardHolder = json['cardHolder'],
        createdDate = json['createdDate'];

  /// must.
  Map<String, dynamic> toJson() => {
        'documentNumber': documentNumber,
        'CardHolder': cardHolder,
        'CreatedDate': createdDate,
      };

  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write("\"documentNumber\":\"$documentNumber\"");
    sb.write("\"cardHolder\":\"$cardHolder\"");
    sb.write("\"CreatedDate\":\"$createdDate\"");
    sb.write('}');
    return sb.toString();
  }

  void add(Loyalty loyalty) {}
}

List<Loyalty> loyalty = [
  Loyalty(
    documentNumber: '12345',
    cardHolder: 'Mohamed',
    createdDate: 'today',
  ),
  Loyalty(
    documentNumber: '123456789',
    cardHolder: 'Maher',
    createdDate: 'today_test',
  ),
];
List<String> documentNumber = [];
List<String> cardHolder = [];
List<String> createdDate = [];
List<String> test = [];

/*Map<String, dynamic> toJason() {
  return {
    'documentNumber': documentNumber,
    'cardHolder': cardHolder,
    'createdDate': createdDate,
  };
}

MapLoyalty.fromJson(Map<String,dynamic>json){
  documentNumber=json['documentNumber'];
  cardHolder=json['cardHolder'];
  createdDate=json['createdDate'];
}*/

List<String> images = [
  "assets/images/Shukran.png",
  "assets/images/The_Sultan_Center.png",
  "assets/images/loyalty defualt.png"
];
List<String> partners = ["Shukran", "Sultan"];

validate_docNum(int index) {
  if (loyalty.length > index) {
    String val = loyalty[index].documentNumber;
    if (val.substring(0, 4) == "1500" && loyalty.length > 0) {
      return partners[0];
    }
    if (val.substring(0, 4) == "8888" && val != null) {
      return partners[1];
    } else {
      return loyalty[index].documentNumber;
    }
  } else {
    return null;
  }
}

validate_image(int index) {
  if (loyalty.length > index) {
    String val = loyalty[index].documentNumber;
    if (val.substring(0, 4) == "1500") {
      return images[0];
    }
    if (val.substring(0, 4) == "8888") {
      return images[1];
    } else {
      return images[2];
      ;
    }
  } else {
    return null;
  }
}

validate_createdDate(int index) {
  if (loyalty.length > index) {
    String val = loyalty[index].createdDate;
    if (val != null) {
      return loyalty[index].createdDate;
    }
  } else {
    return null;
  }
}

validate_cardHolder(int index) {
  if (loyalty.length > index) {
    String val = loyalty[index].cardHolder;
    if (val != null) {
      return loyalty[index].cardHolder;
    }
  } else {
    return null;
  }
}

/*loadData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? json=prefs.getString('myKey');
  print('Loaded json: $json');
  if(json==null){
    print('No data in shared prefrences');
  } else{
    Map<String,dynamic>map=jsonDecode(json);
    print('map $map');
    final mapLoyalty=MapLoyalty.fromJson(map);
    print('Loyalty data: ${mapLoyalty.documentNumber},${mapLoyalty.cardHolder},${mapLoyalty.createdDate}');
  }

}

saveData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final data = Loyalty(
      documentNumber: '1234', cardHolder: 'mohamed', createdDate: 'today');
  String json = jsonEncode(data);
  print('Generated json: $json');
  prefs.setString('myKey', json)
}

clearData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  print('Data Cleared');
}*/
