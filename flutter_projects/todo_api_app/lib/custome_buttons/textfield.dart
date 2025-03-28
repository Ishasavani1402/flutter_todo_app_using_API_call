import 'package:flutter/material.dart';

class textfield extends StatelessWidget{
  final  TextEditingController controller;
  final String labeltext;
  final int maxline;
  textfield({
    required this.controller,
    required this.labeltext,
    required this.maxline
});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        maxLines: maxline,
        decoration: InputDecoration(
            labelText: labeltext,
            labelStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 15
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    width: 2,
                    color: Colors.white
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    width: 2,
                    color: Colors.white
                )

            )
        ),
      ),
    );
  }
}