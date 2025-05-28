
import 'dart:convert';

import 'package:flutter_post_app/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_post_app/src/Data/models/post_model.dart';

class ApiService {

  //Get all posts
   Future<List<PostModel>> fetchPosts()async{
    try {
      final response = await http.get(Uri.parse(Endpoints.post));
      if(response.statusCode==200){
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((data)=> PostModel.fromJson(data)).toList();
      }else{
        throw Exception('Failed to load posts:${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching posts:$e');
    }
  }
}