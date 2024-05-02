import 'package:flutter/cupertino.dart';

class ShareDialogVM with ChangeNotifier{

  bool check = false;


  void checkTrue () {
    check = true;
    notifyListeners();
  }

  void checkFalse () {
    check = false;
    notifyListeners();
  }

}