import 'package:flutter/cupertino.dart';

class SettingVm with ChangeNotifier {

  bool check = true;

  void checkChange(value){
    check = value;
    notifyListeners();
  }

}