import 'package:VWallet/data/test_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:sp_util/sp_util.dart';
import 'package:common_utils/common_utils.dart';

/*Future loyaltySaveList(String index, List<String> document) async {
  SpUtil.putStringList(index, document);
}

Future loyaltyLoadList(String index) async {
  List<Loyalty>? dataList = SpUtil.getObjList(
      index, (v) => Loyalty.fromJson(v as Map<String, dynamic>));
  LogUtil.e(
      "LoyaltyList: " + (dataList == null ? "null" : dataList.toString()));
  //loyalty = dataList!;
  //List<Loyalty> dataList= ;
}*/

void storeDocList(String index, List<String> document) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList(index, document);
}

Future<List<String>?> getDocList(int index) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? list_test = prefs.getStringList(index.toString());

  list_test!.forEach((element) {
    loyalty.add(Loyalty(documentNumber: element));
  });
  loyalty.forEach((element) {
    print(element);
  });
}

void storeCardHolderList(String index, List<String> document) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList(index, document);
}

Future<List<String>?> getCardHolderList(int index) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? list_test = prefs.getStringList(index.toString());

  list_test!.forEach((element) {
    loyalty.add(Loyalty(cardHolder: element));
  });
  loyalty.forEach((element) {
    print(element);
  });
}

clear() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
}
