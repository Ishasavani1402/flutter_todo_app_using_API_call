import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DB_helper {
  //singltone(means ek hi object hota hai wo bhi static)

  DB_helper._(); //private constructore(because multiple instance nahi ho sakte hai database mai)

  static DB_helper getInstance() => DB_helper._();

  Database? mydb; //it can be null

  //db open (path -> if path exist then db open otherwise need to create database)

  static final TABLE_NAME = "tbl_user";
  static final C_NAME_USER_ID = "user_id";
  static final C_NAME_U_NAME = "user_name";
  static final C_NAME_MOBILE = "mobile_no";

  Future<Database> getdb() async {
    mydb ??= await opendb(); //here ??-> ke age ka null  hai to ?? ke bad ka execute hoga
    return mydb!;
    //above and below both are same
    // if (mydb != null) {
    //   return mydb!;
    // } else {
    //   mydb = await opendb();
    //   return mydb!;
    // }
  }

  Future<Database> opendb() async {
    Directory appdir = await getApplicationDocumentsDirectory();
    String dbpath = join(appdir.path, "notesDB.db");
    return await openDatabase(dbpath, onCreate: (db, version) {
      //create all your tables here
      db.execute(
          "create table $TABLE_NAME($C_NAME_USER_ID integer primary key autoincrement ,"
          " $C_NAME_U_NAME text not null,"
          "$C_NAME_MOBILE text )");

      //we can create here multiple tables
    }, version: 1);
  }

  //all queries
//1.insertion
  Future<bool> add_users(
      {required String u_name, required String mobile_number}) async {
    var get_db = await getdb();
    int row_affect = await get_db.insert(
        TABLE_NAME, {C_NAME_U_NAME: u_name, C_NAME_MOBILE: mobile_number});
    return row_affect > 0;
  }

//2.getdata from table

  Future<List<Map<String, dynamic>>> get_user_data() async {
    var get_db = await getdb();
    List<Map<String, dynamic>> mdata =
        await get_db.query(TABLE_NAME); //here we can also put where clause

    return mdata;
  }

//3.update data

  Future<bool> updatedata(
      {required int user_id,
      required String user_name,
      required user_mobile_number}) async {
    var get_db = await getdb();
    int rowaffect = await get_db.update(
        TABLE_NAME,
        {
          C_NAME_USER_ID: user_id,
          C_NAME_U_NAME: user_name,
          C_NAME_MOBILE: user_mobile_number
        },
        where: "$C_NAME_USER_ID = $user_id");
    return rowaffect > 0;
  }

//4.delete data

  Future<bool> deletedata({required int user_id}) async {
    var get_db = await getdb();
    int rowaffect =
        await get_db.delete(TABLE_NAME, where: "$C_NAME_USER_ID = $user_id");
    // int rowaffect = await get_db.delete(TABLE_NAME, where: "$C_NAME_USER_ID ?" , whereArgs: ['$user_id']);//alternate option of above line

    return rowaffect > 0;
  }
}
