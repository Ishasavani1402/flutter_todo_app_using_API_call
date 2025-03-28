import 'package:flutter/material.dart';
import 'package:my_app/data/local/DB_helper.dart';
import 'package:my_app/providers/db_provider.dart';
import 'package:my_app/home_page.dart';
import 'package:my_app/providers/theme_provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create:(context)=> db_provider(db_ref: DB_helper.getInstance()),),
    ChangeNotifierProvider(create: (context)=> theme_provider())
    
  ],
    child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: context.watch<theme_provider>().get_thems() ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
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

  var color = [Colors.redAccent , Colors.white30,
  Colors.redAccent.shade100 , Colors.blue , Colors.purple , Colors.lightBlue,
  Colors.deepPurpleAccent , Colors.orange , Colors.white24,
  Colors.black38 , Colors.grey , Colors.purpleAccent];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        //unbounded width
        body:Table(
          children: [
            TableRow(
              children: [
                Text("data"),
                Text("data"),
                Text("data"),Text("data"),Text("data"),
              ]
            ),
            TableRow(
                children: [
                  Text("data"),
                  Text("data"),
                  Text("data"),Text("data"),Text("data"),
                ]
            )
          ],
        )
    );
  }
}


//renderflow issues
// ListView(
// children: [
// ListView(
// shrinkWrap: true,
// physics: NeverScrollableScrollPhysics(),
// children: [
// Container(
// height: 50,
// width: double.infinity,
// color: color[0],
// ),
// Container(
// height: 50,
// width: double.infinity,
// color: color[1],
// ),
// Container(
// height: 50,
// width: double.infinity,
// color: color[2],
// ),
// Container(
// height: 50,
// width: double.infinity,
// color: color[3],
// ),
// Container(
// height: 50,
// width: double.infinity,
// color: color[4],
// ),
// Container(
// height: 50,
// width: double.infinity,
// color: color[5],
// ),
// Container(
// height: 50,
// width: double.infinity,
// color: color[6],
// ),
// Container(
// height: 50,
// width: double.infinity,
// color: color[7],
// ),
// Container(
// height: 50,
// width: double.infinity,
// color: color[9],
// ),
// ],
// ),
// Text("new list 👇"),
// ListView(
// shrinkWrap: true,
// physics: NeverScrollableScrollPhysics(),
// children: [
// Container(
// height: 100,
// width: double.infinity,
// color: color[0],
// ),
// Container(
// height: 100,
// width: double.infinity,
// color: color[1],
// ),
// Container(
// height: 100,
// width: double.infinity,
// color: color[2],
// ),
// Container(
// height: 100,
// width: double.infinity,
// color: color[3],
// ),
// Container(
// height: 100,
// width: double.infinity,
// color: color[4],
// ),
// Container(
// height: 100,
// width: double.infinity,
// color: color[5],
// ),
// Container(
// height: 100,
// width: double.infinity,
// color: color[6],
// ),
// Container(
// height: 100,
// width: double.infinity,
// color: color[7],
// ),
// Container(
// height: 100,
// width: double.infinity,
// color: color[9],
// ),
// ],
// )
// ],
// )