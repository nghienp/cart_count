import 'package:flutter/material.dart';

class MainScreenViewModel extends ChangeNotifier {
  int counter=0;

  void counterIncrement() {
    counter = counter + 1;
    notifyListeners();
  }
  void reset(){
    counter =0;
    notifyListeners();

  }
}
