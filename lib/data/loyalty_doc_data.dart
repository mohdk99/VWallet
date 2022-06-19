import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:barcode_widget/barcode_widget.dart';

List<String> documentNumber = [];
List<String> cardHolder = [];
List<String> createdDate = [];

List<String> partners = [
  "Shukran",
  "Sultan Rewards",
  'Ramez Rewards',
  'Oman Oil'
];

List<String> images = [
  "assets/images/Shukran.png",
  "assets/images/The_Sultan_Center.png",
  "assets/images/loyalty defualt.png",
  "assets/images/ramez.jpg",
  "assets/images/oman-oil.jpg"
];

dynamic test;
final DateTime now = DateTime.now();
final DateFormat formatter = DateFormat('dd/MM/yyyy');
final String formatted = formatter.format(now);

/*void main() {
  String test = documentNumber[0];
  //print(test.substring(0, 4));
  //print(createdDate[0]);
  print('-----------------------');
  documentNumber.forEach((documentNumber) {
    print(documentNumber);
  });
  print('-----------------------');
  print(documentNumber.remove('4568644'));
  print('-----------------------');
  documentNumber.forEach((documentNumber) {
    print(documentNumber);
  });
}*/
validate_docNum(int index) {
  if (documentNumber.length > index) {
    String val = documentNumber[index];
    if (val.substring(0, 4) == "1500" && documentNumber.length > 0) {
      return partners[0];
    }
    if (val.substring(0, 4) == "8888" && val != null) {
      return partners[1];
    }
    if (val.substring(0, 4) == "1010" && val != null) {
      return partners[2];
    }
    if (val.substring(0, 4) == "7000" && val != null) {
      return partners[3];
    } else {
      return documentNumber[index];
    }
  } else {
    return null;
  }
}

validate_image(int index) {
  if (documentNumber.length > index) {
    String val = documentNumber[index];
    if (val.substring(0, 4) == "1500") {
      return images[0];
    } else if (val.substring(0, 4) == "8888") {
      return images[1];
    } else if (val.substring(0, 4) == "1010" && val != null) {
      return images[3];
    } else if (val.substring(0, 4) == "7000" && val != null) {
      return images[4];
    } else {
      return images[2];
      ;
    }
  } else {
    return null;
  }
}

validate_createdDate(int index) {
  if (createdDate.length > 0) {
    String val = createdDate[index];
    if (val != null) {
      return createdDate[index];
    }
  } else {
    return null;
  }
}

validate_cardHolder(int index) {
  if (cardHolder.length > 0) {
    String val = createdDate[index];
    if (val != null) {
      return cardHolder[index];
    }
  }
  if (documentNumber.length > 0) {}
}

/*Future docNumList(List<String> docNumList) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setStringList('DocListData', docNumList);
}

Future<void> nameList(nameList) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setStringList('nameListData', nameList);
}

Future<void> dateList(dateList) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setStringList('dateListData', dateList);
}

getdata() async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  List<String> getStringList;('docListData');
}

class SaveData {
  static Future setDocNumList(List<String> docNumList) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList('DocListData', docNumList);
  }

  //static List<String>? getDocNumList() => pref.getStringList('DocListData');
}*/

//---------------------------------------------------------------------------------------------------------------------------
void main(List<String> args) {
  //clear();
  print('Document length: ${documentNumber.length}');
  print('Names length: ${cardHolder.length}');
  print('Dates length: ${createdDate.length}');

  print('-----------------------');

  int i = documentNumber.length;
  for (i; i >= 0; i--) {
    if (documentNumber.length > i) {
      saveDocumentNumber.add(documentNumber[i]);
      saveCardHolder.add(cardHolder[i]);
      saveCreatedDate.add(createdDate[i]);

      documentNumber.removeAt(i);
      cardHolder.removeAt(i);
      createdDate.removeAt(i);
    }
  }
  print('Document length after: ${documentNumber.length}');
  print('Names length after: ${cardHolder.length}');
  print('Dates length after: ${createdDate.length}');
  print('-----------------------');
  //clear();
  // storeDocList(0, saveDocumentNumber);
  // storeCardHolderList(1, saveCardHolder);
  //storeCreatedDateList(2, saveCreatedDate);
  getDocList();

  getCardHolderList();

  getCreatedDateList();

  print('-------------------');
  print('---------------------');
  print('-----------------------');
}

List<String> saveDocumentNumber = [];
List<String> saveCardHolder = [];
List<String> saveCreatedDate = [];

/*void storeDocList(int index, List<String> doc) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList(index.toString(), doc);
  print('doc saved');
}

Future<List<String>?> getDocList(int index) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? docSavedList = prefs.getStringList(index.toString());

  docSavedList!.forEach((element) {
    documentNumber.add(element);
  });
  print('Doc data: ${documentNumber[0]}');
  print('Document length: ${documentNumber.length}');
  print('doc loaded');
}

void storeCardHolderList(int index, List<String> doc) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList(index.toString(), doc);
  print('names saved');
}

Future<List<String>?> getCardHolderList(int index) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? cardHolderSavedList = prefs.getStringList(index.toString());

  cardHolderSavedList!.forEach((element) {
    cardHolder.add(element);
  });
  print('names data: ${cardHolder[0]}');
  print('Names length: ${cardHolder.length}');
  print('card holder loaded');
}

void storeCreatedDateList(int index, List<String> doc) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList(index.toString(), doc);
  print('dates saved');
}

Future<List<String>?> getCreatedDateList(int index) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? createdDateSavedList = prefs.getStringList(index.toString());

  createdDateSavedList!.forEach((element) {
    createdDate.add(element);
  });
  print('date data: ${createdDate[0]}');
  print('Dates length: ${createdDate.length}');
  print('dates loaded');
}

clear() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
  print('lists cleared');
}*/

/*void saveLists(
    List<String> doc, List<String> cardH, List<String> createdD) async {
  var sharedPreferences = await SharedPreferences.getInstance();

  sharedPreferences.setStringList('0', doc);
  sharedPreferences.setStringList('1', cardH);
  sharedPreferences.setStringList('2', createdD);
  print('lists saved');
}

Future<List<String>?> loadLists() async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? docSavedList = prefs.getStringList('0');
  List<String>? cardHolderSavedList = prefs.getStringList('3');
  List<String>? createdDateSavedList = prefs.getStringList('2');

  docSavedList!.forEach((element) {
    documentNumber.add(element);
  });
  cardHolderSavedList!.forEach((element) {
    cardHolder.add(element);
  });
  createdDateSavedList!.forEach((element) {
    createdDate.add(element);
  });
  print('lists loaded');
}*/

//-------------------------------------------------------------

void storeDocList(List<String> doc) async {
  final stopwatch = Stopwatch()..start();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('doc'.toString(), doc);
  print('Writing speed of loyalty data: ${stopwatch.elapsed}');
  print('doc saved');
}

Future<List<String>?> getDocList() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? docSavedList = prefs.getStringList('doc'.toString());

  docSavedList?.forEach((element) {
    documentNumber.add(element);
  });

  print('doc loaded');
}

void storeCardHolderList(List<String> doc) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('CH'.toString(), doc);
  print('names saved');
}

Future<List<String>?> getCardHolderList() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? cardHolderSavedList = prefs.getStringList('CH'.toString());

  cardHolderSavedList?.forEach((element) {
    cardHolder.add(element);
  });

  print('card holder loaded');
}

void storeCreatedDateList(List<String> doc) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList("date".toString(), doc);
  print('dates saved');
}

Future<List<String>?> getCreatedDateList() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? createdDateSavedList = prefs.getStringList('date'.toString());

  createdDateSavedList?.forEach((element) {
    createdDate.add(element);
  });
  print('dates loaded');
}

clear() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.containsKey('doc');
  await preferences.containsKey('CH');
  await preferences.containsKey('date');

  print('lists cleared');
}

update() {
  int i = documentNumber.length;

  if (saveDocumentNumber.length > 0 &&
      saveCardHolder.length > 0 &&
      saveCreatedDate.length > 0) {
    clear();
  }

  for (i; i >= 0; i--) {
    if (documentNumber.length > i &&
        cardHolder.length > i &&
        createdDate.length > i) {
      saveDocumentNumber.add(documentNumber[i]);
      saveCardHolder.add(cardHolder[i]);
      saveCreatedDate.add(createdDate[i]);

      documentNumber.removeAt(i);
      cardHolder.removeAt(i);
      createdDate.removeAt(i);
    }
  }
  if (saveDocumentNumber.length == 0 &&
      saveCardHolder.length == 0 &&
      saveCreatedDate.length == 0) {
    storeDocList(saveDocumentNumber);
    storeCardHolderList(saveCardHolder);
    storeCreatedDateList(saveCreatedDate);
  }

  print('New Data Stored');
}

update_noClear() {
  int i = documentNumber.length;

  for (i; i >= 0; i--) {
    if (documentNumber.length > i &&
        cardHolder.length > 0 &&
        createdDate.length > 0) {
      saveDocumentNumber.add(documentNumber[i]);
      saveCardHolder.add(cardHolder[i]);
      saveCreatedDate.add(createdDate[i]);

      documentNumber.removeAt(i);
      cardHolder.removeAt(i);
      createdDate.removeAt(i);
    }
  }
  storeDocList(saveDocumentNumber);
  storeCardHolderList(saveCardHolder);
  storeCreatedDateList(saveCreatedDate);
}

delete_lists() {
  documentNumber.clear();
  print('doc deleted');
  cardHolder.clear();
  print('names deleted');
  createdDate.clear();
  print('dates deleted');
}

delete_saved_list() {
  saveDocumentNumber.clear();
  print('saved doc deleted');
  saveCardHolder.clear();
  print('saved names deleted');
  saveCreatedDate.clear();
  print('saved dates deleted');
}

load_loyalty_lists() {
  getDocList();

  getCardHolderList();

  getCreatedDateList();
}

update_test() {
  if (saveDocumentNumber.length > 0 &&
      saveCardHolder.length > 0 &&
      saveCreatedDate.length > 0) {
    clear();
  }

  if (documentNumber.length > 0 &&
      cardHolder.length > 0 &&
      createdDate.length > 0) {
    documentNumber.forEach((element) {
      saveDocumentNumber.add(element);
    });
    cardHolder.forEach((element) {
      saveCardHolder.add(element);
    });
    createdDate.forEach((element) {
      saveCreatedDate.add(element);
    });
    print('data added');
  }

  if (saveDocumentNumber.length == 0 &&
      saveCardHolder.length == 0 &&
      saveCreatedDate.length == 0) {
    storeDocList(saveDocumentNumber);
    storeCardHolderList(saveCardHolder);
    storeCreatedDateList(saveCreatedDate);
  }

  print('New Data Stored');
}

update_test2() {
  int i = documentNumber.length;
  if (saveDocumentNumber.length > 0 &&
      saveCardHolder.length > 0 &&
      saveCreatedDate.length > 0) {
    clear();
    delete_saved_list();
  }

  for (i; i >= 0; i--) {
    if (documentNumber.length > i &&
        cardHolder.length > 0 &&
        createdDate.length > 0) {
      saveDocumentNumber.insert(0, documentNumber[i]);
      saveCardHolder.insert(0, cardHolder[i]);
      saveCreatedDate.insert(0, createdDate[i]);
      print('$i data addeded');
    }
  }

  storeDocList(saveDocumentNumber);
  storeCardHolderList(saveCardHolder);
  storeCreatedDateList(saveCreatedDate);
  print(saveCardHolder.length);
}
