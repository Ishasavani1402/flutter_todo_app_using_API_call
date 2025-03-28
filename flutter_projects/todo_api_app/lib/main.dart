import 'package:flutter/material.dart';
import 'package:todo_api_app/add_notes.dart';
import 'package:todo_api_app/services/api_call_methods.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isloadng = true;
  bool isupdate = false;

  Future<void> navigation()async{
    var move = MaterialPageRoute(builder: (context) => addnotes());
    await Navigator.push(context, move);
    setState(() {
      fetchdatafromserver();
    });
  }

  Future<void> navigationupdate(String id , String title , String desc)async{
    var move = MaterialPageRoute(builder: (context) =>
        addnotes(id: id, initialTitle: title, initialDescription: desc,));
    await Navigator.push(context, move);
    setState(() {
      fetchdatafromserver();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchdatafromserver();
  }
  //get user's all data from server which is saved(get data)
  List todos = [];
  Future<void> fetchdatafromserver() async {
    final data = await api_call_methods.fetchdata();
    setState(() {
      todos = data;
      isloadng = false;
    });
  }

  //delete data
  Future<void> deletedata(String id)async{
    await api_call_methods.deletedatabyID(id);
    setState(() {
    todos = todos.where((element)=> element['_id']!=id).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TO DO APP"),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: Visibility(
        visible: isloadng,
        child: Center(child: CircularProgressIndicator(),),
        replacement : todos.isEmpty ? Center(child: Text("No data found "),):
        RefreshIndicator(
          onRefresh: fetchdatafromserver,
          child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context , index){
            final items = todos[index];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                color: Colors.grey.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadowColor: Colors.white,
                elevation: 3,
                child: ListTile(
                  // isThreeLine: true,
                  title: Text(items['title'], style: TextStyle(fontWeight: FontWeight.bold ,
                  fontSize: 20),),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(items['description'] , style: TextStyle(fontWeight: FontWeight.normal),),
                      SizedBox(height: 10,),
                      Text('${items['created_at']}' , style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 15 , color: Colors.white),),

                    ],
                  ),
                  trailing: SizedBox(
                    width: 50,
                    child: Row(
                        children: [
                          InkWell(onTap: (){
                            navigationupdate(items['_id'] , items['title'] , items['description']);
                          },
                              child: Icon(Icons.edit , color: Colors.white,size: 20,)),
                          SizedBox(
                            width: 2,
                          ),
                          InkWell(onTap: (){
                            //delete
                            deletedata(items['_id']);
                          },
                              child: Icon(Icons.delete , color: Colors.white,size: 20,))
                        ],
                      ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.white,shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50)
      ),
        onPressed: navigation,
        child: Icon(Icons.add, color: Colors.black,),
      ),
    );
  }
}
