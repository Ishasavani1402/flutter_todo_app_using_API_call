import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/providers/db_provider.dart';
import 'package:provider/provider.dart';

import 'data/local/DB_helper.dart';

class AddNotes extends StatelessWidget {
   bool isupdate;
   int u_id;
   String username;
   String mobile;
  var  user_name_controller = TextEditingController();
  var user_m_number_controller = TextEditingController();
  // DB_helper db_ref = DB_helper.getInstance();


  AddNotes({this.isupdate = false, this.u_id = 0, this.username = "", this.mobile = ""});
  @override
  Widget build(BuildContext context) {
    if(isupdate){
      user_name_controller.text = username;
      user_m_number_controller.text = mobile;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Added Notes"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepPurple.shade50,
        ),
        child: Column(
          children: [
            Text(
              isupdate ? "Update Notes" : "Add Notes",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: user_name_controller,
              decoration: InputDecoration(
                  labelText: "Enter your name",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 3)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.deepPurple))),
            ),
            // text_field("Enter name", user_name_controller),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: user_m_number_controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Enter your Mobile Number",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 3)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.deepPurple))),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        var name = user_name_controller.text;
                        var number = user_m_number_controller.text;
                        if (name.isNotEmpty && number.isNotEmpty) {
                          if(isupdate){
                            context.read<db_provider>().updatenotes(u_id, name, number);
                          }else{
                            context.read<db_provider>().addnotes(name, number);
                          }
                          Navigator.pop(context);
                          // bool check = isupdate
                          //     ? await db_ref.updatedata(
                          //         user_id: u_id,
                          //         user_name: name,
                          //         user_mobile_number: number)
                          //     : await db_ref.add_users(
                          //         u_name: name, mobile_number: number);
                          // if (check) {
                          //   Navigator.pop(context);
                          // }
                          user_name_controller.clear();
                          user_m_number_controller.clear();
                          // Navigator.pop(context);
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Alert!!!"),
                                content: Text("please fill all information."),
                                contentTextStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"))
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 1),
                          // backgroundColor: Colors.purple.shade50,
                          foregroundColor: Colors.black),
                      child: Text(isupdate ? "Update" : "Add",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 1),
                          // backgroundColor: Colors.purple.shade50,
                          foregroundColor: Colors.black),
                      child: Text("Cancel",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
