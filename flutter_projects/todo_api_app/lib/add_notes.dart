import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:todo_api_app/custome_buttons/textfield.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class addnotes extends StatefulWidget {
  final String? id;
  final String? initialTitle;
  final String? initialDescription;
  final String? initialDate;

  addnotes({this.id, this.initialTitle, this.initialDescription , this.initialDate});
  @override
  State<StatefulWidget> createState() => addnotestate();
}

class addnotestate extends State<addnotes> {
  var titlecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  bool isupdate = false;
  String currentdate = "";

  late final Map todo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.id != null) {
      isupdate = true;
      titlecontroller.text = widget.initialTitle ?? "";
      descriptioncontroller.text = widget.initialDescription ?? "";
      currentdate = widget.initialDate ?? DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    }
    currentdate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  }

  Future<void> adddata() async {
    //get data from form(user)
    final title = titlecontroller.text;
    final desc = descriptioncontroller.text;
    if (title.isNotEmpty && desc.isNotEmpty) {
      final body = {
        //send title and description to server
        "title": title,
        "description": desc,
        "is_completed": false,
        "created_at": currentdate
      };
      //submit data to server
      final url = 'https://api.nstack.in/v1/todos';
      final uri = Uri.parse(url);
      final response = await http.post(
        uri,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("successfully send message to server"),
            backgroundColor: Colors.green.shade100,
          ),
        );
        Navigator.pop(context);
        print(response.statusCode);
        print(response.body);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("error for send data to server"),
          backgroundColor: Colors.red.shade100,
        ),
      );
    }
  }

  //update data
  Future<void> updatedata(String id) async {
    //get data from form(user)
    // final id = todo['_id'];
    // if (widget.id == null) {
    //   print("you can not call update without data");
    //   return;
    // }
    final title = titlecontroller.text;
    final desc = descriptioncontroller.text;
    if(title.isEmpty || desc.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("empty data can't update"),
      backgroundColor: Colors.red.shade100,));
      return;
    }
    final body = {
      //send title and description to server
      "title": title,
      "description": desc,
      "is_completed": false,
      "created_at": currentdate

    };
    //update data

    final url = "https://api.nstack.in/v1/todos/$id";
    final uri = Uri.parse(url);
    final response = await http.put(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("successfully update message"),
          backgroundColor: Colors.green.shade100,
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("updation failed"),
          backgroundColor: Colors.red.shade100,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isupdate ? "Update Notes" : "Add Notes")),
      body: ListView(
        children: [
          textfield(
            controller: titlecontroller,
            labeltext: "Enter title",
            maxline: 1,
          ),
          SizedBox(height: 10),
          textfield(
            controller: descriptioncontroller,
            labeltext: "Enter Description",
            maxline: 5,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: isupdate ? ()=>updatedata(widget.id!)

                  :adddata,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: Text(isupdate ? "Update" : "Submit"),
            ),
          ),
        ],
      ),
    );
  }
}
