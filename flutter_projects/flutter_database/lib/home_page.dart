import 'package:flutter/material.dart';
import 'package:my_app/AddNotes.dart';
import 'package:my_app/data/local/DB_helper.dart';
import 'package:my_app/providers/db_provider.dart';
import 'package:my_app/light_dark_theme.dart';
import 'package:my_app/main.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<HomePage> {
  // var user_name_controller = TextEditingController();
  // var user_m_number_controller = TextEditingController();
  // List<Map<String, dynamic>> allstorednotes = [];
  // late DB_helper db_ref;//obj of db_helper

  @override
  void initState() {
    super.initState();
    context.read<db_provider>().getinitialnotes();
    // db_ref = DB_helper.getInstance()  ;
    // getnotes(); //jab page load hoga to database ka data show hoga..
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Screen Show Data",
        ),
        actions: [
          PopupMenuButton(itemBuilder:(_){
            return [
              PopupMenuItem(
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 20,),
                    Text("Settings")
                  ],
                ),onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> light_dark_theme()));
            }
                ,)];
          }),

        ],
      ),
      //all notes show here
      body: Center(
        child: Container(
          color: Colors.deepPurple.shade50,
          child: Consumer<db_provider>(builder: (ctx , provider , child) {
            List<Map<String, dynamic>> allstorednotes = provider.getnotes();
            return allstorednotes.isNotEmpty
                ? ListView.builder(
              itemCount: allstorednotes.length,
              itemBuilder: (context, index,) {
                return ListTile(
                  leading: Text(
                      '${index + 1}'),
                  title:
                  Text(allstorednotes[index][DB_helper.C_NAME_U_NAME]),
                  subtitle:
                  Text(allstorednotes[index][DB_helper.C_NAME_MOBILE]),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>
                                AddNotes(
                                  isupdate: true,
                                  // Corrected passing of argument
                                  username: allstorednotes[index][DB_helper
                                      .C_NAME_U_NAME],
                                  mobile: allstorednotes[index][DB_helper
                                      .C_NAME_MOBILE],
                                  u_id: allstorednotes[index][DB_helper
                                      .C_NAME_USER_ID],
                                )));
                            // setState(() {
                            //   user_name_controller.text = allstorednotes[index][DB_helper.C_NAME_U_NAME];
                            //   user_m_number_controller.text = allstorednotes[index][DB_helper.C_NAME_MOBILE];
                            // });
                            // showModalBottomSheet(
                            //     context: context,
                            //     builder: (context) {
                            //       //= to ke left side me .text means hum value ko set kar rahe hai.
                            //       return bottomsheetview(isupdate: true , u_id: allstorednotes[index][DB_helper.C_NAME_USER_ID]);
                            // });
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.blue.shade200,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            context.read<db_provider>().deletenotes(uid:allstorednotes[index]
                            [DB_helper.C_NAME_USER_ID],);
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.redAccent.shade200,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
                : Center(
              child: Text("No data found"),
            );
            }),
        ),
      ),
          floatingActionButton: FloatingActionButton(
           onPressed: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNotes()));
          // user_name_controller.clear();
          // user_m_number_controller.clear();
          // showModalBottomSheet(
          //     context: context,
          //     builder: (context) {
          //       return bottomsheetview();
          //     });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Widget bottomsheetview({bool isupdate = false , int u_id = 0}){
  //   return Container(
  //     padding: const EdgeInsets.all(10.0),
  //     height: double.maxFinite,
  //     width: double.maxFinite,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(20),
  //       color: Colors.deepPurple.shade50,
  //     ),
  //     child: Column(
  //       children: [
  //         Text(isupdate ?"Update Notes":
  //           "Add Notes",
  //           style: TextStyle(
  //             fontSize: 20,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         TextField(
  //           controller: user_name_controller,
  //           decoration: InputDecoration(
  //               labelText: "Enter your name",
  //               focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(20),
  //                   borderSide: BorderSide(color: Colors.deepPurple, width: 3)),
  //               enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(20),
  //                   borderSide: BorderSide(color: Colors.deepPurple))),
  //         ),
  //         // text_field("Enter name", user_name_controller),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         TextField(
  //           controller: user_m_number_controller,
  //           keyboardType: TextInputType.number,
  //           decoration: InputDecoration(
  //               labelText: "Enter your Mobile Number",
  //               focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(20),
  //                   borderSide: BorderSide(color: Colors.deepPurple, width: 3)),
  //               enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(20),
  //                   borderSide: BorderSide(color: Colors.deepPurple))),
  //         ),
  //         SizedBox(
  //           height: 30,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(10.0),
  //           child: Row(
  //             children: [
  //               Expanded(
  //                 child: OutlinedButton(
  //                   onPressed: () async {
  //                     var name = user_name_controller.text;
  //                     var number = user_m_number_controller.text;
  //                     if (name.isNotEmpty && number.isNotEmpty) {
  //                       bool check = isupdate ? await db_ref.updatedata(user_id: u_id, user_name: name, user_mobile_number: number)
  //                           : await db_ref.add_users(u_name: name, mobile_number: number);
  //                       if (check) {
  //                         getnotes();
  //                         setState(() {
  //
  //                         });
  //                       }
  //                       user_name_controller.clear();
  //                       user_m_number_controller.clear();
  //                       Navigator.pop(context);
  //                     } else {
  //                       showDialog(
  //                         context: context,
  //                         builder: (BuildContext context) {
  //                           return AlertDialog(
  //                             title: Text("Alert!!!"),
  //                             content: Text("please fill all information."),
  //                             contentTextStyle: TextStyle(
  //                                 fontWeight: FontWeight.bold,
  //                                 color: Colors.black),
  //                             actions: [
  //                               TextButton(
  //                                   onPressed: () {
  //                                     Navigator.pop(context);
  //                                   },
  //                                   child: Text("OK"))
  //                             ],
  //                           );
  //                         },
  //                       );
  //                     }
  //                   },
  //                   style: OutlinedButton.styleFrom(
  //                       side: BorderSide(width: 1),
  //                       // backgroundColor: Colors.purple.shade50,
  //                       foregroundColor: Colors.black),
  //                   child: Text(isupdate ? "Update":"Add",
  //                       style:
  //                       TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
  //                 ),
  //               ),
  //               SizedBox(
  //                 width: 120,
  //               ),
  //               Expanded(
  //                 child: OutlinedButton(
  //                   onPressed: ()  {
  //                     Navigator.pop(context);
  //                   },
  //                   style: OutlinedButton.styleFrom(
  //                       side: BorderSide(width: 1),
  //                       // backgroundColor: Colors.purple.shade50,
  //                       foregroundColor: Colors.black),
  //                   child: Text("Cancel",
  //                       style:
  //                       TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}