import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class light_dark_theme extends StatelessWidget{
  bool isdarkmode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LIght Dark Theme"),
      ),
      body: Consumer<theme_provider>(builder: (ctx , provider , __){
        return SwitchListTile(onChanged: (value){
          provider.updatetheme(value: value);
        },
          value: provider.get_thems());
      })
    );
  }
}
