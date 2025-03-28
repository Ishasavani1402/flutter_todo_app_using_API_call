import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  List arr_color = [Colors.lightGreen ,
    Colors.purple,
    Colors.yellow,
    Colors.blue,
    Colors.cyan,
    Colors.greenAccent,
    Colors.pink];

  String output = "";
  void add(){
    setState(() {
      output = (10+20).toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:  Column(
        children: [
          SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.extent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 5,//COLUMN
                mainAxisSpacing: 5,//ROW
                children: [
                  Container(
                    color: arr_color[0],
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.lightGreen,
                  ),
                  Container(
                    color: Colors.purple,
                  ),
                  Container(
                    color: Colors.deepPurpleAccent,
                  ),
                  Container(
                    color: Colors.deepPurple,
                  ),
                  Container(
                    color: Colors.deepPurple,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.lightGreen,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 300,
            child: GridView.builder(itemBuilder: (context , index){
              return Container(
                color: arr_color[index],
              );
            },itemCount: arr_color.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
            ),
          )

          // SizedBox(
          //   height: 200,
          //   child: Padding(
          //     padding: const EdgeInsets.all(5.0),
          //     child: GridView.extent(maxCrossAxisExtent: 250,
          //     crossAxisSpacing: 5,
          //     mainAxisSpacing: 5,
          //     children: [
          //       Container(
          //         color: arr_color[0],
          //       ),
          //       Container(
          //         color: Colors.blue,
          //       ),
          //       Container(
          //         color: Colors.lightGreen,
          //       ),
          //       Container(
          //         color: Colors.purple,
          //       ),
          //       Container(
          //         color: Colors.deepPurpleAccent,
          //       ),
          //       Container(
          //         color: Colors.deepPurple,
          //       ),
          //       Container(
          //         color: Colors.blueGrey,
          //       ),
          //       Container(
          //         color: Colors.blue,
          //       ),
          //       Container(
          //         color: Colors.lightGreen,
          //       ),
          //     ],),
          //   ),
          // )
        ],
      ),







    );
  }
}