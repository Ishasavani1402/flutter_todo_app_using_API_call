import 'dart:convert';
import 'package:http/http.dart' as http;
class api_call_methods{

  static Future<List> fetchdata()async{
    var url = "https://api.nstack.in/v1/todos";
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    print("response.statusCode${response.statusCode}");
    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as Map;
      return json['items'] as List;
    }else{
      throw Exception("error");
    }
  }

  static Future<void> deletedatabyID(String id)async{
    //delete data from server
    final url = "https://api.nstack.in/v1/todos/$id";
    final uri = Uri.parse(url);
    var response = await http.delete(uri);
    if(response.statusCode != 200){
      throw Exception("error");
    }
  }

}