import 'package:flutter/foundation.dart';

class ProfileVm with ChangeNotifier{

  int click = 0;

  void clickTab(index){
    click = index;
    notifyListeners();
  }

}