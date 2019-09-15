import 'dart:convert';

import 'package:flutter_restfull_api/main.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<dynamic>> _get(String url) async{
    final response=await http.get(url);
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

  static Future<List<dynamic>> getUserList() async{
    return await _get('${Urls.BASE_API_URL}/users');
  }

  static Future<List<dynamic>> getPostList() async{
    return await _get('${Urls.BASE_API_URL}/posts');
  }

  static Future<dynamic> getPost(int postId) async{

    return await _get('${Urls.BASE_API_URL}/posts/$postId');
  }
  static Future<dynamic> getCommentsForPost(int postId) async{
    return await _get('${Urls.BASE_API_URL}/posts/$postId/comments');
  }

  static Future<bool> addPost(Map<String, dynamic> post) async {
    try{

      final response=await http.post('${Urls.BASE_API_URL}/posts', body: post);
      return response.statusCode==201;
    }catch(e){
      return false;
    }
  }

}