import 'package:flutter/material.dart';
void main(){
  runApp(FlutterApp());
}

//this class represent how app will show(app kesa hoga like title ,theme etc.)
class FlutterApp extends StatelessWidget{
  const FlutterApp({super.key});


  @override
  Widget build(BuildContext context) {
    //app class object for run app
    return MaterialApp(
      title : "flutter app",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch:Colors.lime),
      home: FirstScreen(),
    );//Material for android device
  }
}

//class represent as a screen design
//when app run this class execute first
class FirstScreen extends StatelessWidget{
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //page design here Scaffold for android device
    return Scaffold(
      appBar: AppBar(
        title: Text("first screen will show look like this"),
        //here title need widget that because use here text widget
      ),
      body: Container(
        color: Colors.grey,
        height: double.infinity,//full height
        width: double.infinity,//full width
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            //if we use decoration then we use color inside of decoration
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(topLeft:
              Radius.circular(50) ,
                  topRight: Radius.circular(50)),
                border: Border.all(
                width: 4.5,
              color: Colors.black
            ),
                boxShadow:[
                  BoxShadow(blurRadius: 5.9 ,
                      color: Colors.white ,
                      spreadRadius: 5)
                ],
                // shape: BoxShape.rectangle
            ),
          ),
        ),
      ),
    );
  }

}