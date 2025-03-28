import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      theme: ThemeData(
        //to remove cross line
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black26),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  var user_email = TextEditingController();
  var user_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var date_time = DateTime.now();//current time
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Container(
            width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(//text field for user input
                      keyboardType: TextInputType.text,
                      controller: user_email,
                      // enabled: false,
                      decoration: InputDecoration(//for make box
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: Colors.deepPurple,
                                width: 3
                            )
                        ),
                        enabledBorder: OutlineInputBorder(//focus hatane ke bad bhi shape visible hota hai
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: Colors.blue,
                                width: 3
                            )
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: Colors.black12,
                                width: 3
                            )

                        ),
                        prefixIcon: Icon(Icons.email_rounded),
                        hintText: "Enter your email_id"
                      )

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: user_password,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.deepPurple)
                          ),
                        prefixIcon: Icon(Icons.password ,
                          color: Colors.black),
                        hintText: "Enter Your Password"
                      ),
                    ),
                  ),
                  // Text("Current Time : ${date_time.hour} : ${date_time.minute} : "
                  //     "${date_time.millisecond} , Day : ${date_time.weekday}"),//without use intl library
                  ElevatedButton(onPressed:(){
                    String email = user_email.text.toString();
                    String password = user_password.text;
                    print("email : $email , password : $password");
                  },
                      child: Text("Submit" , style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,color: Colors.black),)
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("${DateFormat('yMMMMEEEEd').format(date_time)}",
                    style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                  ),//with use of intl library
                  Text("Show date" , style: TextStyle(fontSize: 15 ,
                  fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(onPressed:() async {
                      DateTime? date_picker = await showDatePicker(//?  for handle null value
                          context: context,
                          // initialDate: DateTime.now(),//current date
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2025));

                      if(date_picker != null){
                        print("Date Selected ${DateFormat('yMMMMEEEEd').format(date_picker)}");
                      }
                    },
                        child: Text("Set Date",
                        style: TextStyle(fontSize: 15,
                        fontWeight: FontWeight.bold ,
                        color: Colors.black),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(onPressed:() async {
                      TimeOfDay? time_picker = await showTimePicker(//?  for handle null value
                          context: context,
                          initialTime: TimeOfDay.now(),//current time
                          initialEntryMode: TimePickerEntryMode.input);

                      if(time_picker != null){
                        print("Time Selected ${time_picker.hour} : ${time_picker.minute}");
                      }
                    },
                        child: Text("Set Time",
                          style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold ,
                              color: Colors.black),)),
                  )
                ],
              )))
    );
  }
}


