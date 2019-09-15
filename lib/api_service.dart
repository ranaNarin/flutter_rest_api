import 'dart:convert';

import 'package:flutter_restfull_api/main.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<dynamic>> getUserList() async{
    final response=await http.get('${Urls.BASE_API_URL}/users');
    try {
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    }catch(ex){
      print(ex);
      return null;
    }
  }
}