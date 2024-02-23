
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:talikhata/Model/usermodel.dart';


class ApiService{
  
 static Future<UserModel?> submitData(String name, String job) async {
    var response = await http.post(Uri.https('reqres.in', 'api/users'), body: {
      'name': name,
      'job': job,
    });
    var data = response.body;
    

    print(data);
    if (response.statusCode == 201) {
      //String responseString = response.body;
      //DataModel.fromJson(jsonDecode(data));
      return UserModel.fromJson(jsonDecode(data));
    } else
      return null;
  }



static Future<List?> read() async{

    const url = 'https://localhost:7281/api/KazirDorbar/get_All_User';
    final uri = Uri.parse(url);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body) as Map;
      //final result = responseBody['items'] as List;
      print(responseBody);
      return null;
    }
    else return null;
  }





}