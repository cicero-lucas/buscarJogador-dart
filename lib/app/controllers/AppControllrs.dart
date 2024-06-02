import 'package:flutter/material.dart';

class Appcontrollrs extends ChangeNotifier{

  bool isMode=false;

  mudarStador(){
    isMode=!isMode;
    notifyListeners();
  }

}