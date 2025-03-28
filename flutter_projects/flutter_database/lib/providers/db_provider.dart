import 'package:flutter/material.dart';
import 'package:my_app/data/local/DB_helper.dart';

class db_provider extends ChangeNotifier{
  DB_helper db_ref;
  db_provider({required this.db_ref});
  List<Map<String , dynamic>> mdata  = [];

  //1. addnotes

void addnotes(String uname  , String mobile)async{
  bool check = await db_ref.add_users(u_name: uname, mobile_number: mobile);
  if(check){
    mdata = await db_ref.get_user_data();
    notifyListeners();
  }

}

  void updatenotes(int uid , String uname , String mobile)async{
    bool check = await db_ref.updatedata(user_id: uid, user_name: uname,
        user_mobile_number: mobile);
    if(check){
      mdata = await db_ref.get_user_data();
      notifyListeners();
    }

  }

  void deletenotes({required int uid})async{
    bool check = await db_ref.deletedata(user_id: uid);
    if(check){
      mdata = await db_ref.get_user_data();
      notifyListeners();
    }
  }

//2. getnotes

List<Map<String , dynamic>> getnotes()=> mdata;


void getinitialnotes()async{
  mdata = await db_ref.get_user_data();
  notifyListeners();
}
}