import 'dart:math';

import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:roll_dice_project/qr_code_project.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dice1 = 1;
  var dice2 = 1;

  void diceroll() {
    setState(() {
      dice1 = Random().nextInt(6) + 1;
      dice2 = Random().nextInt(6) + 1;
    });
  }

  Future<void> simpledilog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text("Simple Alert"),
          icon: Icon(Icons.battery_alert),
          content: Text("please fill all field"),
          actions: [Text("cancel"), SizedBox(width: 100), Text("close")],
          backgroundColor: Colors.white,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Roll Dice"),
      // ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff581E1E), Color(0xff9B4848)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Roll the Dice",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                shadowColor: Colors.black,
                child: Container(
                  height: 200,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      colors: [Color(0xffeac9c9), Color(0xffDCD4D4)],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/dice-${dice1}.png",
                        width: 150,
                        height: 150,
                      ),
                      SizedBox(width: 15),
                      Image.asset(
                        "assets/images/dice-${dice2}.png",
                        width: 150,
                        height: 150,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                diceroll();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffc6aaaa),
                foregroundColor: Colors.black,
                shadowColor: Color(0xff550000),
                elevation: 10,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Roll Dice",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            //animatedbuttons
            // ausome dialogs
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: AnimatedButton(
                  text: 'warning',
                  color: Colors.yellowAccent,
                  buttonTextStyle: TextStyle(color: Colors.black ,
                  fontWeight: FontWeight.bold , fontSize: 15),
                  pressEvent: (){
                    AwesomeDialog(context: context , dialogType: DialogType.error ,
                    animType: AnimType.scale,
                    showCloseIcon: true,
                    title: "Warning",
                    desc: "this is warning to all junior developer.....",
                    //actions
                    btnCancelOnPress: (){},
                    btnOkOnPress: (){}).show();
                  }),
            ),



            ElevatedButton(
              onPressed: () {
                simpledilog();
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> qr_code_project()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffc6aaaa),
                foregroundColor: Colors.black,
                shadowColor: Color(0xff550000),
                elevation: 10,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Simple dailogbox",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return custome_diolog(context);
                  },
                );
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> qr_code_project()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffc6aaaa),
                foregroundColor: Colors.black,
                shadowColor: Color(0xff550000),
                elevation: 10,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "custom dialog box",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget custome_diolog(BuildContext context) {
  print("custome");
  return Dialog(
    backgroundColor: Colors.deepPurpleAccent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Stack(
      children: [
        Container(
          height: 300,
          padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(30),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.deepPurple
            //   )
            // ]
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                "Custom Dialog",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),
              Text(
                "asdfghjkljhgfdsaASDFGTHYJUKL.,KJHGFD",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("close"),
              ),
            ],
          ),
        ),
        Positioned(
          top: -40,
          child:CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 50,
              child: ClipRRect(
            // borderRadius: BorderRadius.circular(30),
            child: Image.asset("assets/images/dice-2.png"),
          ),
        ),
        )
      ],
    ),
  );
}
