
import 'dart:convert';

import 'package:http/http.dart' as http;


class ApiService{

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