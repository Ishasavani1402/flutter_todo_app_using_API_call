import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class theme_provider extends ChangeNotifier{
  bool isdarkmode = false;


  void updatetheme({required bool value}){
    isdarkmode = value;
    notifyListeners();
  }

  bool get_thems()=> isdarkmode;
}