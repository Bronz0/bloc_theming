import 'dart:convert';

import 'package:bloc_theming/business_logic/infinite_list/models/post.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PostDataProvider {
  final http.Client httpClient;

  PostDataProvider({@required this.httpClient});

  Future<List<Post>> _fetchPosts(int startIndex, int limit) async {
    final response = await httpClient.get(
        'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawPost) {
        return Post(
          id: rawPost['id'],
          title: rawPost['title'],
          body: rawPost['body'],
        );
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
}
